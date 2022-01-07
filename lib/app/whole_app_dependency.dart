import 'package:get/get.dart';

// Using GetxController here so that you could see in terminal, if onDelete()
// method is called in between pages
class AppDependency extends GetxController {
  final int _counterValue = 1;

  int get counterValue => _counterValue;
}
