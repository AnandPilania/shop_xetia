import 'package:get/state_manager.dart';

class BottomNavBarController extends GetxController {
  final RxInt _currentBottomBar = 0.obs;
  set currentBottomBar(value) => this._currentBottomBar.value = value;
  get currentBottomBar => this._currentBottomBar.value;
}
