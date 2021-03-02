import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/db/_db.dart';
import 'package:xetia_shop/db/model/user.dart';
import 'package:xetia_shop/language/_components.dart';
import 'package:xetia_shop/models/_model.dart';
import 'package:xetia_shop/networks/_network.dart';
import 'package:xetia_shop/ui/_ui.dart';
import 'package:xetia_shop/ui/components/_components.dart';

class SignInController extends GetxController {
  RxBool _isObscure = true.obs;

  LoadingOverlay loading;
  final box = GetStorage();
  AuthV2 authV2 = AuthV2();

  set isObscure(value) => this._isObscure.value = value;

  get isObscure => this._isObscure.value;

  TextEditingController email;
  TextEditingController pass;

  @override
  void onInit() {
    email = TextEditingController();
    pass = TextEditingController();
    if (box.read(kHasLoggedIn) == null) {
      box.write(kHasLoggedIn, false);
    }
    if (box.read(kShowOnBoard) == null) {
      box.write(kShowOnBoard, true);
    }
    print("Has loggin status: " + box.read(kHasLoggedIn).toString());
    super.onInit();
  }

  RxBool get _loggedIn {
    bool isHasLoggedIn = box.read(kHasLoggedIn);
    return isHasLoggedIn.obs;
  }

  RxBool get _showOnBoard {
    bool showOnBoard = box.read(kShowOnBoard);
    return showOnBoard.obs;
  }

  Widget get hasLoggedIn => _loggedIn.value
      ? HomeUI()
      : _showOnBoard.value
          ? OnBoardingPage()
          : SignInUI();

  void changeLoginState(bool val) {
    box.write(kHasLoggedIn, val);
    print("Has loggin status updated: " + box.read(kHasLoggedIn).toString());
  }

  void changeOnBoardState(bool val) => box.write(kShowOnBoard, val);

  void insertToDb(SignInResponseV2 value) async {
    UserDatabase user = UserDatabase(
      id: 1,
      role: value.user.userEntities[0].role,
      roleName: "",
      roleDescription: "",
      entityId: value.user.userEntities[0].entity,
      entityName: value.user.userEntities[0].entityName,
      entityType: value.user.userEntities[0].entityType,
      userId: value.user.id,
      first: value.user.firstName,
      last: value.user.lastName,
      photo: value.user.imageUrl != null
          ? value.user.imageUrl
          : "https://i.pinimg.com/originals/29/47/9b/29479ba0435741580ca9f4a467be6207.png",
      refreshToken: value.tokens.refresh,
      accessToken: value.tokens.access,
    );

    await UserProvider.db.insertUser(user);
    print(user.id);
  }

  void reSignInV2({@required BuildContext context}) async {
    loading = LoadingOverlay.of(context);

    loading.show();

    await authV2
        .signInRequest(email: email.text, password: pass.text)
        .then((SignInResponseV2 value) {
      loading.hide();
      print(value.meta.message.toString());

      if (value.meta.code == 200) {
        email.clear();
        pass.clear();
        insertToDb(value);
        changeLoginState(true);
        Get.offAll(HomeUI());
        Get.snackbar(kAlert.tr, value.meta.message,
            snackPosition: SnackPosition.BOTTOM);
      } else if (value.meta.code == 408) {
        // exception untuk apabila tidak ada internet

        Get.snackbar(kAlert.tr, value.meta.message,
            snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar(kAlert.tr, value.meta.message,
            snackPosition: SnackPosition.BOTTOM);
      }
      print(value.meta.message);
    }).catchError((onError) {
      loading.hide();
      Get.snackbar(kAlert.tr, kSignInFailed.tr,
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
