import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/language/_components.dart';
import 'package:xetia_shop/ui/components/_components.dart';

class SellerInformation extends StatelessWidget {
  const SellerInformation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        XetiaDivider(),
        ToggleButton(
          text: kWholesaler.tr,
          value: true,
          onTap: () {},
          onChanged: (bool value) {},
        ),
        ToggleButton(
          text: kPreOrder.tr,
          value: true,
          onTap: () {},
          onChanged: (bool value) {},
        ),
      ],
    );
  }
}
