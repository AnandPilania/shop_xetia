import 'package:flutter/material.dart';
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
          text: "WholeSaler",
          value: true,
          onTap: () {},
          onChanged: (bool value) {},
        ),
        ToggleButton(
          text: "Saler",
          value: true,
          onTap: () {},
          onChanged: (bool value) {},
        ),
      ],
    );
  }
}
