import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/controllers/_controllers.dart';

class DetailImagesIndicator extends StatelessWidget {
  DetailImagesIndicator({Key key, this.indexSwiper}) : super(key: key);

  final int indexSwiper;
  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Spacer(),
          for (int x in List<int>.generate(
              productController.listProduct[indexSwiper].imageUrl.length,
              (i) => i))
            Obx(() => Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: AnimatedContainer(
                      duration: Duration(milliseconds: 250),
                      height: 10,
                      width: x == productController.indexProductPicture.value
                          ? 30
                          : 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              productController.indexProductPicture.value == x
                                  ? 5
                                  : 50),
                          color: x ==
                                  productController.indexProductPicture.value
                              ? context.theme.primaryColor
                              : context.theme.primaryColor.withOpacity(0.55))),
                )),
          Spacer(),
        ],
      ),
    );
  }
}
