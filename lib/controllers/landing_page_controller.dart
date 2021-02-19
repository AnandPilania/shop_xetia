import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/_constants.dart';

class LandingPageController extends GetxController {
  RxBool isLogin = true.obs;
  Rx<LoginMethods> loginMethod = LoginMethods.Unchosen.obs;
  RxBool subscribeEmail = false.obs;

  void toggle() {
    isLogin.toggle();
  }

  void subscribe(value) {
    subscribeEmail(value);
  }

  void setMethod({LoginMethods methods, Color textColor}) {
    loginMethod(methods);
    if (!Get.isSnackbarOpen) {
      Get.snackbar("Login Methods", methods.toString(), colorText: textColor);
    } else {
      Get.back();
      Get.snackbar("Login Methods", methods.toString());
    }
  }
}
