import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/ui/components/_components.dart';
import 'package:xetia_shop/language/_components.dart';

class PostageInformation extends StatelessWidget {
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
          kPostage.tr,
          style: context.textTheme.headline3,
        ),
        SizedBox(height: 15),
        OptionButtons(
          listOption: _optionButtonController.posts,
          option: _optionButtonController.post,
          onChanged: _optionButtonController.setPost,
        ),
      ],
    );
  }
}
