import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/ui/components/_components.dart';

class RecoveryController extends GetxController {
  TextEditingController recovery;
  LoadingOverlay loading;

  @override
  void onInit() {
    recovery = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    recovery.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    recovery?.dispose();
    super.onClose();
  }
}
