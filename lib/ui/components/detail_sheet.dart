import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/controllers/product_controller.dart';

class DetailSheet extends StatelessWidget {
  final int index;
  final ProductController productController = Get.find<ProductController>();

  DetailSheet({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: paddingTop),
            child: Container(
              height: heightApp * 0.1,
              width: widthApp,
              color: context.theme.primaryColor,
              child: Center(child: Text("Product Details", style: context.textTheme.headline3)),
            ),
          ),
          Container(
            height: heightApp * 0.9,
            width: widthApp,
            child: Swiper(
              itemCount: productController.listProduct.length,
              index: index,
              //pagination: SwiperPagination(),
              itemBuilder: (context, indexSwiper) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: widthApp,
                        height: widthApp,
                        color: Colors.white,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: widthApp,
                                height: widthApp,
                                child: Center(
                                  child: Swiper(
                                    itemCount: 4,
                                    itemBuilder: (context, snapshot) {
                                      return Image.network(productController.listProduct[indexSwiper].imageUrl);
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Obx(() => Padding(
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
                                          productController.listProduct[indexSwiper].isFavorite.value == true
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: productController.listProduct[indexSwiper].isFavorite.value == true
                                              ? Colors.redAccent
                                              : context.theme.scaffoldBackgroundColor,
                                        ),
                                        onPressed: () => productController.addToFavorite(indexSwiper),
                                      ),
                                      width: widthApp * 0.15,
                                      height: widthApp * 0.15,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
