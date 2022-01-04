// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx1/increment_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  static const String title = "Workers in GetxController";

  final IncrementController incrementController =
      Get.put(IncrementController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GetX<IncrementController>(
                builder: (_) {
                  return Text(
                      "Counter Value: ${incrementController.counter.value}");
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  incrementController.increment();
                },
                child: Text("Increment Counter"),
              ),
              SizedBox(height: 20),
              Text("Look in the debug console for workers info"),
            ],
          ),
        ),
      ),
    );
  }
}
