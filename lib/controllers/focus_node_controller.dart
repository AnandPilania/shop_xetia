import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class FocusNodeController extends GetxController {
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
  final FocusNode _passwordSignUpValidate = FocusNode();
  get passwordSignUpValidate => this._passwordSignUpValidate;

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
  final RxBool _passwordSignUpValidateFocus = false.obs;
  set passwordSignUpValidateFocus(value) => this._passwordSignUpValidateFocus.value = value;
  get passwordSignUpValidateFocus => this._passwordSignUpValidateFocus.value;

  //Focus Node Validate
  final FocusNode _token = FocusNode();
  get token => this._token;

  final RxBool _tokenFocus = false.obs;
  set tokenFocus(value) => this._tokenFocus.value = value;
  get tokenFocus => this._tokenFocus.value;

  //Focus Node Resend Email
  final FocusNode _resendTokenEmail = FocusNode();
  get resendTokenEmail => this._resendTokenEmail;

  final RxBool _resendTokenEmailFocus = false.obs;
  set resendTokenEmailFocus(value) => this._resendTokenEmailFocus.value = value;
  get resendTokenEmailFocus => this._resendTokenEmailFocus.value;

  //Controller For top login container
  get topContainer => isEmailFocus == true ||
          isPasswordFocus == true ||
          firstNameFocus == true ||
          lastNameFocus == true ||
          emailSignUpFocus == true ||
          passwordSignUpFocus == true ||
          passwordSignUpValidateFocus == true ||
          tokenFocus == true ||
          resendTokenEmailFocus == true
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
    passwordSignUpValidate.addListener(() => passwordSignUpValidateFocus = passwordSignUpValidate.hasFocus);
    token.addListener(() => tokenFocus = token.hasFocus);
    resendTokenEmail.addListener(() => resendTokenEmailFocus = resendTokenEmail.hasFocus);
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
    passwordSignUpValidate.dispose();
    resendTokenEmail.dispose();
    token.dispose();
    super.dispose();
  }
}
