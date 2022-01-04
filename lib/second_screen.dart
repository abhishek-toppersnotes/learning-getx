// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            Text("Second Screen"),
            ElevatedButton(
              onPressed: () {
                // To move to the next screen.
                // This will refer the [getPages] argument of GetMaterialApp()
                // for the given name
                // * IF THE NAME IS NOT FOUND, it just moves to "/", and if "/" points to nothing
                // * then throws a error (castError)
                Get.toNamed("/notDefined");
                //
                // * Only works if defined like "/third" and not "/third/:parameterName"
                // Get.toNamed("/third");
              },
              child: Text("Go the Third Screen"),
            ),
            ElevatedButton(
              onPressed: () {
                // Pops the current screen
                Get.back();
              },
              child: Text("Pop this screen"),
            ),
            SizedBox(height: 20),
            Text(
                "Value of parameter1 from First screen: ${Get.parameters['parameter1']}"),
            Text(
                "Value of parameter 2 from First screen: ${Get.parameters['parameter 2']}"),
          ],
        ),
      ),
    );
  }
}
