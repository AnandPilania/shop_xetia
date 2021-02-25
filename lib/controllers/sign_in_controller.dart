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
  bool isLoading = false;

  @override
  void onInit() {
    // TODO: implement onInit
    email = TextEditingController();
    pass = TextEditingController();
    if (box.read(kHasLoggedIn) == null) {
      box.write(kHasLoggedIn, false);
    }
    if (box.read(kShowOnBoard) == null) {
      box.write(kShowOnBoard, true);
    }

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

  void changeLoginState(bool val) => box.write(kHasLoggedIn, val);
  void changeOnBoardState(bool val) => box.write(kShowOnBoard, val);

  void insertToDb(SignInResponse value) async {
    bool isInsert = true;
    int i = 0;

    while (isInsert) {
      User user = User(
        id: i,
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

      User res = await UserProvider.db.insertUser(user);
      if (!res.isBlank) {
        print("ok");
        isInsert = false;
      }
      i++;
    }
  }

  void resSignIn({@required BuildContext context}) async {
    loading = LoadingOverlay.of(context);

    loading.show();

    await auth.signInRequest(email.text, pass.text).then((SignInResponse value) {
      loading.hide();
      if (value.meta.code == 200) {
        insertToDb(value);
        Get.snackbar('Alert', value.meta.message, snackPosition: SnackPosition.BOTTOM);
        Get.off(HomeUI());
        // insertToDb(value);
        changeLoginState(true);
      } else if (value.meta.code == 408) {
        // exception untuk apabila tidak ada internet

        Get.snackbar('Alert', value.meta.message, snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar('Alert', value.meta.message, snackPosition: SnackPosition.BOTTOM);
      }
      print(value.meta.message);
    }).catchError((onError) {
      loading.hide();
      Get.snackbar('Alert', "SignIn Failed", snackPosition: SnackPosition.BOTTOM);

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
