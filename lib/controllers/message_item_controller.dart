import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageItemController extends GetxController {
  TextEditingController messageTextFieldController = TextEditingController();
  ScrollController chatBodyScrollController = ScrollController();
  RxList<MessageItem> listMessage = List<MessageItem>().obs;
  RxString selectedReplyMessage = "".obs;

  @override
  void onInit() {
    super.onInit();
    dummyInit();
  }

  void dummyInit() {
    for (int i = 0; i < 15; i++) {
      listMessage
          .add(MessageItem(Faker().lorem.sentence(), Random().nextBool()));
    }
  }

  void addMessage() {
    listMessage.add(MessageItem(messageTextFieldController.text, true));
    messageTextFieldController.clear();
    chatBodyScrollController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }

  void changeReplyMessage(String content) {
    selectedReplyMessage(content);
  }
}

class MessageItem {
  final String content;
  final bool isRight;

  MessageItem(this.content, this.isRight);
}
