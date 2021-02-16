import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/_constants.dart';
import '../controllers/_controllers.dart';
import '../ui/components/_components.dart';

class ShopUI extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  final BestSellerController bestSellerController = Get.find<BestSellerController>();
  final HeaderHomeController headerController = Get.find<HeaderHomeController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: paddingTop, width: widthApp, color: context.theme.primaryColorDark),
        XetiaTabBar(),
        Expanded(
          child: PageView(
            controller: headerController.pageController,
            onPageChanged: (value) => headerController.changeHeader(value),
            scrollDirection: Axis.horizontal,
            children: [
              SingleChildScrollView(
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
                                      hintText: 'Search halal Food in Japan',
                                      prefixIcon: Icon(Icons.search),
                                      suffixIcon: Icon(Icons.camera)))),
                          Expanded(child: XetiaShopInfo()),
                        ],
                      ),
                    ),
                    PopularShop(),
                    BestSellerBar(),
                    Obx(() => AnimatedSwitcher(
                        duration: Duration(milliseconds: 250),
                        child: bestSellerController.isGridView.value == true
                            ? ProductGridCard()
                            : ProductListCard(productController: productController)))
                  ],
                ),
              ),
              Container(height: 200, width: 200, color: Colors.amberAccent),
              Container(height: 200, width: 200, color: Colors.blueAccent)
            ],
          ),
        ),
      ],
    );
  }
}
