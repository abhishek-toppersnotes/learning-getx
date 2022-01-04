import 'package:get/get.dart';

// We can define a getxController to seperate the business logic from the ui logic
class IncrementController extends GetxController {
  RxInt counterValue = 0.obs;

  void increment() {
    counterValue.value++;
  }
}
