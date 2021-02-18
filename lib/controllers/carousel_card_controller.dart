import 'package:get/get.dart';

class CarouselCardController extends GetxController {
  RxInt currentCard = 0.obs;

  void changeCurrentCard(int position) {
    currentCard(position);
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
}
