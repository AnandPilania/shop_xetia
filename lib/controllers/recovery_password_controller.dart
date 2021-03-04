import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecoveryPasswordController extends GetxController {
  TextEditingController recoverPassword = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    recoverPassword.dispose();
    super.dispose();
  }
}
