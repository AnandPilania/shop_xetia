import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/_constants.dart';

class DetailHeader extends StatelessWidget {
  const DetailHeader({
    Key key,
  }) : super(key: key);

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
            onPressed: () {
              Get.back();
            },
          ),
          Expanded(
            child: Center(
              child: Text("Product Details",
                  textAlign: TextAlign.center,
                  style: context.textTheme.headline3
                      .copyWith(fontWeight: FontWeight.bold)),
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
