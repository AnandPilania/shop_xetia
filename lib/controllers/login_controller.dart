import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/models/_model.dart';
import 'package:xetia_shop/networks/_network.dart';
import 'package:xetia_shop/ui/_ui.dart';
import 'package:xetia_shop/ui/components/_components.dart';

class LoginController extends GetxController {
  TextEditingController email;
  TextEditingController pass;
  LoadingOverlay loading;

  @override
  void onInit() {
    // TODO: implement onInit
    email = TextEditingController();
    pass = TextEditingController();
    super.onInit();
  }

  void resLogin({@required BuildContext context}) async {
    loading = LoadingOverlay.of(context);

    loading.show();
    Auth auth = Auth();

    auth.loginRequest(email.text, pass.text).then((LoginResponse value) {
      loading.hide();
      if (value.meta.code == 200) {
        Get.snackbar('Alert', value.meta.message,
            snackPosition: SnackPosition.BOTTOM);
        Get.off(HomeUI());
      } else {
        Get.snackbar('Alert', value.meta.message,
            snackPosition: SnackPosition.BOTTOM);
      }
      print(value.meta.message);
    }).catchError((onError) {
      loading.hide();
      Get.snackbar('Alert', "Login Failed",
          snackPosition: SnackPosition.BOTTOM);

      print(onError);
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    email?.dispose();
    pass?.dispose();
    super.onClose();
  }
}
