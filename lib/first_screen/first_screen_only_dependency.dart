import 'package:get/get.dart';

// Using GetxController here so that you could see in terminal, when onDelete()
// method is called
class FirstScreenOnlyDependency extends GetxController {
  final int _counterValue = 2;

  int get counterValue => _counterValue;
}
