import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/controllers/_controllers.dart';

import '_components.dart';

class ProductGridCard extends StatelessWidget {
  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => StaggeredGridView.countBuilder(
        padding: EdgeInsets.only(
            bottom: widthApp * 0.175, top: 20, left: 8, right: 8),
        shrinkWrap: true,
        primary: false,
        crossAxisCount: 4,
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 10.0,
        itemCount: productController.listProductFetch.length,
        itemBuilder: (BuildContext context, int indexItem) {
          return GestureDetector(
            onTap: () {
              productController.indexProductPicture = 0;
              Get.bottomSheet(
                SafeArea(
                    bottom: false, child: DetailSheet(indexItem: indexItem)),
                isScrollControlled: true,
                isDismissible: true,
                enableDrag: true,
                ignoreSafeArea: false,
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
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
                            productController
                                .listProductFetch[indexItem].shopLogo,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: XetiaImageNetwork(
                                  sourceImage: productController
                                      .listProductFetch[indexItem].thumbnail,
                                ),
                              ),
                            ),
                            Obx(() => Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      padding: EdgeInsets.all(4),
                                      constraints: BoxConstraints(),
                                      icon: Icon(
                                        productController
                                                    .listProductFetch[indexItem]
                                                    .isFavorite
                                                    .value ==
                                                true
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: productController
                                                    .listProductFetch[indexItem]
                                                    .isFavorite
                                                    .value ==
                                                true
                                            ? const Color(0xffcd444a)
                                            : Colors.black,
                                      ),
                                      onPressed: () => productController
                                          .addToFavorite(indexItem),
                                    ),
                                    IconButton(
                                      padding: EdgeInsets.all(4),
                                      constraints: BoxConstraints(),
                                      icon: Icon(
                                        Icons.add_circle_outline,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {},
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productController.listProductFetch[indexItem].name
                            .toString(),
                        style: context.textTheme.headline3,
                        maxLines: 1,
                      ),
                      Text(
                        productController.listProductFetch[indexItem].weight
                            .toString(),
                        style: context.textTheme.headline4,
                      ),
                      Text(
                        productController.listProductFetch[indexItem].price
                            .toString(),
                        style: context.textTheme.headline5,
                      ),
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
