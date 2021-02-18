import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatFooter extends StatelessWidget {
  const ChatFooter({
    Key key,
  }) : super(key: key);

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
            child: Container(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Type a Message",
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Icon(
            Icons.send_rounded,
            color: context.theme.primaryColor,
          ),
        ],
      ),
    );
  }
}
