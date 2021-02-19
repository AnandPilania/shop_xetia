import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TextFieldName extends StatelessWidget {
  final String hintText;
  final IconData iconData;
  final ValueChanged<String> validator;
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool isPassword;

  const TextFieldName({Key key, this.hintText, this.iconData, this.validator, this.controller, this.textInputType, this.isPassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isObscure = isPassword ? true : false;
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
                        icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility, color: context.theme.accentColor),
                        onPressed: () {
                          isObscure = !isObscure;
                        },
                      )
                    : null,
              ),
              cursorColor: context.theme.accentColor,
              style: TextStyle(color: context.theme.primaryColor),
              keyboardType: null,
              obscureText: false,
            ),
          ),
        )
      ],
    );
  }
}
