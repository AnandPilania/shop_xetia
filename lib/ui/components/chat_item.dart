import 'dart:math';

import 'package:flutter/material.dart';
import 'package:xetia_shop/ui/components/_components.dart';

class ChatItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
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
                  Expanded(child: ChatItem()),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "11:00",
                    style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Theme.of(context).primaryColor.withOpacity(0.5)),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: ShapeDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                      shape: CircleBorder(),
                    ),
                    child: Text(
                      "1",
                      style: Theme.of(context).textTheme.headline5.copyWith(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
