import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/ui/components/shop_owner/_components.dart';

import '../../constants/_constants.dart';
import '../../controllers/_controllers.dart';
import '../../ui/components/_components.dart';

class ShopOwnerScreen extends StatelessWidget {
  final ToggleController _toggleController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
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
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(
                            CupertinoIcons.back,
                            color: context.theme.primaryColorLight,
                          ),
                          onPressed: () {
                            _toggleController.isShopOwner = false;
                          }),
                      Expanded(
                        child: Center(
                            child: AutoSizeText("Welcome to Sariraya",
                                style: context.textTheme.headline1,
                                maxLines: 1)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: XetiaTextField(
                      hintText: "Search Halal Food in Sariraya",
                      prefixIcon: Icons.search,
                      suffixIcon: Icons.camera_alt),
                ),
                HeaderShopCard(),
              ],
            ),
          ),
          ShopCategories(),
          BestSellerBar(),
          Obx(() => AnimatedSwitcher(
                duration: Duration(milliseconds: 250),
                child: _toggleController.isGridView
                    ? ProductGridCard()
                    : ProductListCard(),
              )),
        ],
      ),
    );
  }
}
