import 'package:get/get.dart';
import 'package:xetia_shop/constants/_constants.dart';

class LandingPageController extends GetxController {
  RxBool _isLogin = true.obs;
  Rx<LoginMethods> _loginMethod = LoginMethods.Unchosen.obs;
  RxBool _subscribeEmail = false.obs;

  set isLogin(value) => this._isLogin.value = value;
  get isLogin => this._isLogin.value;

  set loginMethod(value) => this._loginMethod.value = value;
  get loginMethod => this._loginMethod.value;

  set subscribeEmail(value) => this._subscribeEmail.value = value;
  get subscribeEmail => this._subscribeEmail.value;

  void toggle() {
    _isLogin.toggle();
  }
}
