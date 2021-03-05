import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/ui/_ui.dart';

class ToggleController extends GetxController {
  final RxBool _isGridView = true.obs;

  set isGridView(value) => this._isGridView.value = value;

  bool get isGridView => this._isGridView.value;

  RxBool _isLogin = true.obs;

  set isLogin(value) => this._isLogin.value = value;

  bool get isLogin => this._isLogin.value;

  RxBool _subscribeEmail = false.obs;

  set subscribeEmail(value) => this._subscribeEmail.value = value;

  bool get subscribeEmail => this._subscribeEmail.value;

  RxBool _showReplyMessage = false.obs;

  set showReplyMessage(value) => this._showReplyMessage.value = value;

  bool get showReplyMessage => this._showReplyMessage.value;

  RxBool _isObscure = true.obs;

  set isObscure(value) => this._isObscure.value = value;

  bool get isObscure => this._isObscure.value;

  RxBool _isShopOwner = false.obs;

  set isShopOwner(value) => this._isShopOwner.value = value;

  Widget get isShopOwner =>
      _isShopOwner.value ? ShopOwnerScreen() : ShopScreen();
}
