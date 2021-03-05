import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/models/message_item.dart';

class MessageItemController extends GetxController {
  final TextFieldController _textFieldController = Get.find();
  final ListController _listController = Get.find();
  final ToggleController _toggleController = Get.find();
  ScrollController chatBodyScrollController;
  RxString _selectedReplyMessage = "".obs;

  set selectedReplyMessage(value) => this._selectedReplyMessage.value = value;

  get selectedReplyMessage => this._selectedReplyMessage.value;

  @override
  void onInit() {
    chatBodyScrollController = ScrollController(
      initialScrollOffset: 0.0,
      keepScrollOffset: true,
    );
    super.onInit();
    dummyInit();
  }

  void dummyInit() {
    for (int i = 0; i < 15; i++) {
      _listController.addMessage(MessageItem(
          content: Faker().lorem.sentence(),
          isRight: Random().nextBool(),
          reply: ""));
    }
  }

  void addMessage() {
    if (_textFieldController.messageTextFieldController.text.isNotEmpty) {
      _listController.addMessage(MessageItem(
          content: _textFieldController.messageTextFieldController.text,
          isRight: true,
          reply: selectedReplyMessage));
      _textFieldController.messageTextFieldController.clear();
      selectedReplyMessage = "";
      _toggleController.showReplyMessage = false;
      chatBodyScrollController.animateTo(
        0.0,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    }
  }

  @override
  void dispose() {
    chatBodyScrollController?.dispose();
    super.dispose();
  }
}
