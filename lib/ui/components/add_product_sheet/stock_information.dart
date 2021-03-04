import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/ui/components/_components.dart';
import 'package:xetia_shop/utils/_utils.dart';
import 'package:xetia_shop/language/_components.dart';

class StockInformation extends StatelessWidget {
  final TextFieldController _textFieldController = Get.find();

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
          kStock.tr,
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
          kMinimumOrder.tr,
          style: context.textTheme.headline3,
        ),
        SizedBox(height: 15),
        XetiaTextField(
          textInputType: TextInputType.text,
          controller: _textFieldController.priceController,
          validator: Validator().notEmpty,
          hintText: kTypeMinimumOrder.tr,
        ),
        SizedBox(height: 15),
        Text(
          kCondition.tr,
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
