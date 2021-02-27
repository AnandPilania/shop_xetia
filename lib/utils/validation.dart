// matching various patterns for kinds of data
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class Validator {
  String email(String value) {
    Pattern pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return "err_email".tr;
    else
      return null;
  }

  String password(String value) {
    Pattern pattern = r'^.{6,}$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return "err_password".tr;
    else
      return null;
  }

  String name(String value) {
    Pattern pattern = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return "err_name".tr;
    else
      return null;
  }

  String number(String value) {
    Pattern pattern = r'^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return "err_number".tr;
    else
      return null;
  }

  String amount(String value) {
    Pattern pattern = r'^\d+$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return "err_required".tr;
    else
      return null;
  }

  String notEmpty(String value) {
    Pattern pattern = r'^\S+$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return "err_numberonly".tr;
    else
      return null;
  }
}
