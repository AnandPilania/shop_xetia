import 'package:get/get.dart';

class CarouselCardController extends GetxController {
  RxInt _currentBusinessCard = 0.obs;

  set currentBusinessCard(value) => this._currentBusinessCard.value = value;

  get currentBusinessCard => this._currentBusinessCard.value;

  RxInt _currentHeaderShopCard = 0.obs;

  set currentHeaderShopCard(value) => this._currentHeaderShopCard.value = value;

  get currentHeaderShopCard => this._currentHeaderShopCard.value;

  List<T> mapCard<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
}
