import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:get/get.dart';

class TokenTimeController extends GetxController {
  final _isTicking = false.obs;
  set isTicking(value) => this._isTicking.value = value;
  get isTicking => this._isTicking.value;

  CountdownTimerController controller;
  CurrentRemainingTime timeController;

  void startController() {
    isTicking = true;
    controller = CountdownTimerController(endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 5, onEnd: endTicking);
  }

  void endTicking() {
    isTicking = false;
    controller.disposeTimer();
  }
}
