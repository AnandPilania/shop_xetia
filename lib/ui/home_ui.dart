import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/dimens.dart';
import 'package:xetia_shop/controllers/controllers.dart';
import 'package:xetia_shop/ui/components/components.dart';
import 'package:xetia_shop/utils/theme.dart';

class HomeUI extends StatelessWidget {
  final controllerPage = Get.put(HeaderHomeController());

  @override
  Widget build(BuildContext context) {
    print(Get.theme.textTheme.headline1);
    return Scaffold(
      body: Column(
        children: [
          Container(
              height: paddingTop,
              width: widthApp,
              color: context.theme.primaryColorDark),
          XetiaTabBar(),
          Container(
            height: heightApp * 0.425,
            width: widthApp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: context.theme.primaryColorDark,
            ),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Halal Food in Japan",
                    style: context.textTheme.headline2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 18.0, left: 10, right: 10, bottom: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter a search term',
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(Icons.camera),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: XetiaBottomBar(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: FloatingActionButton(
                onPressed: () => Get.changeTheme(Themes.dark),
                child: Center(
                  child: Icon(Icons.brightness_2),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: FloatingActionButton(
                onPressed: () => Get.changeTheme(Themes.light),
                child: Center(
                  child: Icon(Icons.brightness_1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
