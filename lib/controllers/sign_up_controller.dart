import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/models/_model.dart';
import 'package:xetia_shop/networks/_network.dart';
import 'package:xetia_shop/ui/components/_components.dart';
import 'package:xetia_shop/utils/_utils.dart';

class SignUpController extends GetxController {
  LoadingOverlay loading;
  AuthV2 authV2 = AuthV2();
  final TokenTimeController tokenTimeController =
      Get.put(TokenTimeController());
  final LandingPageController _landingPageController = Get.find();
  final TextFieldController _textFieldController = Get.find();
  final ToggleController _toggleController = Get.find();

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
        _toggleController.isLogin = _toggleController.isLogin.toggle();
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
        _toggleController.isLogin = true;
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

  void resRequestEmailVerify({@required BuildContext context}) async {
    loading = LoadingOverlay.of(context);
    loading.show();
    await authV2
        .reqVerifyEmail(email: _textFieldController.resendEmail.text)
        .then((AuthResponse value) {
      loading.hide();
      if (value.meta.code == 200) {
        FocusScope.of(context).unfocus();
        _textFieldController.resendEmail.clear();

        _landingPageController.loginMethod = LoginMethods.Register3;
        tokenTimeController.startController();
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
