import "dart:ui";

import "package:get/get.dart";
import "package:todo/core/local_languages/supported_languages/english.dart";
import "package:todo/core/local_languages/supported_languages/portuguese.dart";

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => <String, Map<String, String>>{
        "en_US": English.english,
        "ar_EG": Portuguese.portuguese,
      };
}

final List<Map<String, dynamic>> locales = <Map<String, dynamic>>[
  <String, dynamic>{
    "name": "ENGLISH",
    "locale": const Locale("en", "US"),
  },
  {
    "name": "ARABIC",
    "locale": const Locale("ar", "EG"),
  },
];
