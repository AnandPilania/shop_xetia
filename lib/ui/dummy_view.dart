import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/controllers/header_home_controller.dart';
import 'package:xetia_shop/utils/theme.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';

class DummyThemeing extends StatelessWidget {
  final controllerPage = Get.put(HeaderHomeController());
  static List<List<dynamic>> headingObject = [
    ["Shop", Icons.shopping_cart],
    ["Account", Icons.person],
    ["Message", Icons.message]
  ];

  @override
  Widget build(BuildContext context) {
    final double paddingTop = Get.context.mediaQueryPadding.top;
    final double widthApp = Get.context.width;
    final double heightApp = Get.context.height - paddingTop;
    print(Get.theme.textTheme.headline1);
    return Scaffold(
      body: Column(
        children: [
          Container(height: paddingTop, width: widthApp, color: context.theme.primaryColorDark),
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
                Container(
                  height: heightApp * 0.075,
                  child: Column(
                    children: [
                      Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for (var object in headingObject)
                                GestureDetector(
                                  onTap: () => controllerPage.changeHeader(object[0], headingObject.indexOf(object)),
                                  child: Container(
                                      width: widthApp * 0.3,
                                      height: heightApp * 0.06,
                                      child: AnimatedSwitcher(
                                          duration: Duration(milliseconds: 450),
                                          child: controllerPage.currentHeader.value != object[0]
                                              ? Icon(object[1], size: 24)
                                              : Text(object[0], style: context.textTheme.headline1))),
                                ),
                            ],
                          )),
                      Expanded(
                        child: Stack(
                          children: [
                            Obx(() => AnimatedPositioned(
                                  left: (widthApp * 0.05) + ((widthApp * 0.325) * controllerPage.currentBarHeader.value),
                                  duration: Duration(milliseconds: 450),
                                  child: Container(height: 3, width: widthApp * 0.25, color: context.theme.primaryColor),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Center(
                  child: Text(
                    "Halal Food in Japan",
                    style: context.textTheme.headline2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, left: 10, right: 10, bottom: 10),
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
      bottomNavigationBar: FluidNavBar(
        style: FluidNavBarStyle(
          iconBackgroundColor: context.theme.primaryColor,
          iconUnselectedForegroundColor: const Color(0xff616569),
          barBackgroundColor: context.theme.primaryColor,
        ),
        icons: [
          FluidNavBarIcon(icon: Icons.home),
          FluidNavBarIcon(icon: Icons.library_add_check_sharp),
          FluidNavBarIcon(icon: Icons.shopping_cart_outlined),
          FluidNavBarIcon(icon: Icons.list_sharp)
        ],
        onChange: (_) {},
      ),
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
