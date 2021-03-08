import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/controllers/_controllers.dart';

class DetailTitleProduct extends StatelessWidget {
  DetailTitleProduct({Key key, this.indexSwiper}) : super(key: key);

  final int indexSwiper;
  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(productController.listProductFetch[indexSwiper].name,
              style: context.textTheme.headline2
                  .copyWith(fontWeight: FontWeight.bold)),
          Text(productController.listProductFetch[indexSwiper].price.toString(),
              style: context.textTheme.headline4.copyWith(
                  color: context.theme.primaryColor,
                  fontWeight: FontWeight.bold)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  productController.listProductFetch[indexSwiper].price
                      .toString(),
                  style: context.textTheme.headline5
                      .copyWith(decoration: TextDecoration.lineThrough)),
              SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                    color: context.theme.primaryColor.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Center(
                    child: Text("50%",
                        style: context.textTheme.headline5.copyWith(
                            color: context.theme.primaryColor.withOpacity(1))),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
