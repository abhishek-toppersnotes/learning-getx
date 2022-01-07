import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx1/app/whole_app_dependency.dart';
import 'package:getx1/second_screen/second_screen_only_dependency.dart';

import 'first_screen_only_dependency.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("First Screen"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                try {
                  print(
                      "${(AppDependency).toString()}.counterValue: ${Get.find<AppDependency>().counterValue}");
                  print(
                      "${(FirstScreenOnlyDependency).toString()}.counterValue: ${Get.find<FirstScreenOnlyDependency>().counterValue}");
                  print(
                      "${(SecondScreenOnlyDependency).toString()}.counterValue: ${Get.find<SecondScreenOnlyDependency>().counterValue}");
                } catch (e) {
                  print(e);
                }
              },
              child: const Text("Read all Values"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.offNamed("/second");
              },
              child: const Text("Move to Second"),
            ),
          ],
        ),
      ),
    );
  }
}
