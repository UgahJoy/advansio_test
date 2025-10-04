import 'dart:developer';
import 'package:advansio_test_mobile/global_variables/global_variables.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiRequests {
  ApiRequests({required this.key, this.showProgressLoader});
  final String key;
  final bool? showProgressLoader;
  final String _baseUrl = "";
  final Dio _client = Dio();
  final int _timeout = 60;

  Future<dynamic> getRequst({bool isFull = false}) async {
    showProgress();
    try {
      var response = await _client.get(
        _baseUrl,
        options: Options(headers: await _getHeader()),
      );

      if (response.statusCode == 401) {
        // autoLogout();
        return null;
      }
      if (response.statusCode == 400 || response.statusCode == 500) {
        return response.data;
      }

      return response.data;
    } on DioException catch (e) {
      log("Dio Error on GET: ${e.message}");

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return "failed";
      }

      if (e.response != null) {
        if (e.response!.statusCode == 401) {
          // autoLogout();
          return null;
        }
        return e.response!.data;
      }

      return "failed";
    } catch (ex) {
      log("General Error on GET: ${ex.toString()}");
      return "failed";
    } finally {
      hideProgresss();
    }
  }

  Future<dynamic> postRequst({
    required dynamic data,
    bool isFull = false,
  }) async {
    // Set Dio options locally for this request
    _client.options.connectTimeout = Duration(seconds: _timeout);
    _client.options.receiveTimeout = Duration(seconds: _timeout);

    // Determine the final URL
    final url = isFull ? key : _baseUrl + key;

    // showProgresss();

    try {
      final headers = await _getHeader();

      var response = await _client.post(
        url,
        data: data,
        options: Options(headers: headers),
      );

      if (response.statusCode == 401) {
        // autoLogout();
        return null;
      }
      if (response.statusCode == 400 || response.statusCode == 500) {
        return response.data;
      }

      return response.data;
    } on DioException catch (e) {
      log("Dio Error on POST: ${e.message}");

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return "failed";
      }

      if (e.response != null) {
        if (e.response!.statusCode == 401) {
          // autoLogout();
          return null;
        }
        return e.response!.data;
      }

      return "failed";
    } catch (ex) {
      log("General Error on POST: ${ex.toString()}");
      return "failed";
    } finally {
      hideProgresss();
    }
  }

  Future<Map<String, String>> _getHeader() async {
    return {
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Connection': 'keep-alive',
    };
  }

  void showProgress() async {
    if (showProgressLoader!) {
      showProgress();
    }
  }

  void hideProgresss() async {
    if (showProgressLoader!) {
      Navigator.pop(navigatorKey.currentContext!);
    }
  }
}
