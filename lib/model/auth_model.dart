import 'dart:convert';

class AuthModel {
  final String? fullName;
  final String? email;
  final String? pwd;
  String? pin;
  AuthModel({this.email, this.fullName, this.pwd, this.pin});

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        email: json['email'],
        fullName: json['fullName'],
        pwd: json['pwd'],
        pin: json['pin'],
      );

  Map<String, dynamic> toJson() =>
      {'email': email, 'fullName': fullName, 'pwd': pwd, 'pin': pin};

  get getString => jsonEncode(toJson());
}
