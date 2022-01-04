import 'package:get/get.dart';

// To define a whole class as reactive (Rx), we can either describe each
// member as observable (obs)
// class Student {
//   RxString name = "Tom".obs;
//   RxInt age = 25.obs;
// }

// or we can have the whole class as observable (obs) while initializing it
class Student {
  Student({
    required this.name,
    required this.age,
  });

  String name;
  int age;
}
