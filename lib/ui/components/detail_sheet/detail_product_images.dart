import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/ui/components/_components.dart';

class DetailProductImages extends StatelessWidget {
  DetailProductImages({Key key, this.indexSwiper}) : super(key: key);

  final int indexSwiper;
  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthApp,
      height: widthApp,
      child: Center(
        child: Swiper(
          onIndexChanged: ((indexImage) =>
              productController.indexProductPicture = indexImage),
          itemCount:
              productController.listProductFetch[indexSwiper].images.length,
          itemBuilder: (context, indexImage) {
            return XetiaImageNetwork(
              sourceImage: productController
                  .listProductFetch[indexSwiper].images[indexImage],
              boxFit: BoxFit.fitWidth,
            );
          },
        ),
      ),
    );
  }
}
