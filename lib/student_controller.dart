import 'package:get/get.dart';
import 'package:getx1/student.dart';

class StudentController extends GetxController {
  // If we have define each individual elements as observable (obs)
  // static final Student student = Student();

  // If we want to define the whole class as observable
  final Rx<Student> student = Student(age: 26, name: "Thomas").obs;

  void studentNameToUpperCase() {
    // If we have define each individual elements as observable (obs)
    // student.name.value = student.name.value.toUpperCase();

    // If we have defined the whole class as observable (obs)
    student.update((val) {
      if (val != null) {
        val.name = val.name.toUpperCase();
      }
    });
  }
}
