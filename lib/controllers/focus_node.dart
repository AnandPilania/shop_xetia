import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class FocusController extends GetxController {
  //Focus Node SignIn
  final FocusNode _emailLogin = FocusNode();
  get emailLogin => this._emailLogin;
  final FocusNode _passwordLogin = FocusNode();
  get passwordLogin => this._passwordLogin;

  final RxBool _isEmailFocus = false.obs;
  set isEmailFocus(value) => this._isEmailFocus.value = value;
  get isEmailFocus => this._isEmailFocus.value;
  final RxBool _isPasswordFocus = false.obs;
  set isPasswordFocus(value) => this._isPasswordFocus.value = value;
  get isPasswordFocus => this._isPasswordFocus.value;

  //Focus Node SignUp - Register
  final FocusNode _firstName = FocusNode();
  get firstName => this._firstName;
  final FocusNode _lastName = FocusNode();
  get lastName => this._lastName;
  final FocusNode _emailSignUp = FocusNode();
  get emailSignUp => this._emailSignUp;
  final FocusNode _passwordSignUp = FocusNode();
  get passwordSignUp => this._passwordSignUp;

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

  //Controller For top login container
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
    emailLogin.addListener(() => isEmailFocus = emailLogin.hasFocus);
    passwordLogin.addListener(() => isPasswordFocus = passwordLogin.hasFocus);
    firstName.addListener(() => firstNameFocus = firstName.hasFocus);
    lastName.addListener(() => lastNameFocus = lastName.hasFocus);
    emailSignUp.addListener(() => emailSignUpFocus = emailSignUp.hasFocus);
    passwordSignUp.addListener(() => passwordSignUpFocus = passwordSignUp.hasFocus);
    super.onInit();
  }

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    emailLogin.dispose();
    emailSignUp.dispose();
    passwordLogin.dispose();
    passwordSignUp.dispose();
    super.dispose();
  }
}
