import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/controllers/_controllers.dart';

class XetiaBottomBar extends StatelessWidget {
  final BottomNavBarController bottomBarController = Get.find();

  @override
  Widget build(BuildContext context) {
    return FluidNavBar(
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
      onChange: bottomBarController.changeBottomBarPosition,
    );
  }
}
