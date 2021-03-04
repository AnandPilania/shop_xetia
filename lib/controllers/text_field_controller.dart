import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldController extends GetxController {
  TextEditingController productNameController;
  TextEditingController categoryController;
  TextEditingController priceController;
  TextEditingController minimumOrderController;
  TextEditingController weightController;
  TextEditingController heightController;

  TextEditingController email;
  TextEditingController pass;

  @override
  void onInit() {
    super.onInit();
    productNameController = TextEditingController();
    categoryController = TextEditingController();
    priceController = TextEditingController();
    minimumOrderController = TextEditingController();
    weightController = TextEditingController();
    heightController = TextEditingController();

    email = TextEditingController();
    pass = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    categoryController.dispose();
    priceController.dispose();
    minimumOrderController.dispose();
    weightController.dispose();
    heightController.dispose();

    email.dispose();
    pass.dispose();
  }
}
