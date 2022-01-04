// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  static const String title =
      "Reactive state management using Obx and normal datatypes";

  // To automatically update the value AT ALL PLACES wherever this value is used
  RxInt counterValue = 0.obs;
  // or
  // Rx<int> counterValue = 0.obs;

  // * Writing both the business logic and ui logic in the same file is not
  // * really a good way to go.
  // * In a later branch we make use of getx controller for the segregation

  // Business Login
  void incrementValue() {
    // If using RxInt, increment directly
    counterValue++;

    // If using Rx<int>, increment like this
    // counterValue.value++;
  }

  // UI Logic
  @override
  Widget build(BuildContext context) {
    // Here GetMaterialApp() is NOT used because, we are not dealing with route management
    // in this example.
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
              Text("Clicked"),
              // To automatically update the widget, when the value is changed,
              // Obx() must be used
              Obx(
                () => Text("${counterValue.value}",
                    style: TextStyle(fontSize: 24)),
              ),
              Text("times"),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: incrementValue,
                child: Text("Click here"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
