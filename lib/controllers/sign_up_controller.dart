import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/models/_model.dart';
import 'package:xetia_shop/networks/_network.dart';
import 'package:xetia_shop/ui/components/_components.dart';

class SignUpController extends GetxController {
  TextEditingController firstName;
  TextEditingController lastName;
  TextEditingController email;
  TextEditingController pass;
  TextEditingController validatePass;
  TextEditingController token;

  RxBool _isObscure = true.obs;
  RxBool _isValidateObscure = true.obs;
  LoadingOverlay loading;
  AuthV2 authV2 = AuthV2();
  TokenTimeController tokenTimeController = Get.put(TokenTimeController());
  LandingPageController _landingPageController =
      Get.find<LandingPageController>();

  set isObscure(value) => this._isObscure.value = value;
  get isObscure => this._isObscure.value;

  set isValidateObscure(value) => this._isValidateObscure.value = value;
  get isValidateObscure => this._isValidateObscure.value;

  @override
  void onInit() {
    firstName = TextEditingController();
    lastName = TextEditingController();
    email = TextEditingController();
    pass = TextEditingController();
    validatePass = TextEditingController();
    token = TextEditingController();
    super.onInit();
  }

  void resSignUp({@required BuildContext context}) async {
    loading = LoadingOverlay.of(context);
    loading.show();
    await authV2
        .registerRequestV2(
      first: firstName.text,
      last: lastName.text,
      email: email.text,
      password: pass.text,
    )
        .then((AuthResponse value) {
      loading.hide();
      if (value.meta.code == 200) {
        // Get.snackbar('Alert', value.meta.message,
        //     colorText: context.theme.primaryColorLight);
        firstName.clear();
        lastName.clear();
        // email.clear();
        pass.clear();
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
        .verifyEmail(email: email.text, verifyT: token.text)
        .then((AuthResponse value) {
      loading.hide();
      if (value.meta.code == 200) {
        Get.snackbar('Alert', value.meta.message,
            colorText: context.theme.primaryColorLight);
        email.clear();
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

  @override
  void onClose() {
    firstName?.dispose();
    lastName?.dispose();
    email?.dispose();
    pass?.dispose();
    validatePass?.dispose();
    token?.dispose();
    super.onClose();
  }
}
