import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/models/_model.dart';
import 'package:xetia_shop/networks/_network.dart';
import 'package:xetia_shop/ui/_ui.dart';
import 'package:xetia_shop/ui/components/_components.dart';

class SignInController extends GetxController {
  TextEditingController email;
  TextEditingController pass;
  LoadingOverlay loading;
  final box = GetStorage();

  @override
  void onInit() {
    // TODO: implement onInit
    email = TextEditingController();
    pass = TextEditingController();
    if (box.read(kHasLoggedIn) == null) {
      box.write(kHasLoggedIn, false);
    }
    super.onInit();
  }

  RxBool get loggedIn {
    bool isHasLoggedIn = box.read(kHasLoggedIn);
    return isHasLoggedIn.obs;
  }

  Widget get hasLoggedIn => loggedIn.value ? HomeUI() : SignInUI();

  void changeLoginState(bool val) => box.write(kHasLoggedIn, val);

  void resSignIn({@required BuildContext context}) async {
    loading = LoadingOverlay.of(context);

    loading.show();
    Auth auth = Auth();

    auth.signInRequest(email.text, pass.text).then((SignInResponse value) {
      loading.hide();
      if (value.meta.code == 200) {
        Get.snackbar('Alert', value.meta.message,
            snackPosition: SnackPosition.BOTTOM);
        Get.off(HomeUI());
        changeLoginState(true);
      } else {
        Get.snackbar('Alert', value.meta.message,
            snackPosition: SnackPosition.BOTTOM);
      }
      print(value.meta.message);
    }).catchError((onError) {
      loading.hide();
      Get.snackbar('Alert', "SignIn Failed",
          snackPosition: SnackPosition.BOTTOM);

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
