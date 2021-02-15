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
              onIndexChanged: (_) => productController.updateIndexProductPicture(0),
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
                                    onIndexChanged: ((indexImage) => productController.updateIndexProductPicture(indexImage)),
                                    itemCount: productController.listProduct[indexSwiper].imageUrl.length,
                                    itemBuilder: (context, index) {
                                      return Image.network(productController.listProduct[indexSwiper].imageUrl[index], fit: BoxFit.fill);
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
                                )),
                          ],
                        ),
                      ),
                      Container(
                        width: widthApp,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30))),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Spacer(),
                                  for (int x in List<int>.generate(productController.listProduct[indexSwiper].imageUrl.length, (i) => i))
                                    Obx(() => Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: AnimatedContainer(
                                              duration: Duration(milliseconds: 300),
                                              height: 10,
                                              width: x == productController.indexProductPicture.value ? 25 : 10,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(productController.indexProductPicture.value == x ? 5 : 50),
                                                  color: context.theme.primaryColor)),
                                        )),
                                  Spacer(),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(productController.listProduct[indexSwiper].productName,
                                      style: context.textTheme.headline2.copyWith(color: Colors.black)),
                                  Text(productController.listProduct[indexSwiper].productPrice.toString(),
                                      style: context.textTheme.headline4.copyWith(color: context.theme.primaryColor)),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(productController.listProduct[indexSwiper].productPrice.toString(),
                                          style: context.textTheme.headline5.copyWith(fontStyle: FontStyle.italic)),
                                      SizedBox(width: 10),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: context.theme.primaryColor.withOpacity(0.25), borderRadius: BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Center(
                                            child: Text("50%",
                                                style:
                                                    context.textTheme.headline5.copyWith(color: context.theme.primaryColor.withOpacity(1))),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
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
