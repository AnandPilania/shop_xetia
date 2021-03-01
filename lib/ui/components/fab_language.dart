import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/dimens.dart';
import 'package:xetia_shop/constants/language_key.dart';
import 'package:xetia_shop/controllers/_controllers.dart';

class FABLanguage extends StatelessWidget {
  final LocalizationController controller = Get.find<LocalizationController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0, right: 8),
      child: FloatingActionButton(
        backgroundColor: Colors.transparent.withOpacity(0.5),
        heroTag: null,
        onPressed: () {},
        child: Center(
          child: Obx(() => Material(
                child: DropdownButtonHideUnderline(
                  child: Container(
                    color: Colors.transparent,
                    child: DropdownButton(
                        isExpanded: false,
                        iconSize: 0,
                        dropdownColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        value: controller.language,
                        items: [
                          DropdownMenuItem(
                            child: SvgPicture.asset("assets/svg/america.svg"),
                            value: langs.first,
                          ),
                          DropdownMenuItem(
                            child: SvgPicture.asset("assets/svg/indonesia.svg"),
                            value: langs[1],
                          ),
                          DropdownMenuItem(
                            child: SvgPicture.asset("assets/svg/japan.svg"),
                            value: langs[2],
                          ),
                        ],
                        onChanged: (value) {
                          controller.changeLanguage(value);
                        }),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
