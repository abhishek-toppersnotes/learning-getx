// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx1/increment_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  static const String title =
      "GetBuilder() unique ID and update([id1, id2,..]) usage";

  // ? We can't use 'static' here
  // ? Need to ask why that is so?
  // ? I have used static controller in lecture9 as well, and there it works as expected
  final IncrementController incrementController = Get.put(
      IncrementController()); // ! NOT just IncrementController(), must use Get.put()

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
              GetBuilder<IncrementController>(
                id: "MY_UNIQUE_ID",
                builder: (controller) {
                  return Text(
                      "Current Value: ${incrementController.counterValue}");
                },
              ),
              GetBuilder<IncrementController>(
                builder: (controller) {
                  return Text(
                      "Current Value: ${incrementController.counterValue}");
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  incrementController.increment();
                },
                child: Text("Click Me"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
