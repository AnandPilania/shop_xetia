import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:xetia_shop/controllers/_controllers.dart';

class ChatBody extends StatelessWidget {
  final MessageItemController _messageItemController =
      Get.put(MessageItemController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        reverse: true,
        controller: _messageItemController.chatBodyScrollController,
        physics: BouncingScrollPhysics(),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(
              _messageItemController.listMessage.length,
              (index) => BubbleChat(
                text: _messageItemController.listMessage[index].content,
                isRight: _messageItemController.listMessage[index].isRight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BubbleChat extends StatelessWidget {
  final String text;
  final bool isRight;

  BubbleChat({Key key, this.text, this.isRight}) : super(key: key);

  final MessageItemController controller = Get.find<MessageItemController>();

  @override
  Widget build(BuildContext context) {
    return SwipeTo(
      iconOnLeftSwipe: CupertinoIcons.reply,
      iconSize: 18,
      iconColor: context.theme.primaryColor,
      onLeftSwipe: () {
        controller.changeReplyMessage(text);
        controller.changeVisibilityReplyMessage(true);
      },
      child: Bubble(
        alignment: isRight ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(5),
          child: Text(
            text,
            style: context.textTheme.headline5.copyWith(color: Colors.black),
          ),
        ),
        color: isRight ? context.theme.primaryColor : Colors.white,
        margin: isRight
            ? BubbleEdges.fromLTRB(
                MediaQuery.of(context).size.width * 0.2, 10, 0, 0)
            : BubbleEdges.fromLTRB(
                0, 10, MediaQuery.of(context).size.width * 0.2, 0),
        nip: isRight ? BubbleNip.rightBottom : BubbleNip.leftBottom,
        nipWidth: 4,
        radius: Radius.circular(10),
        nipRadius: 1,
      ),
    );
  }
}
