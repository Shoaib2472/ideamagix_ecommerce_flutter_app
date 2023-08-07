import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static void setData(String key, dynamic value) => GetStorage().write(key, value);

  static int getInt(String key) => GetStorage().read(key) ?? 0;

  static String getString(String key) => GetStorage().read(key) ?? '';

  static bool getBool(String key) => GetStorage().read(key) ?? false;

  static double getDouble(String key) => GetStorage().read(key) ?? 0.0;

  static dynamic getData(String key) => GetStorage().read(key);

  static void clearData() async => GetStorage().erase();
}