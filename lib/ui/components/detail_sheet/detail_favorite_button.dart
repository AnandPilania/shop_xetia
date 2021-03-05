import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/controllers/_controllers.dart';

class DetailFavoriteButton extends StatelessWidget {
  DetailFavoriteButton({Key key, this.indexSwiper}) : super(key: key);

  final int indexSwiper;
  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 10),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(
                  productController
                              .listProductFetch[indexSwiper].isFavorite.value ==
                          true
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: productController
                              .listProductFetch[indexSwiper].isFavorite.value ==
                          true
                      ? Colors.redAccent
                      : context.theme.scaffoldBackgroundColor,
                ),
                onPressed: () => productController.addToFavorite(indexSwiper),
              ),
              width: widthApp * 0.15,
              height: widthApp * 0.15,
            ),
          ),
        ));
  }
}
