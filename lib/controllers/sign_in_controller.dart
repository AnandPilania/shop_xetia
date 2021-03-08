import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/constants/sign_in.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/db/_db.dart';
import 'package:xetia_shop/db/model/user.dart';
import 'package:xetia_shop/language/_components.dart';
import 'package:xetia_shop/models/_model.dart';
import 'package:xetia_shop/networks/_network.dart';
import 'package:xetia_shop/ui/_ui.dart';
import 'package:xetia_shop/ui/components/_components.dart';

class SignInController extends GetxController {
  LoadingOverlay loading;
  final box = GetStorage();
  AuthV2 authV2 = AuthV2();

  final TextFieldController _textFieldController = Get.find();

  @override
  void onInit() {
    if (box.read(kHasLoggedIn) == null) {
      box.write(kHasLoggedIn, false);
    }
    if (box.read(kShowOnBoard) == null) {
      box.write(kShowOnBoard, true);
    }
    print("Has loggin status: " + box.read(kHasLoggedIn).toString());
    // isSignInGmail();
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

  Future<UserDatabase> insertToDb(SignInResponseV2 value, bool isOauth) async {
    UserDatabase user = UserDatabase(
      id: 1,
      role: value.user.userEntities.length != 0 ? value.user.userEntities[0].role : 1,
      isOauthDB: isOauth ? 1 : 0,
      entityId: value.user.userEntities.length != 0 ? value.user.userEntities[0].entity : "77e1e824-3d10-4487-81d0-f43639d42bb5",
      entityName: value.user.userEntities.length != 0 ? value.user.userEntities[0].entityName : "Toko Indonesia",
      entityType: value.user.userEntities.length != 0 ? value.user.userEntities[0].entityType : "shop",
      userId: value.user.id,
      first: value.user.firstName,
      last: value.user.lastName,
      photo: value.user.imageUrl != null
          ? value.user.imageUrl
          : "https://i.pinimg.com/originals/29/47/9b/29479ba0435741580ca9f4a467be6207.png",
      refreshToken: value.tokens.refresh,
      accessToken: value.tokens.access,
    );

    return await UserProvider.db.insertUser(user);
    // print(user.id);
  }

  void reSignInV2({@required BuildContext context}) async {
    loading = LoadingOverlay.of(context);

    loading.show();

    await authV2
        .signInRequest(email: _textFieldController.email.text, password: _textFieldController.pass.text)
        .then((SignInResponseV2 value) {
      loading.hide();
      print(value.meta.message.toString());

      if (value.meta.code == 200) {
        _textFieldController.email.clear();
        _textFieldController.email.clear();
        _textFieldController.pass.clear();
        insertToDb(value, false);
        changeLoginState(true);
        Get.offAll(HomeUI());
        Get.snackbar(kAlert.tr, value.meta.message, snackPosition: SnackPosition.BOTTOM);
      } else if (value.meta.code == 408) {
        // exception untuk apabila tidak ada internet

        Get.snackbar(kAlert.tr, value.meta.message, snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar(kAlert.tr, value.meta.message, snackPosition: SnackPosition.BOTTOM);
      }
      print(value.meta.message);
    }).catchError((onError) {
      loading.hide();
      Get.snackbar(kAlert.tr, kSignInFailed.tr, snackPosition: SnackPosition.BOTTOM);
      print(onError);
    });
  }

  void isSignInGmail() async {
    if (await kGoogleSignIn.isSignedIn()) {
      kGoogleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) async {
        GoogleSignInAuthentication googleSignInAuthentication = await account.authentication;
        SignInResponseV2 value = SignInResponseV2(
            user: User(
                id: account.id,
                firstName: account.displayName,
                lastName: account.displayName,
                imageUrl: account.photoUrl,
                userEntities: []),
            tokens: TokensV2(access: googleSignInAuthentication.accessToken, refresh: googleSignInAuthentication.idToken));
        UserDatabase user = await insertToDb(value, true);
        changeLoginState(true);
        print("ok");
        print(user.id);

        Get.offAll(HomeUI());
        Get.snackbar(kAlert.tr, value.meta.message, snackPosition: SnackPosition.BOTTOM);
      });
    }
  }

  void signInGmail() async {
    try {
      GoogleSignInAccount googleSignIn = await kGoogleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication = await googleSignIn.authentication;
      SignInResponseV2 value = SignInResponseV2(
          user: User(
              id: googleSignIn.id,
              firstName: googleSignIn.displayName,
              lastName: googleSignIn.displayName,
              imageUrl: googleSignIn.photoUrl,
              userEntities: []),
          tokens: TokensV2(access: googleSignInAuthentication.accessToken, refresh: googleSignInAuthentication.idToken));
      UserDatabase user = await insertToDb(value, true);
      print(user);
      changeLoginState(true);

      Get.offAll(HomeUI());
      Get.snackbar(kAlert.tr, "Sing In Berhasil", snackPosition: SnackPosition.BOTTOM);
    } catch (error) {
      Get.snackbar(kAlert.tr, kSignInFailed.tr, snackPosition: SnackPosition.BOTTOM);
      print("Error: $error");
    }
  }
}
