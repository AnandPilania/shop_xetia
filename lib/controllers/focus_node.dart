import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FocusController extends GetxController {
  final FocusNode _emailLogin = FocusNode();
  get emailLogin => this._emailLogin;
  final FocusNode _passwordLogin = FocusNode();
  get passwordLogin => this._passwordLogin;

  final FocusNode _firstName = FocusNode();
  get firstName => this._firstName;
  final FocusNode _lastName = FocusNode();
  get lastName => this._lastName;
  final FocusNode _emailSignUp = FocusNode();
  get emailSignUp => this._emailSignUp;
  final FocusNode _passwordSignUp = FocusNode();
  get passwordSignUp => this._passwordSignUp;

  final RxBool _isEmailFocus = false.obs;
  set isEmailFocus(value) => this._isEmailFocus.value = value;
  get isEmailFocus => this._isEmailFocus.value;
  final RxBool _isPasswordFocus = false.obs;
  set isPasswordFocus(value) => this._isPasswordFocus.value = value;
  get isPasswordFocus => this._isPasswordFocus.value;

  final RxBool _firstNameFocus = false.obs;
  set firstNameFocus(value) => this._firstNameFocus.value = value;
  get firstNameFocus => this._firstNameFocus.value;
  final RxBool _lastNameFocus = false.obs;
  set lastNameFocus(value) => this._lastNameFocus.value = value;
  get lastNameFocus => this._lastNameFocus.value;
  final RxBool _emailSignUpFocus = false.obs;
  set emailSignUpFocus(value) => this._emailSignUpFocus.value = value;
  get emailSignUpFocus => this._emailSignUpFocus.value;
  final RxBool _passwordSignUpFocus = false.obs;
  set passwordSignUpFocus(value) => this._passwordSignUpFocus.value = value;
  get passwordSignUpFocus => this._passwordSignUpFocus.value;

  get topContainer => isEmailFocus == true ||
          isPasswordFocus == true ||
          firstNameFocus == true ||
          lastNameFocus == true ||
          emailSignUpFocus == true ||
          passwordSignUpFocus == true
      ? true.obs
      : false.obs;

  @override
  void onInit() {
    emailLogin.addListener(() {
      print("Email has focus: ${emailLogin.hasFocus}");
      isEmailFocus = emailLogin.hasFocus;
    });
    passwordLogin.addListener(() {
      print("Password has focus: ${passwordLogin.hasFocus}");
      isPasswordFocus = passwordLogin.hasFocus;
    });
    firstName.addListener(() {
      print("FirstName has focus: ${firstName.hasFocus}");
      firstNameFocus = firstName.hasFocus;
    });
    lastName.addListener(() {
      print("LastName has focus: ${lastName.hasFocus}");
      lastNameFocus = lastName.hasFocus;
    });
    emailSignUp.addListener(() {
      print("Email has focus: ${emailSignUp.hasFocus}");
      emailSignUpFocus = emailSignUp.hasFocus;
    });
    passwordSignUp.addListener(() {
      print("Password has focus: ${passwordSignUp.hasFocus}");
      passwordSignUpFocus = passwordSignUp.hasFocus;
    });
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    firstName.dispose();
    lastName.dispose();
    emailLogin.dispose();
    emailSignUp.dispose();
    passwordLogin.dispose();
    passwordSignUp.dispose();
    super.dispose();
  }
}
