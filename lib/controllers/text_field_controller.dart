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

  TextEditingController messageTextFieldController;

  TextEditingController recovery;
  TextEditingController recoverPassword;
  TextEditingController resendEmail;

  TextEditingController firstName;
  TextEditingController lastName;
  TextEditingController emailSignUp;
  TextEditingController passSignUp;
  TextEditingController validatePass;
  TextEditingController token;

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

    messageTextFieldController = TextEditingController();

    recovery = TextEditingController();
    recoverPassword = TextEditingController();
    resendEmail = TextEditingController();

    firstName = TextEditingController();
    lastName = TextEditingController();
    emailSignUp = TextEditingController();
    passSignUp = TextEditingController();
    validatePass = TextEditingController();
    token = TextEditingController();
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

    messageTextFieldController.dispose();

    recovery.dispose();
    recoverPassword.dispose();
    resendEmail.dispose();

    firstName.dispose();
    lastName.dispose();
    emailSignUp.dispose();
    passSignUp.dispose();
    validatePass.dispose();
    token.dispose();
  }
}
