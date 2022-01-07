import 'package:get/get.dart';

import 'whole_app_dependency.dart';

// This class signifies depencies that are meant for the whole app
// It is meant to be used like:-
// GetMaterialApp().initialBinding = WholeAppDepencies();
class WholeAppDependencyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppDependency());
  }
}
