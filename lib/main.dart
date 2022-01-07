import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx1/second_screen/second_screen.dart';

import 'app/whole_app_dependency_binding.dart';
import 'first_screen/first_screen.dart';
import 'first_screen/first_screen_dependency_binding.dart';
import 'second_screen/second_screen_dependency_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String title = "Understanding Bindings";

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: title,
      initialBinding: WholeAppDependencyBinding(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/first",
      getPages: [
        GetPage(
          name: "/first",
          page: () => const FirstScreen(),
          bindings: [
            FirstScreenDependencyBinding(),
          ],
        ),
        GetPage(
          name: "/second",
          page: () => const SecondScreen(),
          bindings: [
            SecondScreenDependencyBinding(),
          ],
        ),
      ],
    );
  }
}
