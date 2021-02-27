import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/language_key.dart';
import 'package:xetia_shop/language/_components.dart';

class Localization extends Translations {
  static final locale = Get.deviceLocale;
  static final fallbackLocale = Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'id_ID': idId,
        'ja_JP': jaJP,
      };

  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale);
  }

  Locale _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }
}
