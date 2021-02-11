import 'package:get/state_manager.dart';

class BestSellerController extends GetxController {
  RxBool isGridView = true.obs;
  RxInt currentBarHeader = 0.obs;

  void changeView(bool condition) {
    isGridView(condition);
  }
}
