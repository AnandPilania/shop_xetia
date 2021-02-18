import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/controllers/_controllers.dart';

class ChatFooter extends StatelessWidget {
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
      child: Row(
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
            child: TextField(
              controller: _messageItemController.messageTextFieldController,
              decoration: InputDecoration(
                hintText: "Type a Message",
              ),
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
    );
  }
}
