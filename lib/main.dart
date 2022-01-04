// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx1/student.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // If we have define each individual elements as observable (obs)
  // static final Student student = Student();

  // If we want to define the whole class as observable
  static final Rx<Student> student = Student(age: 26, name: "Thomas").obs;

  static const String title =
      "Reactive state mgmt with Obx & custom model class";

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
                  // "Name is ${student.name.value}",

                  // If we have defined the whole class as observable (obs)
                  "Name is ${student.value.name}",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                );
              }),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // If we have define each individual elements as observable (obs)
                  // student.name.value = student.name.value.toUpperCase();

                  // If we have defined the whole class as observable (obs)
                  // student.value.name = student.value.name.toUpperCase();
                  student.update((val) {
                    if (val != null) {
                      val.name = val.name.toUpperCase();
                    }
                  });
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
