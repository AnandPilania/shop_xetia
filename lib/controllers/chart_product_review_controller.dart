import 'package:get/state_manager.dart';

class ChartProductReviewController extends GetxController {
  RxInt currentTouchedIndex = 0.obs - 1;

  void changeTouchedIndex(int position) {
    currentTouchedIndex(position);
  }
}
