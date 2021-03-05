import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:xetia_shop/ui/landing_page/sign_in_ui.dart';

class LandingLottieController extends GetxController {
  RxInt _pageNumber = 0.obs;

  set pageNumber(value) => this._pageNumber.value = value;

  get pageNumber => this._pageNumber.value;

  void changeToSignIn() {
    Get.off(SignInUI());
    pageNumber = 0;
  }
}
