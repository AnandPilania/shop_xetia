import 'package:get/state_manager.dart';

class BestSellerController extends GetxController {
  final RxBool _isGridView = true.obs;

  set isGridView(value) => this._isGridView.value = value;
  get isGridView => this._isGridView.value;
}
