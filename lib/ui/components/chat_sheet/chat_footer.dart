import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/language/_components.dart';
import 'package:xetia_shop/ui/components/_components.dart';

class ChatFooter extends StatelessWidget {
  final TextFieldController _textFieldController = Get.find();
  final ToggleController _toggleController = Get.find();
  final MessageItemController _messageItemController =
      Get.put(MessageItemController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.primaryColorDark,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
              color: context.theme.primaryColorLight.withOpacity(0.4),
              blurRadius: 3),
        ],
      ),
      padding: EdgeInsets.all(10),
      child: Obx(
        () => Column(
          children: [
            _toggleController.showReplyMessage
                ? Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Icon(CupertinoIcons.reply,
                                color: context.theme.primaryColor),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Faker().person.name(),
                                    style: context.textTheme.headline4.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: context.theme.primaryColor),
                                  ),
                                  Obx(() => Text(
                                        _messageItemController
                                            .selectedReplyMessage,
                                        style: context.textTheme.headline5,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            IconButton(
                              icon:
                                  Icon(Icons.close_rounded, color: Colors.grey),
                              onPressed: () {
                                _messageItemController.selectedReplyMessage =
                                    "";
                                _toggleController.showReplyMessage = false;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  )
                : Container(),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.add_circled,
                      color: context.theme.primaryColor,
                    ),
                    SizedBox(width: 5),
                    Icon(
                      CupertinoIcons.camera,
                      color: context.theme.primaryColor,
                    ),
                    SizedBox(width: 5),
                    Icon(
                      CupertinoIcons.upload_circle_fill,
                      color: context.theme.primaryColor,
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Expanded(
                  child: XetiaTextField(
                    textInputType: TextInputType.text,
                    controller: _textFieldController.messageTextFieldController,
                    hintText: kTypeMessage.tr,
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(
                    Icons.send_rounded,
                    color: context.theme.primaryColor,
                  ),
                  onPressed: _messageItemController.addMessage,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
