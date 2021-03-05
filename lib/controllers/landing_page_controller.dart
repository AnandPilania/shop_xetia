import 'package:get/get.dart';
import 'package:xetia_shop/constants/_constants.dart';

class LandingPageController extends GetxController {
  Rx<LoginMethods> _loginMethod = LoginMethods.Unchosen.obs;

  set loginMethod(value) => this._loginMethod.value = value;
  get loginMethod => this._loginMethod.value;
}
