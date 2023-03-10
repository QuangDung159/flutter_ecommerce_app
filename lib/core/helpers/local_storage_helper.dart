import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageHelper {
  LocalStorageHelper._internal();

  static final _shared = LocalStorageHelper._internal();

  factory LocalStorageHelper() {
    return _shared;
  }

  Box<dynamic>? hiveBox;

  static initLocalStorage() async {
    _shared.hiveBox = await Hive.openBox('App');
  }

  static dynamic getValue(String key) {
    return _shared.hiveBox?.get(key);
  }

  static setValue(String key, dynamic val) {
    _shared.hiveBox?.put(key, val);
  }
}
