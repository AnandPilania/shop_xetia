import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../constants/dimens.dart';
import '../../controllers/product_controller.dart';
import '../../ui/components/detail_sheet.dart';

class ProductListCard extends StatelessWidget {
  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
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
            );
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 9,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              child: Image.network(
                                productController.listProduct[indexItem].imageUrl[productController.indexProductPicture.value],
                              ),
                            ),
                          ),
                        ),
                      ),
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
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_box_rounded,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                                  child: Text("2", style: context.textTheme.headline6),
                                ),
                                Icon(Icons.remove_circle_outline),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(productController.listProduct[indexItem].productName,
                                    style: context.textTheme.headline1.copyWith(fontWeight: FontWeight.normal, fontSize: 12, height: 1.5),
                                    maxLines: 2),
                                Text(productController.listProduct[indexItem].productWeight,
                                    style: context.textTheme.headline1.copyWith(fontWeight: FontWeight.normal, fontSize: 10, height: 1.5)),
                                Text(productController.listProduct[indexItem].productPrice,
                                    style: context.textTheme.headline1.copyWith(fontSize: 13.5)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Obx(
                          () => Row(
                            children: [
                              IconButton(
                                padding: EdgeInsets.all(4),
                                constraints: BoxConstraints(),
                                icon: Icon(
                                  productController.listProduct[indexItem].isFavorite.value == true
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: productController.listProduct[indexItem].isFavorite.value == true
                                      ? const Color(0xffcd444a)
                                      : context.theme.primaryColor,
                                ),
                                onPressed: () => productController.addToFavorite(indexItem),
                              ),
                              IconButton(
                                padding: EdgeInsets.all(4),
                                constraints: BoxConstraints(),
                                icon: Icon(
                                  Icons.shopping_cart_outlined,
                                  color: context.theme.primaryColor,
                                ),
                                onPressed: () {},
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Container(
                                  height: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: context.theme.primaryColor,
                                  ),
                                  child: Center(child: Text("Buy", style: context.textTheme.headline4)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
      staggeredTileBuilder: (int index) => StaggeredTile.fit(4),
    );
  }
}
