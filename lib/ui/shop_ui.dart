import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/constants.dart';
import 'package:xetia_shop/ui/components/components.dart';

class ShopUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: paddingTop, width: widthApp, color: context.theme.primaryColorDark),
        XetiaTabBar(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: heightApp * 0.4,
                  width: widthApp,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                      color: context.theme.primaryColorDark),
                  child: Column(
                    children: [
                      Center(child: Text("Halal Food in Japan", style: context.textTheme.headline1)),
                      Padding(
                          padding: const EdgeInsets.only(top: 18.0, left: 10, right: 10),
                          child: TextField(
                              decoration: InputDecoration(
                                  hintText: 'Search halal Food in Japan', prefixIcon: Icon(Icons.search), suffixIcon: Icon(Icons.camera)))),
                      Expanded(child: XetiaShopInfo()),
                    ],
                  ),
                ),
                PopularShop(),
                BestSellerBar(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
