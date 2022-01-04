// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String title = "BottomSheet and Dynamic Theming";

  @override
  Widget build(BuildContext context) {
    // We are using this GetMaterialApp() because we are making use of route management from Get in this example
    // like showing the overlay(Get.snackbar(), Get.defaultDialog(), etc)
    return GetMaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // If we execute multiple Get.bottomSheet(), all bottomSheets are shown at once with the last
              // one called at the top, and the first one called at the bottom of the stack
              Get.bottomSheet(
                // Mention the widget you want to display
                Wrap(
                  children: [
                    ListTile(
                      title: Text("Light Theme"),
                      leading: Icon(Icons.wb_sunny_outlined),
                      onTap: () {
                        // This method can change the theme directly
                        Get.changeTheme(ThemeData.light());
                      },
                    ),
                    ListTile(
                      title: Text("Dark Theme"),
                      leading: Icon(Icons.dark_mode),
                      onTap: () {
                        // This method can change the theme directly
                        Get.changeTheme(ThemeData.dark());
                      },
                    ),
                  ],
                ),

                // Defines the background color of the bottomSheet
                // ! NOT the blur color, but the bottomSheet color
                backgroundColor: Colors.pink,

                // Defines the color behind the bottomsheet(Blurred color sort of)
                // MAKE SURE to use some opacity with the color to make the back screen visible
                barrierColor: Colors.amber.withOpacity(0.1),

                // Defines whether the bottomsheet should be allowed to dismissed, if we click
                // anywhere outside it
                isDismissible: true,

                // Defines the shape of the bottomSheet
                // Any color defined in the [backgroundColor] will be applied only to the shape,
                // and not outside or behind the bottom sheet
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(
                    color: Colors.purple,
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                ),

                // By default, it is possible to drag the bottom sheet.
                // Use this if you want to change this behaviour
                enableDrag: false,
              );
            },
            child: Text("Show bottomsheet"),
          ),
        ),
      ),
    );
  }
}
