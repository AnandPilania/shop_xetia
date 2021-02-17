import 'package:flutter/material.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:get/get.dart';

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
      child: Center(
          child: Text("Product Details",
              style: context.textTheme.headline3
                  .copyWith(fontWeight: FontWeight.bold))),
    );
  }
}
