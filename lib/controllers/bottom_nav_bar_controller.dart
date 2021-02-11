import 'package:get/state_manager.dart';

class BottomNavBarController extends GetxController {
  RxInt currentBottomBar = 0.obs;

  void changeBottomBarPosition(int position) {
    currentBottomBar(position);
  }
}
