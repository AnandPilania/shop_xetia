import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTextFieldPassword extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> validator;
  final TextEditingController controller;
  final Function onObscure;
  final bool isObscure;

  MyTextFieldPassword(
      {Key key,
      this.hintText,
      this.validator,
      this.controller,
      this.onObscure,
      this.isObscure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 40,
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: context.theme.primaryColor,
          ),
          child: Center(
            child: Icon(
              Icons.lock,
              color: context.theme.accentColor,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: TextFormField(
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: context.theme.accentColor.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: context.theme.accentColor),
                borderRadius: BorderRadius.circular(5),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: context.theme.accentColor.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(5),
              ),
              hintText: hintText,
              hintStyle: TextStyle(color: context.theme.accentColor),
              focusColor: context.theme.accentColor,
              suffixIcon: IconButton(
                icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility,
                    color: context.theme.accentColor),
                onPressed: onObscure,
              ),
            ),
            cursorColor: context.theme.accentColor,
            style: TextStyle(color: context.theme.accentColor),
            obscureText: isObscure,
          ),
        )
      ],
    );
  }
}
