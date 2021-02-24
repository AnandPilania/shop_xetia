import 'package:get/state_manager.dart';

class ChartProductReviewController extends GetxController {
  RxInt _currentTouchedIndex = 0.obs - 1;

  set currentTouchedIndex(value) => this._currentTouchedIndex.value = value;
  get currentTouchedIndex => this._currentTouchedIndex.value;
}
