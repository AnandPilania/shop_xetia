import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/utils/_utils.dart';

class ThemeController extends GetxController {
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    if (box.read(kDarkMode) == null) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
      box.write(kDarkMode, false);
    } else {
      if (box.read(kDarkMode) == true) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));
      } else {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent));
      }
    }
  }

  RxBool get isDark {
    bool isDarkTheme = box.read(kDarkMode);
    return isDarkTheme.obs;
  }

  ThemeData get theme => isDark.value ? Themes.dark : Themes.light;
  void changeTheme(bool val) {
    if (val == true) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    }
    box.write(kDarkMode, val);
  }
}
