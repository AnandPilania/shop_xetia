import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/db/_db.dart';
import 'package:xetia_shop/language/_components.dart';
import 'package:xetia_shop/models/_model.dart';
import 'package:xetia_shop/networks/_network.dart';
import 'package:xetia_shop/ui/components/_components.dart';

import '_controllers.dart';

class LogoutController extends GetxController {
  SignInController signInController = Get.put(SignInController());
  LandingPageController loginController = Get.find<LandingPageController>();
  HeaderHomeController headerHomeController = Get.find<HeaderHomeController>();
  String accessToken, refreshToken;
  int id;
  AuthV2 authV2 = AuthV2();

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

    // if (id != null) {
    try {
      AuthResponse res = await authV2
          .logoutRequestV2(tokenAccess: accessToken, tokenRefresh: refreshToken)
          .catchError((onError) {
        loading.hide();
        Get.snackbar(kAlert.tr, kLogoutFailed.tr,
            snackPosition: SnackPosition.BOTTOM);
        print(onError);
      });
      if (res.meta.code == 200) {
        headerHomeController.changeHeader(position: 0, isSwiped: false);
        loginController.loginMethod = LoginMethods.Unchosen;
        signInController.changeLoginState(false);
        await UserProvider.db.deleteUser(id);
        Get.snackbar(kAlert.tr, res.meta.message,
            snackPosition: SnackPosition.BOTTOM);
        Get.offAll(signInController.hasLoggedIn);
      } else {
        loading.hide();
        Get.snackbar(kAlert.tr, res.meta.message,
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print("error $e");
    }
    // } else {
    //   headerHomeController.changeHeader(position: 0, isSwiped: false);
    //   loginController.loginMethod = LoginMethods.Unchosen;
    //   signInController.changeLoginState(false);
    //   Get.snackbar(kAlert.tr, "User Logout",
    //       snackPosition: SnackPosition.BOTTOM);
    //   Get.offAll(signInController.hasLoggedIn);
    // }
  }
}
