import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/ui/components/chat_sheet/_components.dart';

class ChatSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.primaryColorDark,
      child: Column(
        children: [
          ChatHeader(),
          Expanded(
            child: Container(
              width: widthApp,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: ChatBody()),
                  ChatFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
