import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/controllers/_controllers.dart';

class DetailProductImages extends StatelessWidget {
  DetailProductImages({Key key, this.indexSwiper}) : super(key: key);

  final int indexSwiper;
  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthApp,
      height: widthApp,
      child: Center(
        child: Swiper(
          onIndexChanged: ((indexImage) =>
              productController.updateIndexProductPicture(indexImage)),
          itemCount: productController.listProduct[indexSwiper].imageUrl.length,
          itemBuilder: (context, indexImage) {
            return Image.network(
                productController.listProduct[indexSwiper].imageUrl[indexImage],
                fit: BoxFit.fill);
          },
        ),
      ),
    );
  }
}
