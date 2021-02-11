import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/_constants.dart';

class PopularShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0, bottom: 4.0),
          child: Text("Popular Shops", style: context.textTheme.headline3),
        ),
        Container(
          height: heightApp * 0.2,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (List popularItem in popularShopData)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          maxRadius: 58 / 2,
                          backgroundColor:
                              Color((Random().nextDouble() * 0xFFFFFF).toInt())
                                  .withOpacity(1),
                          child: Icon(Icons.shop, color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(popularItem[0],
                              style: context.textTheme.subtitle1),
                        ),
                        Text(popularItem[1],
                            style: context.textTheme.subtitle2),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
