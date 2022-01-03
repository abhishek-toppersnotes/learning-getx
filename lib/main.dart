// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String title = "Default Dialog";

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
              // If we call multiple Get.defaultDialog(), all the dialogs will overlap each other
              // causing the last callback to be on the top and first callback to be on the bottom of the stack

              // This works, but is mostly a flex
              // Get.defaultDialog();

              // A more useful dialog
              Get.defaultDialog(
                // Defines what should be the heading of the dialog
                // * NOTE that if we don't define any [title] or [content], it will
                // * just show the flex text. So must set it empty("") for no content
                title: "title1",

                // Defines the style of the title
                titleStyle: TextStyle(
                  color: Colors.pink,
                ),

                // Defines the padding for the title
                titlePadding: EdgeInsets.all(20),

                // Defines what should be the content of the dialog
                // * NOTE that if we don't define any [middleText] or [content], it will
                // * just show the flex text. So must set it empty("") for no content
                //
                // If the content is too long, it will simply throw a general overflow error(like most widgets)
                middleText: "content1",

                // Defines the style of the middleText
                middleTextStyle: TextStyle(
                  color: Colors.purple,
                  fontSize: 30,
                ),

                // Background color of the dialog
                backgroundColor: Colors.black,

                // Defines the border radius of the dialog
                radius: 10,

                // For more control over content/middleText
                // This will take precedence over [middleText] and any of it's related styles
                content: Center(
                  child: CircularProgressIndicator(),
                ),

                // To show a "Cancel" button
                textCancel: "Cancel",

                // Defines the cancel button's TEXT(only, rest remains the same) color
                cancelTextColor: Colors.orange,

                // callback for Cancel button
                onCancel: () {
                  // Anything you want to do
                },

                // To show a "Cancel" button
                textConfirm: "Confirm",

                // Defines the confirm button's TEXT(only, rest remains the same) color
                confirmTextColor: Colors.white,

                // callback for Confirm button
                onConfirm: () {
                  // Anything you want to do
                },

                // Gives background colors to both [textCancel] and [textConfirm] buttons
                buttonColor: Colors.green,

                // Gives more control over the cancel button
                // * NOTE that this will override [textCancel], [cancelTextColor] and [buttonColor]
                cancel: TextButton(
                  onPressed: () {},
                  child: Text("Cancel"),
                ),

                // Gives more control over the confirm button
                // * NOTE that this will override [textConfirm], [confirmTextColor] and [buttonColor]
                confirm: TextButton(
                  onPressed: () {},
                  child: Text("Confirm"),
                ),

                // Any action buttons for the user work with
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      // To pop the dialog
                      Get.back();
                    },
                    child: Text("Action1"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Perform Action 2
                    },
                    child: Text("Action2"),
                  ),
                ],

                // Defines whether should we pop the dialog box, if the user clicks outside it
                barrierDismissible: true,
              );
            },
            child: Text("Show default dialog"),
          ),
        ),
      ),
    );
  }
}
