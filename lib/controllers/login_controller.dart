import 'package:get/get.dart';
import '../constants/enums.dart';

class LoginController extends GetxController {
  RxBool isLogin = true.obs;
  Rx<LoginMethods> loginMethod = LoginMethods.Unchosen.obs;
  RxBool subscribeEmail = false.obs;

  void toggle() {
    isLogin.toggle();
  }

  void subscribe(value) {
    subscribeEmail(value);
  }

  void setMethod(LoginMethods methods) {
    loginMethod(methods);
    if (!Get.isSnackbarOpen) {
      Get.snackbar("Login Methods", methods.toString());
    } else {
      Get.back();
      Get.snackbar("Login Methods", methods.toString());
    }
  }
}
