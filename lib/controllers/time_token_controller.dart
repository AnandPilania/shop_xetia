import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:get/get.dart';

class TokenTimeController extends GetxController {
  CountdownTimerController controllerSignUp;
  CountdownTimerController controllerPassChange;

  RxBool _isTickingSignUp = false.obs;
  set isTickingSignUp(value) => this._isTickingSignUp.value = value;
  get isTickingSignUp => this._isTickingSignUp.value;

  RxBool _isTickingPassChange = false.obs;
  set isTickingPassChange(value) => this._isTickingPassChange.value = value;
  get isTickingPassChange => this._isTickingPassChange.value;

  void startControllerSignUp() {
    isTickingSignUp = true;
    controllerSignUp = CountdownTimerController(endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 180, onEnd: endTickingSignUp);
  }

  void endTickingSignUp() {
    isTickingSignUp = false;
    controllerSignUp.disposeTimer();
  }

  void startControllerPassChange() {
    isTickingPassChange = true;
    controllerPassChange =
        CountdownTimerController(endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 300, onEnd: endTickingPassChange);
  }

  void endTickingPassChange() {
    isTickingPassChange = false;
    controllerPassChange.disposeTimer();
  }
}
