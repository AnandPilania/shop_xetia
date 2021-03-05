import 'package:get/get.dart';

class ToggleController extends GetxController {
  final RxBool _isGridView = true.obs;

  set isGridView(value) => this._isGridView.value = value;
  bool get isGridView => this._isGridView.value;
}
