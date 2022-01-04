import 'package:get/get.dart';

// We can define a getxController to seperate the business logic from the ui logic
class IncrementController extends GetxController {
  // Unlike reactive state management, we can use normal variables in Simple State mgmt
  // These values are to be updated using update() function which GetxController provides
  // and shall ONLY BE USED by GetBuilder() builder method
  int counterValue = 0;

  void increment() {
    counterValue++;
    update();
  }
}
