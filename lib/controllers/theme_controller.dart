import 'package:get/state_manager.dart';

class ThemeController extends GetxController {
  RxBool isDarkTheme = false.obs;

  void changeTheme() {
    isDarkTheme(!isDarkTheme.value);
  }
}
