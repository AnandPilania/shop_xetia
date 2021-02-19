import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class HeaderHomeController extends GetxController {
  PageController pageController;
  RxInt currentPage = 0.obs;

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  void changeHeader(int position) {
    pageController.animateToPage(position,
        duration: Duration(milliseconds: 250), curve: Curves.linear);
    currentPage(position);
  }
}
