import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/_constants.dart';

class SheetHeader extends StatelessWidget {
  const SheetHeader({
    Key key,
    @required this.title,
    @required this.onTap,
  }) : super(key: key);

  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightApp * 0.075,
      width: widthApp,
      color: context.theme.primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(CupertinoIcons.back),
            onPressed: onTap,
          ),
          Expanded(
            child: Center(
              child: Text(title,
                  textAlign: TextAlign.center,
                  style: context.textTheme.headline3.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(
            width: 48,
          ),
        ],
      ),
    );
  }
}
