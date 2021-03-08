import 'package:flutter/material.dart';
import 'package:get/get.dart';

class XetiaTextField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> validator;
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool isPassword;
  final bool isObscure;
  final Function changeObscure;
  final FocusNode focusNode;
  final FocusNode nextFocus;
  final IconData prefixIcon;
  final IconData suffixIcon;

  XetiaTextField({
    this.hintText,
    this.validator,
    this.controller,
    this.textInputType,
    this.isPassword = false,
    this.isObscure = false,
    this.changeObscure,
    this.focusNode,
    this.nextFocus,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,
            validator: validator,
            focusNode: focusNode,
            decoration: InputDecoration(
              prefixIcon: prefixIcon == null
                  ? null
                  : IconTheme(
                      child: Icon(prefixIcon), data: context.theme.iconTheme),
              hintText: hintText,
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                          isObscure ? Icons.visibility_off : Icons.visibility,
                          color: context.theme.primaryColor),
                      onPressed: changeObscure,
                    )
                  : suffixIcon == null
                      ? null
                      : IconButton(
                          icon: IconTheme(
                              child: Icon(suffixIcon),
                              data: context.theme.iconTheme),
                          onPressed: changeObscure,
                        ),
            ),
            cursorColor: context.theme.accentColor,
            style: context.textTheme.headline3
                .copyWith(color: context.theme.primaryColorLight),
            keyboardType: null,
            obscureText: isPassword ? isObscure : false,
            onFieldSubmitted: (_) => nextFocus == null
                ? FocusScope.of(context).unfocus()
                : FocusScope.of(context).requestFocus(nextFocus),
          ),
        )
      ],
    );
  }
}
