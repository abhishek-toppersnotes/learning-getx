// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx1/student.dart';
import 'package:getx1/student_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // We use Get.put() as a form of dependency injection for the Getx controller
  // for the Student
  static final StudentController studentController =
      Get.put(StudentController());

  static const String title =
      "Extends lecture8 - seperating UI and Bussiness logic using Controller";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(() {
                return Text(
                  // If we have define each individual elements as observable (obs)
                  // "Name is ${studentController.student.name.value}",

                  // If we have defined the whole class as observable (obs)
                  "Name is ${studentController.student.value.name}",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                );
              }),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  studentController.studentNameToUpperCase();
                },
                child: Text("To Upper Case"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
