import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToggleButton extends StatelessWidget {
  final String text;
  final bool value;
  final Function onTap;
  final ValueChanged<bool> onChanged;

  const ToggleButton(
      {Key key, this.text, this.value, this.onChanged, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: ListTile(
        title: Text(
          text,
          style: context.textTheme.headline3,
        ),
        trailing: CupertinoSwitch(
          trackColor: context.theme.primaryColorLight,
          activeColor: context.theme.primaryColor,
          value: value,
          onChanged: onChanged,
        ),
        onTap: onTap,
      ),
    );
  }
}
