import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/_constants.dart';

class ChatHeader extends StatelessWidget {
  const ChatHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightApp * 0.1,
      width: widthApp,
      color: context.theme.primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(CupertinoIcons.back),
            onPressed: () {
              Get.back();
            },
          ),
          Expanded(
            child: Row(
              children: [
                CircleAvatar(
                    backgroundColor:
                        Color((Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(1)),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Faker().person.name(),
                        style: context.textTheme.headline3
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        "Online",
                        style: context.textTheme.headline4
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.more_vert_rounded),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
