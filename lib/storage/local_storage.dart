import 'package:advansio_test_mobile/global_variables/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

mixin LocalStorage {
  static Future<void> getInstance() async {
    await Hive.initFlutter(appName);
    await Hive.openBox(appName);
  }

  static Future<void> storeData(
      {required String key, required String value}) async {
    final box = Hive.box(appName);
    return box.put(key, value);
  }

  static String? retriveData(String key) {
    final box = Hive.box(appName);
    return box.get(key, defaultValue: null);
  }

  static const registeredUserDataKey = "REGISTER_USER_DATA_KEY";
  static const firstTimer = "FIRST_TIMER";
}
