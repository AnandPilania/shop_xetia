import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/ui/components/_components.dart';
import 'package:xetia_shop/utils/_utils.dart';

class StockInformation extends StatelessWidget {
  final AddProductController _addProductController =
      Get.put(AddProductController());
  final OptionButtonController _optionButtonController =
      Get.put(OptionButtonController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        XetiaDivider(),
        SizedBox(height: 20),
        Text(
          "Stock",
          style: context.textTheme.headline3,
        ),
        SizedBox(height: 15),
        OptionButtons(
          listOption: _optionButtonController.weights,
          option: _optionButtonController.weight,
          onChanged: _optionButtonController.setWeight,
        ),
        SizedBox(height: 15),
        Text(
          "Minimum Order",
          style: context.textTheme.headline3,
        ),
        SizedBox(height: 15),
        XetiaTextField(
          textInputType: TextInputType.text,
          controller: _addProductController.priceController,
          validator: Validator().notEmpty,
          hintText: "Type your minimum order",
        ),
        SizedBox(height: 15),
        Text(
          "Condition",
          style: context.textTheme.headline3,
        ),
        SizedBox(height: 15),
        OptionButtons(
          listOption: _optionButtonController.heights,
          option: _optionButtonController.height,
          onChanged: _optionButtonController.setHeight,
        ),
      ],
    );
  }
}
