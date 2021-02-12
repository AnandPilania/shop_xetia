import 'package:get/state_manager.dart';

class BestSellerController extends GetxController {
  RxBool isGridView = true.obs;

  void changeView(bool condition) {
    isGridView(condition);
  }
}
