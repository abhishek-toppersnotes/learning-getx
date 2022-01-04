// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx1/app_translations.dart';
import 'package:getx1/language_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String title =
      "Language Translations/ Internationalization of App";

  static final LanguageController languageController = LanguageController();

  @override
  Widget build(BuildContext context) {
    // To make use of Translation service provided by Get, it is necessary to use GetMaterialApp()
    // as it provides the parameter [translations]
    return GetMaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,

      // This is where we define all the translation for the app
      // We create a custom class for this
      // We can also make use of [translationsKeys] parameter for the same
      translations: AppTranslations(),

      // To have a default device language we use [locale] parameter
      locale: Get
          .deviceLocale, // We can also set it straight to a value like Locale('en', 'US')

      // If the defined [locale] value is not found in our translation,
      // we can use the [fallbackLocale] to show that instead
      fallbackLocale: Locale('en', 'US'),

      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // The translations is handled automatically behind the scenes, and DOESN'T REQUIRE
              // any wrapper for a specific widget
              Text(
                "hello".tr,
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  LanguageController.changeLanguageToHindi();
                },
                child: Text("Hindi"),
              ),
              ElevatedButton(
                onPressed: () {
                  LanguageController.changeLanguageToEnglish();
                },
                child: Text("English"),
              ),
              ElevatedButton(
                onPressed: () {
                  LanguageController.changeLanguageToFrench();
                },
                child: Text("French"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
