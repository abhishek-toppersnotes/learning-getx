// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx1/main.dart';

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
            Text("3rd Screen"),
            ElevatedButton(
              onPressed: () {
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
                Get.offAll(() => FirstScreen());
              },
              child: Text("Pop this screen"),
            ),
          ],
        ),
      ),
    );
  }
}
