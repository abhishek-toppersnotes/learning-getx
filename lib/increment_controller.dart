import 'package:get/get.dart';

// We can define a getxController to seperate the business logic from the ui logic
class IncrementController extends GetxController {
  // Unlike reactive state management, we can use normal variables in Simple State mgmt
  // These values are to be updated using update() function which GetxController provides
  // and shall ONLY BE USED by GetBuilder() builder method
  int counterValue = 0;

  void increment() async {
    await Future.delayed(const Duration(seconds: 5));
    counterValue++;
    update();
  }

  void cleanUp() {
    print("Custom cleanup function");
  }

  // Instead of using the [initState] parameter in the GetBuilder() function,
  // you can use this to automatically perform any initialization
  // * NOTE that this will be called in any case(with or without [initState] parameter)
  @override
  void onInit() {
    print("Controller Initialized");
    increment();
    super.onInit();
  }

  // Instead of using the [dispose] parameter in the GetBuilder() function,
  // you can use this to automatically perform any cleanup tasks
  @override
  void onClose() {
    print("Controller Deletion happening");
    cleanUp();
    super.onClose();
  }
}
