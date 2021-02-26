import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/ui/components/_components.dart';
import 'package:xetia_shop/utils/_utils.dart';

class ProductInformation extends StatelessWidget {
  final AddProductController _addProductController =
      Get.put(AddProductController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        XetiaDivider(),
        SizedBox(height: 20),
        Text(
          "Product Name",
          style: context.textTheme.headline3,
        ),
        SizedBox(height: 15),
        XetiaTextField(
          textInputType: TextInputType.text,
          controller: _addProductController.productNameController,
          validator: Validator().notEmpty,
          hintText: "Type your product name",
        ),
        SizedBox(height: 15),
        Text(
          "Category",
          style: context.textTheme.headline3,
        ),
        SizedBox(height: 15),
        XetiaTextField(
          textInputType: TextInputType.text,
          controller: _addProductController.categoryController,
          validator: Validator().notEmpty,
          hintText: "search category",
        ),
        SizedBox(height: 15),
        Text(
          "Price",
          style: context.textTheme.headline3,
        ),
        SizedBox(height: 15),
        XetiaTextField(
          textInputType: TextInputType.text,
          controller: _addProductController.priceController,
          validator: Validator().notEmpty,
          hintText: "Type your product type",
        ),
      ],
    );
  }
}
