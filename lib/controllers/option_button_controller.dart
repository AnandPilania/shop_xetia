import 'package:get/get.dart';

class OptionButtonController extends GetxController {
  List weights = ["Gram", "Kilogram"];
  RxString _weight = "Gram".obs;

  void setWeight(value) => this._weight.value = value;

  get weight => this._weight.value;

  List heights = ["Cm", "Feet"];
  RxString _height = "Cm".obs;

  void setHeight(value) => this._height.value = value;

  get height => this._height.value;

  RxString _post = "Rp.10.000-Rp.25.000".obs;

  void setPost(value) => this._post.value = value;

  get post => this._post.value;

  List posts = ["Rp.10.000-Rp.25.000", "Rp.25.000-Rp.50.000"];
}
