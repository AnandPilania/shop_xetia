import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class HeaderHomeController extends GetxController {
  RxInt _currentPage = 0.obs;
  PageController _pageController;

  set currentPage(value) => this._currentPage.value = value;

  get currentPage => this._currentPage.value;

  get pageController => this._pageController;

  @override
  void onInit() {
    _pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    pageController?.dispose();
    super.onClose();
  }

  void changeHeader({int position, bool isSwiped = true}) {
    if (isSwiped) {
      currentPage = position;
    } else {
      pageController.animateToPage(position,
          duration: Duration(milliseconds: 50), curve: Curves.linear);
      currentPage = position;
    }
  }
}
