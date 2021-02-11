import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/dimens.dart';
import 'package:xetia_shop/ui/components/_components.dart';

class ShopUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              height: paddingTop,
              width: widthApp,
              color: context.theme.primaryColorDark),
          XetiaTabBar(),
          Container(
            height: heightApp * 0.425,
            width: widthApp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: context.theme.primaryColorDark,
            ),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Halal Food in Japan",
                    style: context.textTheme.headline2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 18.0, left: 10, right: 10, bottom: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter a search term',
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(Icons.camera),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
