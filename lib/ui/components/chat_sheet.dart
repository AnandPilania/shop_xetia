import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/ui/components/_components.dart';

class ChatSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.scaffoldBackgroundColor,
      child: Column(
        children: [
          ChatHeader(),
          Expanded(
            child: Container(
              width: widthApp,
            ),
          ),
        ],
      ),
    );
  }
}
