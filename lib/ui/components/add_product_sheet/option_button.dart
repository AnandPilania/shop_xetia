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
      dropdownColor: context.theme.primaryColorLight,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: context.theme.primaryColor.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: context.theme.primaryColor),
            borderRadius: BorderRadius.circular(10)),
        border: OutlineInputBorder(
            borderSide:
                BorderSide(color: context.theme.primaryColor.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(10)),
        hintText: kInputHere.tr,
        hintStyle: context.textTheme.headline4
            .copyWith(color: context.theme.primaryColorDark),
        focusColor: context.theme.primaryColor,
      ),
      value: option,
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: context.theme.primaryColor,
      ),
      elevation: 16,
      style: context.textTheme.headline4
          .copyWith(color: context.theme.primaryColorDark),
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
