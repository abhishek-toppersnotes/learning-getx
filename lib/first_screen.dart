// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Route navigation for named routes"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("First Screen"),
            ElevatedButton(
              onPressed: () {
                // To move to the next screen.
                // This will refer the [getPages] argument of GetMaterialApp()
                // for the given name
                // * IF THE NAME IS NOT FOUND, it just moves to "/", and if "/" points to nothing
                // * then throws a error (castError)
                Get.toNamed("/second");

                // This is similar to Get.off()
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
                // Get.offNamed("/second");

                // We can also call a dynamic URL like the following
                // We can only pass [String] values through here
                // * MAKE SURE to use the Get.parameters (type Map<String, String?>) in the given screen
                // ! NOTE that it is NOT Get.arguments
                // Get.toNamed(
                //     "/second?parameter1=Some Value1&parameter 2=Some Value2");
              },
              child: Text("Go to 2nd Screen"),
            ),
            ElevatedButton(
              onPressed: () {
                // Making use of:
                // GetPage(
                //   name: "/third/:parameter3",
                //  // name: "/third/:parameter3/:parameter4",
                //   page: () => ThirdScreen(),
                // ),
                // * MAKE SURE to use the Get.parameters (type Map<String, String?>) in the given screen
                //  // Get.toNamed("/third/1234/5678");
                //
                // * This WILL WORK even if page is defined just for "/third" and NOT "/third/:parameterName"
                Get.toNamed("/third/1234");
              },
              child: Text("Go to 3rd Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
