import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageItemController extends GetxController {
  TextEditingController messageTextFieldController;
  ScrollController chatBodyScrollController;
  RxList<MessageItem> listMessage = List<MessageItem>().obs;
  RxString selectedReplyMessage = "".obs;
  RxBool showReplyMessage = false.obs;

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
    listMessage.add(MessageItem(
        content: messageTextFieldController.text,
        isRight: true,
        reply: selectedReplyMessage.value));

    messageTextFieldController.clear();

    changeReplyMessage("");
    changeVisibilityReplyMessage(false);
    
    chatBodyScrollController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }

  void changeReplyMessage(String content) {
    selectedReplyMessage(content);
  }

  void changeVisibilityReplyMessage(bool val) {
    showReplyMessage(val);
  }

  @override
  void dispose() {
    messageTextFieldController?.dispose();
    chatBodyScrollController?.dispose();
    super.dispose();
  }
}

class MessageItem {
  final String content;
  final String reply;
  final bool isRight;

  MessageItem({this.content, this.isRight, this.reply});
}
