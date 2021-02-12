import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../constants/dimens.dart';
import '../../controllers/product_controller.dart';

class ProductGridCard extends StatelessWidget {
  final ProductController productController;

  ProductGridCard({Key key, this.productController}) : super(key: key);

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
        itemBuilder: (BuildContext context, int index) => Column(
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
                        productController.listProduct[index].shopLogo,
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
                          productController.listProduct[index].imageUrl,
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
                                productController.listProduct[index].isFavorite.value == true ? Icons.favorite : Icons.favorite_border,
                                color: productController.listProduct[index].isFavorite.value == true
                                    ? Colors.redAccent
                                    : context.theme.scaffoldBackgroundColor,
                              ),
                              onPressed: () => productController.addToFavorite(index),
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
                  Text(productController.listProduct[index].productName, style: context.textTheme.subtitle1),
                  Text(productController.listProduct[index].productWeight, style: context.textTheme.subtitle2),
                  Text(productController.listProduct[index].productPrice, style: context.textTheme.headline3),
                ],
              ),
            ),
          ],
        ),
        staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
      ),
    );
  }
}
