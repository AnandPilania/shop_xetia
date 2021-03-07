import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/language/_components.dart';

class OptionButtons extends StatelessWidget {
  final List listOption;
  final String option;
  final Function onChanged;

  OptionButtons({
    Key key,
    this.listOption,
    this.option,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      decoration: InputDecoration(
        hintText: kInputHere.tr,
      ),
      value: option,
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: context.theme.primaryColor,
      ),
      dropdownColor: context.theme.primaryColorDark,
      focusColor: context.theme.primaryColorDark,
      elevation: 16,
      style: context.textTheme.headline3
          .copyWith(color: context.theme.primaryColorLight),
      onChanged: onChanged,
      items: listOption.map((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
