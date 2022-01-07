import 'package:get/get.dart';

import 'second_screen_only_dependency.dart';

class SecondScreenDependencyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SecondScreenOnlyDependency());
  }
}
