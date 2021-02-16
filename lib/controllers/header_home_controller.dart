import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class HeaderHomeController extends GetxController {
  PageController pageController = PageController();
  RxInt currentPage = 0.obs;

  void changeHeader(int position) {
    pageController.animateToPage(position, duration: Duration(milliseconds: 250), curve: Curves.linear);
    currentPage(position);
  }
}
