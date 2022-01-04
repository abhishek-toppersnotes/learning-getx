import 'package:get/get.dart';

// To provide translations for different languages, we extend the [Translations]
// abstract class provided by Get
class AppTranslations extends Translations {
  // By default it has a [keys] getter, which has the Map<> of the following pattern
  // {
  //    "languageCode1_countryCode1" : {
  //         "constantKeyName" : "word or sentence in this language 1",
  //    },
  //    "languageCode2_countryCode2" : {
  //         "constantKeyName" : "word or sentence in this language 2",
  //    },
  // }
  @override
  Map<String, Map<String, String>> get keys {
    return {
      "en_US": {
        "hello": "Hello",
      },
      "hi_IN": {
        "hello": "नमस्कार",
      },
      "fr_FR": {
        "hello": "Boujour",
      },
    };
  }
}
