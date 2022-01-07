// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx1/home.dart';
import 'package:getx1/random_class.dart';

void main() async {
  await getServices();
  runApp(MyApp());
}

Future<void> getServices() async {
  print("starting to get services");
  Get.putAsync(() async => await RandomClass.getInstance());
  print("got the services");
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String title = "using GetxService as dependency";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
