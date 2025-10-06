import 'dart:convert';

import 'package:advansio_test_mobile/model/auth_model.dart';
import 'package:advansio_test_mobile/storage/local_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepository = Provider((ref) => AuthRepository(ref));

class AuthRepository {
  final Ref ref;
  AuthRepository(this.ref);

  Future<void> createNewAccount(AuthModel authModel) async {
    var allUsers = getRegisteredUsers();
    allUsers.add(authModel);
    await LocalStorage.storeData(
        key: LocalStorage.registeredUserDataKey,
        value: jsonEncode(allUsers.map((user) => user.toJson()).toList()));
    return;
  }

  List<AuthModel> getRegisteredUsers() {
    String? storedUser =
        LocalStorage.retriveData(LocalStorage.registeredUserDataKey);
    if (storedUser != null) {
      return (jsonDecode(storedUser) as List)
          .map((e) => AuthModel.fromJson(e))
          .toList();
    }

    return [];
  }

  Future<void> setAccountPin(AuthModel authModel) async {
    var allUsers = getRegisteredUsers();
    int index = allUsers
        .indexOf(allUsers.firstWhere((val) => val.email == authModel.email));
    allUsers[index] = authModel;
    await LocalStorage.storeData(
        key: LocalStorage.registeredUserDataKey,
        value: jsonEncode(allUsers.map((user) => user.toJson()).toList()));
    return;
  }
}
