import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  RxInt currentBottomBar = 0.obs;

  void changeBottomBarPosition(int position) {
    currentBottomBar(position);
  }
}
