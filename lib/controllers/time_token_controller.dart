import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:get/get.dart';

import '_controllers.dart';

class TokenTimeController extends GetxController {
  final ToggleController _toggleController = Get.find();
  CountdownTimerController controller;
  CurrentRemainingTime timeController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void startController() {
    _toggleController.isTicking = true;
    controller = CountdownTimerController(
        endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 180,
        onEnd: endTicking);
  }

  void endTicking() {
    _toggleController.isTicking = false;
    controller.disposeTimer();
  }
}
