import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/ui/components/login_method/_component.dart';

import '../constants/enums.dart';

class LoginController extends GetxController {
  RxBool isLogin = true.obs;
  Rx<LoginMethods> loginMethod = LoginMethods.Unchosen.obs;
  RxBool subscribeEmail = false.obs;

  final List<Widget> loginMethodWidget = [
    EmailLogin(),
    FacebookLogin(),
    AppleLogin(),
    GmailLogin(),
    DisplayMethod(),
  ];

  Widget getMethodWidget() => loginMethodWidget[loginMethod.value.index];

  void toggle() {
    isLogin.toggle();
  }

  void subscribe(value) {
    subscribeEmail(value);
  }

  void setMethod(LoginMethods methods) {
    loginMethod(methods);
    if (!Get.isSnackbarOpen) {
      Get.snackbar("Login Methods", methods.toString());
    } else {
      Get.back();
      Get.snackbar("Login Methods", methods.toString());
    }
  }
}
