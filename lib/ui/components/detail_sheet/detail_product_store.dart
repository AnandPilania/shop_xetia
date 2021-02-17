import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/_constants.dart';

class DetailProductStore extends StatelessWidget {
  const DetailProductStore({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Store",
                      style: context.textTheme.headline5.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  Text("See The Store >", style: context.textTheme.headline5),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular((100)),
                        color: const Color(0xffffbcb3),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular((100)),
                        child: Icon(Icons.shop),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(kPopularShopData[Random().nextInt(7)][0],
                            style: context.textTheme.headline5
                                .copyWith(fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            Icon(Icons.location_pin,
                                color: Colors.grey, size: 15),
                            SizedBox(width: 2),
                            Text(kPopularShopData[Random().nextInt(7)][1],
                                style: context.textTheme.headline5
                                    .copyWith(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
