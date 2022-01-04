// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx1/increment_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  static const String title = "GetxController Lifecycle Methods";

  // * STATIC KEYWORD WORKS HERE only if I make use of [initState] parameter in the
  // * GetBuilder builder function, such that it calls any random
  // * function of the controller (like incrementController.toString())
  // static
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
                // This is called when this widget is created, after the onInit() method
                initState: (state) {
                  incrementController.increment();

                  // Experiment with static controller:-
                  // incrementController.toString();
                },

                // Cleanup happens by default, but still if you want, you can use this parameter
                // It is generally recommended to use the onClose() in the controller class itself
                // dispose: (state) => incrementController.cleanUp(),
                builder: (controller) {
                  // Here, we are having an instance defined somewhere else, [controller] received
                  // is not even required
                  return Text(
                      "Current Value: ${incrementController.counterValue}");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
