import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/models/message_item.dart';

class MessageItemController extends GetxController {
  final TextFieldController _textFieldController = Get.find();
  ScrollController chatBodyScrollController;
  RxList<MessageItem> listMessage = List<MessageItem>().obs;
  RxString _selectedReplyMessage = "".obs;
  RxBool _showReplyMessage = false.obs;

  set selectedReplyMessage(value) => this._selectedReplyMessage.value = value;

  get selectedReplyMessage => this._selectedReplyMessage.value;

  set showReplyMessage(value) => this._showReplyMessage.value = value;

  get showReplyMessage => this._showReplyMessage.value;

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
      listMessage.add(MessageItem(
          content: Faker().lorem.sentence(),
          isRight: Random().nextBool(),
          reply: ""));
    }
  }

  void addMessage() {
    if (_textFieldController.messageTextFieldController.text.isNotEmpty) {
      listMessage.add(MessageItem(
          content: _textFieldController.messageTextFieldController.text,
          isRight: true,
          reply: selectedReplyMessage));
      _textFieldController.messageTextFieldController.clear();
      selectedReplyMessage = "";
      showReplyMessage = false;
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
