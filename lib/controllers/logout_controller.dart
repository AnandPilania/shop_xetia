import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/db/_db.dart';
import 'package:xetia_shop/db/model/user.dart';
import 'package:xetia_shop/models/_model.dart';
import 'package:xetia_shop/networks/_network.dart';
import 'package:xetia_shop/ui/_ui.dart';
import 'package:xetia_shop/ui/components/_components.dart';

import '_controllers.dart';

class LogoutController extends GetxController {
  SignInController signInController = Get.put(SignInController());
  LandingPageController loginController = Get.find<LandingPageController>();
  HeaderHomeController headerHomeController = Get.find<HeaderHomeController>();
  String accessToken, refreshToken;
  int id;
  Auth auth = Auth();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getToken();
  }

  void getToken() async {
    final user = await UserProvider.db.getUser();

    print("Token Access ${user.accessToken}");
    accessToken = user.accessToken;
    refreshToken = user.refreshToken;
    id = user.id;
  }

  void logout({@required context}) async {
    LoadingOverlay loading = LoadingOverlay.of(context);

    loading.show();

    try {
      await auth
          .logoutRequest(accessToken, refreshToken)
          .then((AuthResponse value) {
        print("message response ${value.meta.message}");
        if (value.meta.code == 200) {
          headerHomeController.changeHeader(position: 0, isSwiped: false);
          loginController.loginMethod = LoginMethods.Unchosen;
          signInController.changeLoginState(false);
          Get.snackbar('Alert', value.meta.message,
              snackPosition: SnackPosition.BOTTOM);
          Get.off(OnBoardingPage());
        } else {
          loading.hide();
          Get.snackbar('Alert', value.meta.message,
              snackPosition: SnackPosition.BOTTOM);
        }
      }).catchError((onError) {
        loading.hide();
        Get.snackbar('Alert', "Logout Failed",
            snackPosition: SnackPosition.BOTTOM);

        print(onError);
      });
      ;
      await UserProvider.db.deleteUser(id);
    } catch (e) {
      print("error $e");
    }
  }
}
