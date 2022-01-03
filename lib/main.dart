import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String title = "Snackbar";

  @override
  Widget build(BuildContext context) {
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
              // If we execute mutliple Get.snackbar(), we will get all snackbars(shown one after the other, no overlapping in any way)

              // Basic
              Get.snackbar("basic title", "basic message");

              // Customised
              Get.snackbar(
                "title1", "message1",

                // Defines what color should the title AND content should be in
                // This has no effect if we use [titleText] or [messageText] property
                colorText: Colors.pink,

                // Alternate way to define title text,
                // * takes precendence over "title1"
                titleText: const Text(
                  "title2",
                  // We can obviously use some styles too
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),

                // Alternate way to define message text,
                // * takes precendence over "message1"
                messageText: const Text(
                  // If the content becomes too long to fit the screen, an overflow error is thrown(like for a general widget)
                  "message",
                ),

                // If you want to show a TextBox in a snackbar
                // * NOTE that the snackbar will anyway dismiss itself even while you are typing,
                // * and the [duration] is reached.
                // ? Need to see if we can change this behaviour, or this option is just a flex
                //
                // * takes precendence over all other contents
                userInputForm: const Form(
                  child: TextField(),
                ),

                // Defines arriving/departing duration of the snackbar and
                // ! does NOT define how long it will stay on the screen
                animationDuration: const Duration(milliseconds: 300),

                // Defines the animation curve of the arrival animation
                forwardAnimationCurve: Curves.bounceInOut,

                // Defines the animation curve of the arrival animation
                reverseAnimationCurve: Curves.ease,

                // Defines how long will the snackbar will stay on the screen
                duration: const Duration(milliseconds: 3000),

                // Defines the background color of the snackbar
                backgroundColor: Colors.green,

                // If you want a gradient background
                // This will take precendence over [backgroundColor]
                backgroundGradient: const LinearGradient(
                  colors: [
                    Colors.red,
                    Colors.yellow,
                  ],
                ),

                // Defines the border radius of the snackbar
                borderRadius: 30,

                // Defines the margin between the screen and the snackbar
                margin: const EdgeInsets.all(20),

                // Defines the padding between the snackbar and
                // it's content(as a whole, NOT title and content individually)
                padding: const EdgeInsets.all(50),

                // Defines the maximum width of the snackbar
                // The snackbar will be horizontally centered if the width is too small
                maxWidth: 1000,

                // Defines the border color of the snackbar
                // * REMEMBER to always use it together with [borderWidth] to see the effect
                borderColor: Colors.amber,

                // Defines the border width of the snackbar
                // The width is extended inwards(towards the center)
                // * REMEMBER to always use it together with [borderColor] to see the effect
                borderWidth: 4,

                // Use this if you want to see a shadow behind the snackbar
                boxShadows: [
                  const BoxShadow(
                    color: Colors.yellow,
                    offset: Offset(10, 10),
                    // spreadRadius: 20,
                    blurRadius: 4,
                  )
                ],

                // Defines the blur of the background while the snackbar is visible
                overlayBlur: 4,

                // Color of the overlay
                // * MAKE SURE that the overlay has some opacity,
                // * otherwise it will just show this color, WITHOUT making note of [overlayBlur]
                overlayColor: Colors.teal.withOpacity(0.9),

                // Define whether the snackbar should be dismissible
                // * MAKE SURE that [dismissDirection] != DismissDirection.none for this to have an effect
                isDismissible: true,

                // Defines in which direction should the user be able to dismiss the snackbar
                // * REMEMBER to use [isDismissible] = true or you can also not define [isDismissible]
                dismissDirection: DismissDirection.vertical,

                // Shows an icon before the content that has a continuos fadeIn-fadeOut loop effect (pulse effect)
                // * If you have used [padding], it will also be applied here.
                // * Though the logic is intelligent enough to not overpad between icon and contents
                icon: const Icon(
                  Icons.star,
                  color: Colors.white,
                ),

                // By default, the icon has a pulse effect. Use this to change this behaviour
                shouldIconPulse: false,

                // Defines whether to show a bar on the left edge of the snackbar
                // The bar has a very small width, and goes over the full height
                leftBarIndicatorColor: Colors.white,

                // Defines whether to show a progress indicator
                // This progress indicator is shown at the top of the snackbar
                showProgressIndicator: true,

                // Defines background color for the progress indicator
                // Make sure to define [showProgressIndicator] = true before using this
                progressIndicatorBackgroundColor: Colors.deepPurple,

                // Defines foreground color for the progress indicator
                progressIndicatorValueColor:
                    const AlwaysStoppedAnimation(Colors.white),

                // Shows a button on the right side
                mainButton: TextButton(
                  onPressed: () {},
                  child: const Text('Button'),
                ),

                // Defines a callback for when the snackbar is tapped
                onTap: (thisSnackBar) {
                  // Any operation you want to perform
                },

                // Defines a callback for diffent snackbar statuses
                snackbarStatus: (currentSnackbarStatus) {
                  // Any operation you want to perform based on the current state of snackbar
                  // enum SnackbarStatus { OPEN, CLOSED, OPENING, CLOSING }
                },
              );
            },
            child: const Text("Show Snackbar"),
          ),
        ),
      ),
    );
  }
}
