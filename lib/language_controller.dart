// ? Is this the correct way to seperate business logic?
// ? Is this the correct way to create controller, as in this case I have not
// ? really used(extended from) GetxController for any changes
import 'dart:ui';

import 'package:get/get.dart';

class LanguageController {
  static const Locale hindiLocale = Locale("hi", "IN");
  static const Locale englishLocale = Locale("en", "EN");
  static const Locale frenchLocale = Locale("fr", "FR");

  static void changeLanguageToHindi() {
    Get.updateLocale(hindiLocale);
  }

  static void changeLanguageToEnglish() {
    Get.updateLocale(englishLocale);
  }

  static void changeLanguageToFrench() {
    Get.updateLocale(frenchLocale);
  }
}
