import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/controllers/_controllers.dart';

class FABTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GetBuilder<ThemeController>(
        init: ThemeController(),
        builder: (controller) => FloatingActionButton(
          onPressed: () {
            controller.changeTheme(!controller.isDark.value);
            Get.changeTheme(controller.theme);
          },
          child: Center(
            child: Icon(controller.isDark.value
                ? Icons.brightness_1
                : Icons.brightness_2),
          ),
        ),
      ),
    );
  }
}
