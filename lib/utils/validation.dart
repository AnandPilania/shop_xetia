// matching various patterns for kinds of data
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:xetia_shop/language/language_key.dart';

class Validator {
  String email(String value) {
    Pattern pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return kErrorEmail.tr;
    else
      return null;
  }

  String password(String value) {
    Pattern pattern = r'^.{6,}$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return kErrorPassword.tr;
    else
      return null;
  }

  String name(String value) {
    Pattern pattern = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return kErrorName.tr;
    else
      return null;
  }

  String number(String value) {
    Pattern pattern = r'^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return kErrorNumber.tr;
    else
      return null;
  }

  String amount(String value) {
    Pattern pattern = r'^\d+$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return kErrorRequired.tr;
    else
      return null;
  }

  String notEmpty(String value) {
    Pattern pattern = r'^\S+$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return kErrorNumberOnly.tr;
    else
      return null;
  }
}
