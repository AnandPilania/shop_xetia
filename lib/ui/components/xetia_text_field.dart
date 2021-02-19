import 'package:flutter/material.dart';
import 'package:get/get.dart';

class XetiaTextField extends StatelessWidget {
  final String hintText;
  final IconData iconData;
  final ValueChanged<String> validator;
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool isPassword;
  final bool isObscure;
  final Function changeObscure;

  XetiaTextField({
    Key key,
    this.hintText,
    this.iconData,
    this.validator,
    this.controller,
    this.textInputType,
    this.isPassword = false,
    this.isObscure = false,
    this.changeObscure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        iconData == null
            ? SizedBox()
            : Stack(
                children: [
                  Container(
                    width: 40,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: context.theme.primaryColor,
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: context.theme.primaryColor.withOpacity(0.5),
                    ),
                    child: Center(
                      child: Icon(
                        iconData,
                        color: context.theme.accentColor,
                      ),
                    ),
                  ),
                ],
              ),
        iconData == null
            ? SizedBox()
            : SizedBox(
                width: 20,
              ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              controller: controller,
              validator: validator,
              decoration: InputDecoration(
                hintText: hintText,
                suffixIcon: isPassword
                    ? IconButton(
                        icon: Icon(
                            isObscure ? Icons.visibility_off : Icons.visibility,
                            color: context.theme.primaryColor),
                        onPressed: changeObscure,
                      )
                    : null,
              ),
              cursorColor: context.theme.accentColor,
              style: context.textTheme.headline3
                  .copyWith(color: context.theme.primaryColorDark),
              keyboardType: null,
              obscureText: isPassword ? isObscure : false,
            ),
          ),
        )
      ],
    );
  }
}
