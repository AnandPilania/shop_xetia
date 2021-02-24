import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:xetia_shop/controllers/_controllers.dart';

class BestSellerBar extends StatelessWidget {
  final BestSellerController controllerGrid = Get.find<BestSellerController>();
  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Best Seller", style: context.textTheme.headline1.copyWith(fontSize: 20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => Text("${productController.listProductFetch.length} Product",
                    style: context.textTheme.headline1.copyWith(fontSize: 12, color: context.theme.primaryColor)),
              ),
              Obx(() => Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: controllerGrid.isGridView == true ? context.theme.primaryColor : null),
                        child: IconButton(
                          icon: Icon(Icons.grid_on_rounded),
                          color: controllerGrid.isGridView == true ? context.theme.primaryColorDark : context.theme.primaryColor,
                          padding: EdgeInsets.all(4),
                          constraints: BoxConstraints(),
                          onPressed: () => controllerGrid.isGridView = true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: controllerGrid.isGridView == false ? context.theme.primaryColor : null),
                          child: IconButton(
                            icon: Icon(Icons.list_rounded),
                            color: controllerGrid.isGridView == false ? context.theme.primaryColorDark : context.theme.primaryColor,
                            padding: EdgeInsets.all(4),
                            constraints: BoxConstraints(),
                            onPressed: () => controllerGrid.isGridView = false,
                          ),
                        ),
                      )
                    ],
                  )),
            ],
          )
        ],
      ),
    );
  }
}
