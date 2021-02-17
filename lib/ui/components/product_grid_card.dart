import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/controllers/_controllers.dart';

import '_components.dart';

class ProductGridCard extends StatelessWidget {
  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StaggeredGridView.countBuilder(
        padding: EdgeInsets.only(bottom: widthApp * 0.175, top: 20, left: 8, right: 8),
        shrinkWrap: true,
        primary: false,
        crossAxisCount: 4,
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 10.0,
        itemCount: productController.listProduct.length,
        itemBuilder: (BuildContext context, int indexItem) {
          return GestureDetector(
            onTap: () {
              productController.updateIndexProductPicture(0);
              Get.bottomSheet(
                SafeArea(child: DetailSheet(indexItem: indexItem)),
                isScrollControlled: true,
                isDismissible: true,
                enableDrag: true,
                ignoreSafeArea: false,
                //backgroundColor: const Color(0xfff2f2f2),
              );
              // productController.fetchData();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            productController.listProduct[indexItem].shopLogo,
                            color: context.theme.primaryColorDark,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Container(
                            height: heightApp * 0.2,
                            width: widthApp * 0.2,
                            child: Image.network(
                              productController.listProduct[indexItem].imageUrl[0],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Obx(() => Row(
                              children: [
                                IconButton(
                                  padding: EdgeInsets.all(4),
                                  constraints: BoxConstraints(),
                                  icon: Icon(
                                    productController.listProduct[indexItem].isFavorite.value == true
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: productController.listProduct[indexItem].isFavorite.value == true
                                        ? Colors.redAccent
                                        : context.theme.scaffoldBackgroundColor,
                                  ),
                                  onPressed: () => productController.addToFavorite(indexItem),
                                ),
                                IconButton(
                                  padding: EdgeInsets.all(4),
                                  constraints: BoxConstraints(),
                                  icon: Icon(
                                    Icons.add_circle_outline,
                                    color: context.theme.scaffoldBackgroundColor,
                                  ),
                                  onPressed: () {},
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productController.listProduct[indexItem].productName,
                        style: context.textTheme.subtitle1,
                        maxLines: 1,
                      ),
                      Text(productController.listProduct[indexItem].productWeight, style: context.textTheme.subtitle2),
                      Text(productController.listProduct[indexItem].productPrice, style: context.textTheme.headline3),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
      ),
    );
  }
}
