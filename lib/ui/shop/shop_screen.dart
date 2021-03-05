import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/language/language_key.dart';
import 'package:xetia_shop/utils/_utils.dart';

import '../../constants/_constants.dart';
import '../../controllers/_controllers.dart';
import '../../ui/components/_components.dart';

class ShopScreen extends StatelessWidget {
  final ToggleController _toggleController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: heightApp * 0.4,
            width: widthApp,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: context.theme.primaryColorDark),
            child: Column(
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Center(
                      child: AutoSizeText(kHalalTitle.tr,
                          style: context.textTheme.headline1, maxLines: 1)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                  child: XetiaTextField(
                      hintText: kHalalHint.tr,
                      prefixIcon: Icons.search,
                      suffixIcon: Icons.camera_alt),
                ),
                Expanded(child: XetiaShopInfo()),
              ],
            ),
          ),
          PopularShop(),
          BestSellerBar(),
          Obx(() => AnimatedSwitcher(
                duration: Duration(milliseconds: 250),
                child: _toggleController.isGridView.isTrue()
                    ? ProductGridCard()
                    : ProductListCard(),
              )),
        ],
      ),
    );
  }
}
