// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx1/first_screen.dart';
import 'package:getx1/second_screen.dart';
import 'package:getx1/third_screen.dart';

import 'not_found_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String title = "Route navigation for named routes";

  @override
  Widget build(BuildContext context) {
    // We are using this GetMaterialApp() because we are making use of route management from Get in this example
    // like showing the overlay(Get.snackbar(), Get.defaultDialog(), etc)
    return GetMaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,

      // Also part of the default MaterialApp()
      // initialRoute defines the first route name that should be loaded
      // the route navigation will be done based on [getPages] arguments in the GetMaterialApp()
      // * If both [home] and [initialRoute] are mentioned, [home] takes precedence
      // * DEFAULTS TO "/"
      initialRoute: "/first",

      // Any time the route is not found, instead of pointing to "/", it will call [unknownRoute]
      // ?
      // ? There is an anomaly in my code, for now [unknownRoute] only seem to work if
      // ? no route is defined for "/" (IT DOESN'T DEPEND ON THE VALUE OF [initialRoute])
      unknownRoute: GetPage(name: "/notFound", page: () => NotFoundScreen()),

      // Defines the default transition animation for tranisition between screens
      defaultTransition: Transition.zoom,

      // This is more of less similar to the [routes] parameter but better
      // * MUST mention an intialRoute IF no route is named "/",
      // * IF intialRoute is not mentioned, must have a route named "/"
      // * If initialRoute is not part of [getPages], simply points to "/"
      getPages: [
        GetPage(name: "/first", page: () => FirstScreen()),
        GetPage(name: "/second", page: () => SecondScreen()),
        GetPage(
          name: "/",
          page: () => ThirdScreen(),

          // This will override the [defaultTransition]
          transition: Transition.leftToRight,
        ),
        // GetPage(
        //   // We can also specify parameter names(ONLY) here
        //   // Just make sure to use Get.parameters to get the value (see second_screen.dart or third_screen.dart)
        //   // ? NEED TO find the correct way to add multiple parameters, right now using this
        //   // name: "/third/:parameter3/:parameter4",
        //   name: "/third/:parameter3",
        //   page: () => ThirdScreen(),
        // ),
      ],
    );
  }
}
