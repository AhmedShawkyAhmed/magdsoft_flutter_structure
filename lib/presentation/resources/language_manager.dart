import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';
import '../../data/local/cache_helper.dart';

enum LanguageType { ENGLISH, ARABIC }

const String ARABIC = "ar";
const String ENGLISH = "en";
const String ASSET_PATH_LOCALISATIONS = "assets/i18n";

const Locale ARABIC_LOCAL = Locale("ar");
const Locale ENGLISH_LOCAL = Locale("en");

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.ARABIC:
        return ARABIC;
    }
  }
}

class LanguageManager {
  static Future<String> getAppLanguage() async {
    String? language = CacheHelper.getDataFromSharedPreference(
        key: AppConstants.appLanguageSharedKey);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ENGLISH.getValue();
    }
  }

  static Future<void> changeAppLanguage() async {
    String currentLang = await getAppLanguage();
    if (currentLang == LanguageType.ARABIC.getValue()) {
      CacheHelper.saveDataSharedPreference(
          key: AppConstants.appLanguageSharedKey,
          value: LanguageType.ENGLISH.getValue());
    } else {
      CacheHelper.saveDataSharedPreference(
          key: AppConstants.appLanguageSharedKey,
          value: LanguageType.ARABIC.getValue());
    }
  }

  static Future<Locale> getLocal() async {
    String currentLang = await getAppLanguage();
    if (currentLang == LanguageType.ARABIC.getValue()) {
      return ARABIC_LOCAL;
    } else {
      return ENGLISH_LOCAL;
    }
  }
}
