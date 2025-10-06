import 'package:advansio_test_mobile/model/auth_model.dart';
import 'package:advansio_test_mobile/model/news_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appState = ChangeNotifierProvider((ref) => AppState(ref));

class AppState with ChangeNotifier {
  final Ref ref;
  Map<String, List<AllNewsModel>> allNews = {};
  AuthModel? currentLogedInUser;
  AppState(this.ref);

  void setNew(String countrySuffix, List<AllNewsModel> news) {
    allNews[countrySuffix] = news;
    notifyListeners();
  }

  void setCurrentUser(AuthModel logedInUser) {
    currentLogedInUser = logedInUser;
    notifyListeners();
  }
}
