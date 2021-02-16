import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';

import '../../constants/_constants.dart';
import '../../controllers/product_controller.dart';

class DetailSheet extends StatelessWidget {
  final int indexItem;
  final ProductController productController = Get.find<ProductController>();

  DetailSheet({Key key, this.indexItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: paddingTop),
            child: Container(
              height: heightApp * 0.075,
              width: widthApp,
              color: context.theme.primaryColor,
              child: Center(child: Text("Product Details", style: context.textTheme.headline3.copyWith(fontWeight: FontWeight.bold))),
            ),
          ),
          Container(
            height: heightApp * 0.9,
            width: widthApp,
            child: Swiper(
              itemCount: productController.listProduct.length,
              index: indexItem,
              onIndexChanged: (_) => productController.updateIndexProductPicture(0),
              itemBuilder: (context, indexSwiper) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: widthApp,
                            height: widthApp,
                            child: Center(
                              child: Swiper(
                                onIndexChanged: ((indexImage) => productController.updateIndexProductPicture(indexImage)),
                                itemCount: productController.listProduct[indexSwiper].imageUrl.length,
                                itemBuilder: (context, indexImage) {
                                  return Image.network(productController.listProduct[indexSwiper].imageUrl[indexImage], fit: BoxFit.fill);
                                },
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
                      Container(
                        width: widthApp,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15))),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Spacer(),
                                  for (int x in List<int>.generate(productController.listProduct[indexSwiper].imageUrl.length, (i) => i))
                                    Obx(() => Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: AnimatedContainer(
                                              duration: Duration(milliseconds: 250),
                                              height: 10,
                                              width: x == productController.indexProductPicture.value ? 30 : 10,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(productController.indexProductPicture.value == x ? 5 : 50),
                                                  color: x == productController.indexProductPicture.value
                                                      ? context.theme.primaryColor
                                                      : context.theme.primaryColor.withOpacity(0.55))),
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
                                      style: context.textTheme.headline2.copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
                                  Text(productController.listProduct[indexSwiper].productPrice.toString(),
                                      style: context.textTheme.headline4
                                          .copyWith(color: context.theme.primaryColor, fontWeight: FontWeight.bold)),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(productController.listProduct[indexSwiper].productPrice.toString(),
                                          style: context.textTheme.headline5.copyWith(decoration: TextDecoration.lineThrough)),
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
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Review",
                                        style: context.textTheme.headline5.copyWith(fontWeight: FontWeight.bold, color: Colors.black)),
                                    Text("See All Review >", style: context.textTheme.headline5)
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: context.theme.primaryColor.withOpacity(0.25), borderRadius: BorderRadius.circular(15)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Center(
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.star),
                                                  Text(
                                                    "4.8",
                                                    style: context.textTheme.headline5.copyWith(color: Colors.black.withOpacity(0.5)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text("9 Reviews", style: context.textTheme.headline5.copyWith(color: context.theme.primaryColor)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular((100)),
                                          color: const Color(0xffffbcb3),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular((100)),
                                          child: Image.network(
                                            "https://pbs.twimg.com/profile_images/765839667446939649/E3wjG-7g.jpg",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Row(
                                        children: [
                                          for (bool isStarred in List.generate(5, (i) => i < 4 ? true : false))
                                            Icon(Icons.star, color: isStarred == true ? context.theme.primaryColor : Colors.grey)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  "lorem ipsum lorem ipsumlorem ipsum lorem ipsum",
                                  style: context.textTheme.headline4,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Product Details",
                                  style: context.textTheme.headline5.copyWith(fontWeight: FontWeight.bold, color: Colors.black)),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Weight", style: context.textTheme.headline5.copyWith(fontWeight: FontWeight.bold)),
                                    Text("1 Kg", style: context.textTheme.headline5),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Condition", style: context.textTheme.headline5.copyWith(fontWeight: FontWeight.bold)),
                                    Text("New", style: context.textTheme.headline5),
                                  ],
                                ),
                              ),
                              Text("Description",
                                  style: context.textTheme.headline5.copyWith(fontWeight: FontWeight.bold, color: Colors.black)),
                              Text(
                                "lorem ipsum lorem ipsumlorem ipsum lorem ipsum",
                                style: context.textTheme.headline4,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  "Read more",
                                  style: context.textTheme.headline4.copyWith(color: Colors.blueAccent),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Store",
                                        style: context.textTheme.headline5.copyWith(fontWeight: FontWeight.bold, color: Colors.black)),
                                    Text("See The Store >", style: context.textTheme.headline5),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular((100)),
                                          color: const Color(0xffffbcb3),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular((100)),
                                          child: Icon(Icons.shop),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(kPopularShopData[Random().nextInt(7)][0],
                                              style: context.textTheme.headline5.copyWith(fontWeight: FontWeight.bold)),
                                          Row(
                                            children: [
                                              Icon(Icons.location_pin, color: Colors.grey, size: 15),
                                              SizedBox(width: 2),
                                              Text(kPopularShopData[Random().nextInt(7)][1],
                                                  style: context.textTheme.headline5.copyWith(fontWeight: FontWeight.bold)),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Related Product",
                                      style: context.textTheme.headline5.copyWith(fontWeight: FontWeight.bold, color: Colors.black)),
                                  Text("See All >", style: context.textTheme.headline5),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
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
                                                        productController
                                                            .listProduct[indexSwiper].imageUrl[productController.indexProductPicture.value],
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
                                                    style: context.textTheme.headline2
                                                        .copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
                                                Text(productController.listProduct[indexSwiper].productPrice.toString(),
                                                    style: context.textTheme.headline4
                                                        .copyWith(color: context.theme.primaryColor, fontWeight: FontWeight.bold)),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Text(productController.listProduct[indexSwiper].productPrice.toString(),
                                                        style:
                                                            context.textTheme.headline5.copyWith(decoration: TextDecoration.lineThrough)),
                                                    SizedBox(width: 10),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          color: context.theme.primaryColor.withOpacity(0.25),
                                                          borderRadius: BorderRadius.circular(10)),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(4.0),
                                                        child: Center(
                                                          child: Text("50%",
                                                              style: context.textTheme.headline5
                                                                  .copyWith(color: context.theme.primaryColor.withOpacity(1))),
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
                                    ),
                                    Container(
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
                                                        productController
                                                            .listProduct[indexSwiper].imageUrl[productController.indexProductPicture.value],
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
                                                    style: context.textTheme.headline2
                                                        .copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
                                                Text(productController.listProduct[indexSwiper].productPrice.toString(),
                                                    style: context.textTheme.headline4
                                                        .copyWith(color: context.theme.primaryColor, fontWeight: FontWeight.bold)),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Text(productController.listProduct[indexSwiper].productPrice.toString(),
                                                        style:
                                                            context.textTheme.headline5.copyWith(decoration: TextDecoration.lineThrough)),
                                                    SizedBox(width: 10),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          color: context.theme.primaryColor.withOpacity(0.25),
                                                          borderRadius: BorderRadius.circular(10)),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(4.0),
                                                        child: Center(
                                                          child: Text("50%",
                                                              style: context.textTheme.headline5
                                                                  .copyWith(color: context.theme.primaryColor.withOpacity(1))),
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
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: widthApp * 0.175,
                                    height: widthApp * 0.125,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: const Color(0xffeaf2f5),
                                    ),
                                    child: Center(
                                      child: Icon(Icons.shopping_bag, color: context.theme.primaryColor),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    width: widthApp * 0.7,
                                    height: widthApp * 0.125,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: const Color(0xff3fda9b),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Buy",
                                        style: context.textTheme.headline3,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
