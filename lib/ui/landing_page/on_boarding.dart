import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/language/_components.dart';
import 'package:xetia_shop/ui/components/button_flat.dart';

class OnBoardingPage extends StatelessWidget {
  final lottieController = Get.put(LandingLottieController());
  final signInController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: paddingTop),
          height: heightApp,
          width: widthApp,
          child: Column(
            children: [
              Spacer(),
              SizedBox(
                height: heightApp * 0.1,
                width: widthApp * 0.95,
                child: Obx(
                  () => AutoSizeText(
                    kListText[lottieController.pageNumber][0].tr,
                    style: context.textTheme.headline1
                        .copyWith(color: context.theme.primaryColor),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                ),
              ),
              SizedBox(
                width: widthApp * 0.9,
                height: heightApp * 0.1,
                child: Obx(() => Text(
                      kListText[lottieController.pageNumber][1].tr,
                      style: context.textTheme.headline3,
                      textAlign: TextAlign.center,
                    )),
              ),
              Spacer(),
              CarouselSlider(
                options: CarouselOptions(
                    height: heightApp * 0.4,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 4),
                    autoPlayAnimationDuration: Duration(milliseconds: 500),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    onPageChanged: (page, reason) {
                      lottieController.pageNumber = page;
                    },
                    scrollDirection: Axis.horizontal),
                items: kLottie.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: heightApp * 0.4,
                        width: heightApp * 0.4,
                        child: LottieBuilder.asset(i, repeat: true),
                      );
                    },
                  );
                }).toList(),
              ),
              Spacer(),
              Stack(
                children: [
                  Container(
                    width: widthApp * 0.75,
                    height: heightApp * 0.02,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      color: const Color(0xfffdf6f3),
                    ),
                  ),
                  Obx(
                    () => AnimatedPositioned(
                      left:
                          widthApp * ((lottieController.pageNumber * 2.5) / 10),
                      duration: Duration(milliseconds: 500),
                      child: Container(
                        width: widthApp * 0.25,
                        height: heightApp * 0.02,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          color: const Color(0xffeb6e5a),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(flex: 2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: MyButton(
                    onTap: () {
                      lottieController.changeToSignIn();
                      signInController.changeOnBoardState(false);
                    },
                    text: kContinue.tr,
                    color: context.theme.primaryColor),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
