import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/_constants.dart';
import '../../controllers/_controllers.dart';
import '../../ui/components/_components.dart';

class ShopScreen extends StatelessWidget {
  final BestSellerController bestSellerController =
      Get.put(BestSellerController());

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
                color: Theme.of(context).primaryColorDark),
            child: Column(
              children: [
                Center(
                    child: Text("Halal Food in Japan",
                        style: Theme.of(context).textTheme.headline1)),
                Padding(
                    padding:
                        const EdgeInsets.only(top: 18.0, left: 10, right: 10),
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
                    : ProductListCard(),
              )),
        ],
      ),
    );
  }
}
