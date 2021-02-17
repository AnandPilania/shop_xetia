import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/controllers/_controllers.dart';

class DetailRelatedProductItem extends StatelessWidget {
  DetailRelatedProductItem({Key key, this.indexSwiper}) : super(key: key);

  final int indexSwiper;
  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthApp * 0.425,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(15.0),
          bottomLeft: Radius.circular(15.0),
        ),
        color: const Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            color: const Color(0x29000000),
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: widthApp * 0.45,
                height: widthApp * 0.5,
                child: Center(
                    child: Image.network(
                        productController.listProduct[indexSwiper].imageUrl[
                            productController.indexProductPicture.value],
                        fit: BoxFit.fill)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                    child: Icon(Icons.favorite, color: Colors.redAccent),
                    width: widthApp * 0.1,
                    height: widthApp * 0.1,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productController.listProduct[indexSwiper].productName,
                    style: context.textTheme.headline2.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                Text(
                    productController.listProduct[indexSwiper].productPrice
                        .toString(),
                    style: context.textTheme.headline4.copyWith(
                        color: context.theme.primaryColor,
                        fontWeight: FontWeight.bold)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                          productController
                              .listProduct[indexSwiper].productPrice
                              .toString(),
                          style: context.textTheme.headline4.copyWith(
                              decoration: TextDecoration.lineThrough)),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: context.theme.primaryColor.withOpacity(0.25),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Center(
                            child: Text("50%",
                                style: context.textTheme.headline4.copyWith(
                                    color: context.theme.primaryColor
                                        .withOpacity(1))),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
