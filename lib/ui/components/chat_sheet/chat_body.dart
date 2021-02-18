import 'package:bubble/bubble.dart';
import 'package:faker/faker.dart';
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
                reply: _messageItemController.listMessage[index].reply,
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
  final String reply;
  final bool isRight;

  BubbleChat({Key key, this.text, this.isRight, this.reply}) : super(key: key);

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              reply.isNotEmpty
                  ? Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.white.withOpacity(0.3),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Faker().person.name(),
                                    style: context.textTheme.headline4.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    reply,
                                    style: context.textTheme.headline5
                                        .copyWith(color: Colors.black),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  text,
                  style:
                      context.textTheme.headline5.copyWith(color: Colors.black),
                ),
              ),
            ],
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

//            reply.isNotEmpty
//                 ? Container(
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 4,
//                           height: double.maxFinite,
//                           color: context.theme.primaryColor,
//                         ),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 Faker().person.name(),
//                                 style: context.textTheme.headline4.copyWith(
//                                     fontWeight: FontWeight.bold,
//                                     color: context.theme.primaryColor),
//                               ),
//                               Text(
//                                 reply,
//                                 style: context.textTheme.headline5,
//                                 maxLines: 2,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 : Container()            reply.isNotEmpty
//                 ? Container(
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 4,
//                           height: double.maxFinite,
//                           color: context.theme.primaryColor,
//                         ),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 Faker().person.name(),
//                                 style: context.textTheme.headline4.copyWith(
//                                     fontWeight: FontWeight.bold,
//                                     color: context.theme.primaryColor),
//                               ),
//                               Text(
//                                 reply,
//                                 style: context.textTheme.headline5,
//                                 maxLines: 2,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 : Container()            reply.isNotEmpty
//                 ? Container(
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 4,
//                           height: double.maxFinite,
//                           color: context.theme.primaryColor,
//                         ),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 Faker().person.name(),
//                                 style: context.textTheme.headline4.copyWith(
//                                     fontWeight: FontWeight.bold,
//                                     color: context.theme.primaryColor),
//                               ),
//                               Text(
//                                 reply,
//                                 style: context.textTheme.headline5,
//                                 maxLines: 2,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 : Container()
