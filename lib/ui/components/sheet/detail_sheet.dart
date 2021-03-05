import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/language/language_key.dart';
import 'package:xetia_shop/ui/components/_components.dart';
import 'package:xetia_shop/ui/components/detail_sheet/_components.dart';

import '../../../constants/_constants.dart';
import '../../../controllers/_controllers.dart';

class DetailSheet extends StatelessWidget {
  final int indexItem;
  final ProductController productController = Get.find();

  DetailSheet({Key key, this.indexItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.scaffoldBackgroundColor,
      child: Column(
        children: [
          SheetHeader(
            title: kProductDetails.tr,
            onTap: () {
              Get.back();
            },
          ),
          Expanded(
            child: Container(
              width: widthApp,
              child: Swiper(
                itemCount: productController.listProductFetch.length,
                index: indexItem,
                onIndexChanged: (_) =>
                    productController.indexProductPicture = 0,
                itemBuilder: (context, indexSwiper) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            DetailProductImages(indexSwiper: indexSwiper),
                            DetailFavoriteButton(indexSwiper: indexSwiper),
                          ],
                        ),
                        Container(
                          width: widthApp,
                          decoration: BoxDecoration(
                              color: context.theme.primaryColorDark,
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(15),
                              )),
                          child: Column(
                            children: [
                              DetailImagesIndicator(indexSwiper: indexSwiper),
                              DetailTitleProduct(indexSwiper: indexSwiper),
                            ],
                          ),
                        ),
                        DetailProductReview(),
                        DetailProductDetail(),
                        DetailProductStore(),
                        DetailRelatedProduct(indexSwiper: indexSwiper),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          DetailBuyButton(),
        ],
      ),
    );
  }
}
