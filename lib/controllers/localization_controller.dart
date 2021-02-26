import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:xetia_shop/constants/key_name.dart';
import 'package:xetia_shop/constants/language_key.dart';
import 'package:xetia_shop/utils/localization.dart';

class LocalizationController extends GetxController {
  final RxString _language = "".obs;
  set language(value) => this._language.value = value;
  get language => this._language.value;

  final box = GetStorage();

  void _checkLocale() {
    if (Get.locale == locales[0]) {
      language = langs[0];
    } else if (Get.locale == locales[1]) {
      language = langs[1];
    } else {
      language = langs[2];
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    if (box.read(kLanguage) != null) {
      language = box.read(kLanguage);
      changeLanguage(box.read(kLanguage));
    } else {
      _checkLocale();
    }
    super.onInit();
  }

  void changeLanguage(lang) {
    language = lang;
    box.write(kLanguage, lang);
    Localization().changeLocale(lang);
  }
}
