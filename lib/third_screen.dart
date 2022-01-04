// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Third Screen"),
            ElevatedButton(
              onPressed: () {
                // This is similar to Get.offAll()
                // * Moving to this screen will clear the
                // * navigation stack and place the new screen at the top
                // * e.g. before
                // *    [
                // *      <this_screen>
                // *      <some_other_screen>
                // *      <other_screens>
                // *    ]
                // *   after
                // *    [
                // *      <second_screen>
                // *    ]
                Get.offAllNamed("/");
              },
              child: Text("Go to First Screen"),
            ),

            // Using the parameterized [getPages] (see main.dart)
            Text("Data from first Screen: ${Get.parameters['parameter3']}"),

            // ? NEED TO find the correct way to add multiple parameters, right now using this
            // name: "/third/:parameter3/:parameter4",
            // Text("Data from first Screen: ${Get.parameters['parameter4']}"), //this works
          ],
        ),
      ),
    );
  }
}
