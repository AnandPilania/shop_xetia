import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/controllers/_controllers.dart';

class FABTheme extends StatelessWidget {
  final ThemeController controller = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 48.0, right: 8),
      child: FloatingActionButton(
        heroTag: null,
        onPressed: () {
          controller.changeTheme(!controller.isDark.value);
          Get.changeTheme(controller.theme);
        },
        child: Icon(
            controller.isDark.value ? Icons.brightness_1 : Icons.brightness_2),
      ),
    );
  }
}
