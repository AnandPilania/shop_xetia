import 'package:get/get.dart';

class CarouselCardController extends GetxController {
  RxInt _currentCard = 0.obs;

  set currentCard(value) => this._currentCard.value = value;
  get currentCard => this._currentCard.value;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
}
