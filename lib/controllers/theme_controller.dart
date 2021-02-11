import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:xetia_shop/utils/utils.dart';

class ThemeController extends GetxController {
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    if (box.read('darkmode') == null) {
      box.write('darkmode', false);
    }
  }

  RxBool get isDark {
    bool isDarkTheme = box.read('darkmode');
    return isDarkTheme.obs;
  }

  ThemeData get theme => isDark.value ? Themes.dark : Themes.light;
  void changeTheme(bool val) => box.write('darkmode', val);
}
