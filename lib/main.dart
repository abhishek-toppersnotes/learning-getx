// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx1/second_screen.dart';
import 'package:getx1/third_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String title = "Route navigation for un-named routes";

  @override
  Widget build(BuildContext context) {
    // We are using this GetMaterialApp() because we are making use of route management from Get in this example
    // like showing the overlay(Get.snackbar(), Get.defaultDialog(), etc)
    return GetMaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Route navigation for un-named routes"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("First Screen"),
            ElevatedButton(
              // We are using async here only for one of the cases
              onPressed: () async {
                // If multiple Get navigation commands are executed in the same function,
                // they will be added to the top of the stack one after the other in the
                // order they are executed.

                // This signals the Getx that we want to move to the SecondScreen()
                Get.to(
                  () => SecondScreen(), //or just use SecondScreen(),

                  // Defines whether the screen should open as a full screen dialog
                  // fullscreenDialog: true,

                  // Defines the transition animation
                  transition: Transition.zoom,

                  // Defines how long will the transition take to complete the animation
                  // duration: Duration(milliseconds: 8000),

                  // Defines the animation curve the transition animation should take
                  // This curve will be applied to both during the push and pop of the screen
                  curve: Curves.bounceInOut,
                );

                // This will navigate us to the SecondScreen()
                // * Moving to this screen will replace the current screen place in the
                // * navigation stack.
                // * e.g. before
                // *    [
                // *      <this_screen>
                // *      <some_other_screen>
                // *      <other_screens>
                // *    ]
                // *   after
                // *    [
                // *      <second_screen>
                // *      <some_other_screen>
                // *      <other_screens>
                // *    ]
                // Get.off(SecondScreen());

                // You can also pass data to the next screen
                // * MAKE SURE to use Get.arguments in the next screen
                // * to get this data
                // Get.to(
                //   SecondScreen(),
                //   arguments: "Some value",
                // );

                // You can also get the some data back from the next screen
                // Just make sure to use Get.back(result: <any data type>)
                // and await for the value
                final valueReturned = await Get.to(SecondScreen());
                print("Data Received From Second Screen: $valueReturned");
              },
              child: Text("Go to 2nd Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
