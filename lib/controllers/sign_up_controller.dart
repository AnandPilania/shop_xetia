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
  RxBool isObscure = true.obs;
  LoadingOverlay loading;
  Auth auth = Auth();
  final _landingPageController = Get.find<LandingPageController>();

  @override
  void onInit() {
    firstName = TextEditingController();
    lastName = TextEditingController();
    email = TextEditingController();
    pass = TextEditingController();
    super.onInit();
  }

  void changeObscure(bool val) {
    isObscure(val);
  }

  void resSignUp({@required BuildContext context}) async {
    loading = LoadingOverlay.of(context);

    loading.show();

    await auth
        .registerRequest(firstName.text, lastName.text, email.text, pass.text)
        .then((AuthResponse value) {
      loading.hide();
      if (value.meta.code == 200) {
        Get.snackbar('Alert', value.meta.message,
            colorText: context.theme.primaryColorLight);
        firstName.clear();
        lastName.clear();
        email.clear();
        pass.clear();
        _landingPageController.setMethod(
            methods: LoginMethods.Unchosen,
            textColor: context.theme.primaryColorLight);
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

  @override
  void onClose() {
    firstName?.dispose();
    lastName?.dispose();
    email?.dispose();
    pass?.dispose();
    super.onClose();
  }
}
