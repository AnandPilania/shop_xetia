import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/language/language_key.dart';

import '../../constants/_constants.dart';

class PopularShop extends StatelessWidget {
  final ShopController shopController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0, bottom: 4.0),
          child: Text(kPopularShop.tr,
              style: context.textTheme.headline1.copyWith(fontSize: 20)),
        ),
        Container(
          height: heightApp * 0.2,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: [
                for (List popularItem in kPopularShopData)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        shopController.isShopOwner = true;
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                            maxRadius: 58 / 2,
                            backgroundColor: Color(
                                    (Random().nextDouble() * 0xFFFFFF).toInt())
                                .withOpacity(1),
                            child: Icon(Icons.shop, color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(popularItem[0].toString().tr,
                                style: context.textTheme.headline1
                                    .copyWith(fontSize: 12)),
                          ),
                          Text(popularItem[1].toString().tr,
                              style: context.textTheme.headline1.copyWith(
                                  fontSize: 11, fontWeight: FontWeight.normal)),
                        ],
                      ),
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
