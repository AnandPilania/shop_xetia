import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResendEmailTokenController extends GetxController {
  TextEditingController resendEmail = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    resendEmail.dispose();
    super.dispose();
  }
}
