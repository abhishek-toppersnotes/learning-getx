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
      "Simple state mgmt using GetBuilder() builder function";

  // ? We can't use 'static' here
  // ? Need to ask why that is so?
  // ? I have used static controller in lecture9 as well, and there it works as expected
  // final IncrementController incrementController = Get.put(
  //     IncrementController()); // ! NOT just IncrementController(), must use Get.put()

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
                // If we don't define [init] of GetX, we must have a controller initialized to use the value
                // Otherwise, it will throw error
                //
                // If we have initialized the controller else where, we can
                init: IncrementController(),

                builder: (controller) {
                  // If we are using [init]
                  return Text("Current Value: ${controller.counterValue}");

                  // If we are having an instance defined somewhere else, [currentValue] received
                  // is not even required
                  // return Text(
                  //     "Current Value: ${incrementController.counterValue}");
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  // If we have used the [init] parameter of the GetX builder to initialize the controller,
                  // then we must first find the instance of that controller
                  //
                  // Use this only if we don't have the instance available here
                  Get.find<IncrementController>().increment();

                  // If we have access to the [IncrementController] direcly (like if we have initialized it)
                  // incrementController.increment();
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
