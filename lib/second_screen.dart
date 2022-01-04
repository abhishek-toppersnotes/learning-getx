// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx1/third_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("2nd Screen"),
            ElevatedButton(
              onPressed: () {
                Get.to(() => ThirdScreen());
              },
              child: Text("Go to 3rd Screen"),
            ),
            ElevatedButton(
              onPressed: () {
                // This pops the current Screen
                // Get.back();

                // You can also send some data back to the previous screen
                Get.back(
                  result: "You're the best",
                );
              },
              child: Text("Pop this screen"),
            ),
            SizedBox(
              height: 20,
            ),

            // You can use Get.arguments to fetch the value passed to this screen
            // using the Get.to(--- , arguments: <arguments>)
            // * If no data is passed Get.arguments returns null
            //
            // if (Get.arguments != null)
            Text("Passed Data: ${Get.arguments}"),
          ],
        ),
      ),
    );
  }
}
