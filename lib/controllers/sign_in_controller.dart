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

class SignInController extends GetxController {
  TextEditingController email;
  TextEditingController pass;
  RxBool _isObscure = true.obs;
  LoadingOverlay loading;
  final box = GetStorage();
  Auth auth = Auth();

  set isObscure(value) => this._isObscure.value = value;
  get isObscure => this._isObscure.value;
  // User user;
  bool isLoading = false;

  //
  // void getUserData() async {
  //   final user = await UserProvider.db.getUser();
  //   print(user.accessToken);
  //   print(user.accessToken);
  //   this.user = user;
  // }

  @override
  void onInit() {
    // TODO: implement onInit
    email = TextEditingController();
    pass = TextEditingController();
    // getUserData();
    if (box.read(kHasLoggedIn) == null) {
      box.write(kHasLoggedIn, false);
    }

    super.onInit();
  }

  RxBool get _loggedIn {
    bool isHasLoggedIn = box.read(kHasLoggedIn);
    return isHasLoggedIn.obs;
  }

  Widget get hasLoggedIn => _loggedIn.value ? HomeUI() : OnBoardingPage();

  void changeLoginState(bool val) => box.write(kHasLoggedIn, val);

  void insertToDb(SignInResponse value) async {
    User user = User(
      id: 1,
      role: 1,
      roleName: value.userRoles[0].roleName,
      roleDescription: value.userRoles[0].roleDescription,
      entityId: value.entityId,
      entityName: value.entityName,
      entityType: value.entityType,
      userId: value.userId,
      first: value.firstName,
      last: value.lastName,
      photo: value.imageUrl != null
          ? value.imageUrl
          : "https://i.pinimg.com/originals/29/47/9b/29479ba0435741580ca9f4a467be6207.png",
      refreshToken: value.tokens.refresh,
      accessToken: value.tokens.access,
    );
    await UserProvider.db.insertUser(user);
  }

  void resSignIn({@required BuildContext context}) async {
    loading = LoadingOverlay.of(context);

    loading.show();

    await auth
        .signInRequest(email.text, pass.text)
        .then((SignInResponse value) {
      loading.hide();
      if (value.meta.code == 200) {
        insertToDb(value);
        Get.snackbar('Alert', value.meta.message,
            snackPosition: SnackPosition.BOTTOM);
        Get.off(HomeUI());
        // insertToDb(value);
        changeLoginState(true);
      } else if (value.meta.code == 408) {
        // exception untuk apabila tidak ada internet

        Get.snackbar('Alert', value.meta.message,
            snackPosition: SnackPosition.BOTTOM);
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

  // void resSignOut({@required BuildContext context}) async {
  //   loading = LoadingOverlay.of(context);
  //
  //   loading.show();
  //   Auth auth = Auth();
  //
  //   await auth
  //       .logoutRequest(user.accessToken, user.refreshToken)
  //       .then((AuthResponse value) {
  //     loading.hide();
  //     if (value.meta.code == 200) {
  //       Get.snackbar('Alert', value.meta.message,
  //           snackPosition: SnackPosition.BOTTOM);
  //       Get.offAll(SignInUI());
  //       changeLoginState(false);
  //     } else {
  //       Get.snackbar('Alert', value.meta.message,
  //           snackPosition: SnackPosition.BOTTOM);
  //     }
  //     print(value.meta.message);
  //   }).catchError((onError) {
  //     loading.hide();
  //     Get.snackbar('Alert', "Sign Out Failed",
  //         snackPosition: SnackPosition.BOTTOM);
  //
  //     print(onError);
  //   });
  // }

  @override
  void onClose() {
    // TODO: implement onClose
    email?.dispose();
    pass?.dispose();
    super.onClose();
  }
}
