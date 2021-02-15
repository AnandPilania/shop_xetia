import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/models/_model.dart';
import 'package:xetia_shop/networks/_network.dart';
import 'package:xetia_shop/ui/_ui.dart';

class LoginController extends GetxController {
  TextEditingController email;
  TextEditingController pass;

  @override
  void onInit() {
    // TODO: implement onInit
    email = TextEditingController();
    pass = TextEditingController();
    super.onInit();
  }

  void resLogin() async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    Auth auth = Auth();

    auth.loginRequest(email.text, pass.text).then((LoginResponse value) {
      Get.snackbar('Response', value.meta.message);
      Get.off(HomeUI());
      print(value.meta.message);
    }).catchError((onError) {
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
