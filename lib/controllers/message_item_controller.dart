import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/models/message_item.dart';

class MessageItemController extends GetxController {
  TextEditingController messageTextFieldController;
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
    messageTextFieldController = TextEditingController();
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
    if (messageTextFieldController.text.isNotEmpty) {
      listMessage.add(MessageItem(
          content: messageTextFieldController.text,
          isRight: true,
          reply: selectedReplyMessage));
      messageTextFieldController.clear();
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
    messageTextFieldController?.dispose();
    chatBodyScrollController?.dispose();
    super.dispose();
  }
}
