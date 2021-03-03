import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/controllers/_controllers.dart';

import '_components.dart';

class HeaderShopCard extends StatelessWidget {
  final CarouselCardController _carouselCardController =
      Get.put(CarouselCardController());
  final List<Widget> listCard = [
    HeaderShopCardItem(),
    HeaderShopCardItem(),
    HeaderShopCardItem(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      //CarouselSlider
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              //AutoSlide
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              scrollPhysics: BouncingScrollPhysics(),
              onPageChanged: (index, reason) {
                _carouselCardController.currentHeaderShopCard = index;
              },
            ),
            items: listCard.map((card) {
              return Container(
                margin: EdgeInsets.all(5),
                width: widthApp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: card,
              );
            }).toList(),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _carouselCardController.mapCard<Widget>(listCard,
                  (index, url) {
                return Obx(
                  () => Container(
                    width:
                        _carouselCardController.currentHeaderShopCard == index
                            ? 30
                            : 10.0,
                    height: 10.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color:
                          _carouselCardController.currentHeaderShopCard == index
                              ? context.theme.primaryColor
                              : context.theme.primaryColor.withOpacity(0.3),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
