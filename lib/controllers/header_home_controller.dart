import 'package:get/state_manager.dart';

class HeaderHomeController extends GetxController {
  RxString currentHeader = "Shop".obs;
  RxInt currentBarHeader = 0.obs;
  void changeHeader(String homeHeader, int position) {
    currentHeader(homeHeader);
    currentBarHeader(position);
  }
}
