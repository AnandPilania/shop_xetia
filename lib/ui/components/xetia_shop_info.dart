import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/_constants.dart';

class XetiaShopInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (List halal in kHalalInfo)
              SizedBox(
                width: widthApp * 0.275,
                child: Column(
                  children: [
                    Text(halal[1].toString().tr,
                        style: context.textTheme.headline3),
                    Text(halal[0].toString().tr,
                        style:
                            context.textTheme.headline3.copyWith(fontSize: 13),
                        textAlign: TextAlign.center),
                  ],
                ),
              ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (List muslim in kMuslimInfo)
              SizedBox(
                width: widthApp * 0.275,
                child: Column(
                  children: [
                    Text(muslim[1].toString().tr,
                        style: context.textTheme.headline3),
                    Text(muslim[0].toString().tr,
                        style:
                            context.textTheme.headline3.copyWith(fontSize: 13),
                        textAlign: TextAlign.center),
                  ],
                ),
              ),
          ],
        )
      ],
    );
  }
}
