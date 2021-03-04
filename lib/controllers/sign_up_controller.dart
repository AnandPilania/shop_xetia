import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/models/_model.dart';
import 'package:xetia_shop/networks/_network.dart';
import 'package:xetia_shop/ui/components/_components.dart';

class SignUpController extends GetxController {
  RxBool _isObscure = true.obs;
  RxBool _isValidateObscure = true.obs;
  LoadingOverlay loading;
  AuthV2 authV2 = AuthV2();
  TokenTimeController tokenTimeController = Get.put(TokenTimeController());
  LandingPageController _landingPageController = Get.find();
  final TextFieldController _textFieldController = Get.find();

  set isObscure(value) => this._isObscure.value = value;

  get isObscure => this._isObscure.value;

  set isValidateObscure(value) => this._isValidateObscure.value = value;

  get isValidateObscure => this._isValidateObscure.value;

  void resSignUp({@required BuildContext context}) async {
    loading = LoadingOverlay.of(context);
    loading.show();
    await authV2
        .registerRequestV2(
      first: _textFieldController.firstName.text,
      last: _textFieldController.lastName.text,
      email: _textFieldController.emailSignUp.text,
      password: _textFieldController.passSignUp.text,
    )
        .then((AuthResponse value) {
      loading.hide();
      if (value.meta.code == 200) {
        // Get.snackbar('Alert', value.meta.message,
        //     colorText: context.theme.primaryColorLight);
        _textFieldController.firstName.clear();
        _textFieldController.lastName.clear();
        // email.clear();
        _textFieldController.passSignUp.clear();
        FocusScope.of(context).unfocus();
        _landingPageController.loginMethod = LoginMethods.Register3;
        tokenTimeController.startController();
        // _landingPageController.loginMethod = LoginMethods.Unchosen;
        _landingPageController.toggle();
      } else if (value.meta.code == 408) {
        Get.snackbar('Alert', value.meta.message,
            colorText: context.theme.primaryColorLight);
      } else {
        Get.snackbar('Alert', value.meta.message,
            colorText: context.theme.primaryColorLight);
      }
      print(value.meta.message);
    }).catchError((onError) {
      loading.hide();
      Get.snackbar('Alert', "Sign Up Failed",
          colorText: context.theme.primaryColorLight);
      print(onError);
    });
  }

  void resEmailVerify({@required BuildContext context}) async {
    loading = LoadingOverlay.of(context);
    loading.show();
    await authV2
        .verifyEmail(
            email: _textFieldController.emailSignUp.text,
            verifyT: _textFieldController.token.text)
        .then((AuthResponse value) {
      loading.hide();
      if (value.meta.code == 200) {
        Get.snackbar('Alert', value.meta.message,
            colorText: context.theme.primaryColorLight);
        _textFieldController.emailSignUp.clear();
        _landingPageController.isLogin = true;
        _landingPageController.loginMethod = LoginMethods.Unchosen;
      } else if (value.meta.code == 408) {
        Get.snackbar('Alert', value.meta.message,
            colorText: context.theme.primaryColorLight);
      } else {
        Get.snackbar('Alert', value.meta.message,
            colorText: context.theme.primaryColorLight);
      }
      print(value.meta.message);
    }).catchError((onError) {
      loading.hide();
      Get.snackbar('Alert', "Email Verify Failed",
          colorText: context.theme.primaryColorLight);
      print(onError);
    });
  }
}
