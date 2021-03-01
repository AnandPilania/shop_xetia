import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/language/_components.dart';
import 'package:xetia_shop/ui/components/_components.dart';
import 'package:xetia_shop/utils/_utils.dart';

class DeliveryInformation extends StatelessWidget {
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
          kDeliveryDetail.tr,
          style: context.textTheme.headline3,
        ),
        SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: OptionButtons(
                listOption: _optionButtonController.weights,
                option: _optionButtonController.weight,
                onChanged: _optionButtonController.setWeight,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(
                  left: 5,
                ),
                child: XetiaTextField(
                  textInputType: TextInputType.text,
                  controller: _addProductController.weightController,
                  validator: Validator().notEmpty,
                  hintText: kWeight.tr,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: OptionButtons(
                listOption: _optionButtonController.heights,
                option: _optionButtonController.height,
                onChanged: _optionButtonController.setHeight,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(
                  left: 5,
                ),
                child: XetiaTextField(
                  textInputType: TextInputType.text,
                  controller: _addProductController.heightController,
                  validator: Validator().notEmpty,
                  hintText: kHeight.tr,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
