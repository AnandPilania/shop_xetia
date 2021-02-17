import 'dart:math';

import 'package:flutter/material.dart';
import 'package:xetia_shop/constants/dimens.dart';
import 'package:xetia_shop/ui/components/_components.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class ChatItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      width: widthApp,
      decoration: BoxDecoration(
        color: context.theme.primaryColorDark,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Avatar(
                    color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                        .withOpacity(1)),
                SizedBox(width: 18),
                Expanded(child: ChatInfo())
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "11:00",
                  style: context.textTheme.headline2.copyWith(
                      color: context.theme.primaryColor.withOpacity(0.5),
                      fontSize: 12),
                ),
                SizedBox(width: 10),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: ShapeDecoration(
                    color: context.theme.primaryColor.withOpacity(0.5),
                    shape: CircleBorder(),
                  ),
                  child: Text(
                    "1",
                    style: context.textTheme.headline2.copyWith(
                        color: context.theme.primaryColor.withOpacity(0.5),
                        fontSize: 12),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
