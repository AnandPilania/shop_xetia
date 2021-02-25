import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/ui/components/_components.dart';

class AddProductSheet extends StatelessWidget {
  final AddProductController _addProductController =
      Get.put(AddProductController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.scaffoldBackgroundColor,
      child: Column(
        children: [
          SheetHeader(
            title: "Add Products",
            onTap: () {
              Get.back();
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  AddProductPicture(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
