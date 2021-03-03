import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/ui/_ui.dart';

class ShopController extends GetxController {
  RxBool _isShopOwner = false.obs;

  set isShopOwner(value) => this._isShopOwner.value = value;

  Widget get isShopOwner =>
      _isShopOwner.value ? ShopOwnerScreen() : ShopScreen();
}
