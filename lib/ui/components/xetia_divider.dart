import 'package:flutter/material.dart';
import 'package:get/get.dart';

class XetiaDivider extends StatelessWidget {
  const XetiaDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3,
      decoration: BoxDecoration(
        color: context.theme.primaryColorLight,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
