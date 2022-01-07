import 'package:get/get.dart';

import 'first_screen_only_dependency.dart';

class FirstScreenDependencyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FirstScreenOnlyDependency());
  }
}
