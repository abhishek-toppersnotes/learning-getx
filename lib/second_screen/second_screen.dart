import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx1/app/whole_app_dependency.dart';
import 'package:getx1/first_screen/first_screen_only_dependency.dart';

import 'second_screen_only_dependency.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Second Screen"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                try {
                  print(
                      "${(AppDependency).toString()}.counterValue: ${Get.find<AppDependency>().counterValue}");
                  print(
                      "${(SecondScreenOnlyDependency).toString()}.counterValue: ${Get.find<SecondScreenOnlyDependency>().counterValue}");
                  print(
                      "${(FirstScreenOnlyDependency).toString()}.counterValue: ${Get.find<FirstScreenOnlyDependency>().counterValue}");
                } catch (e) {
                  print(e);
                }
              },
              child: const Text("Read all Values"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.offNamed("/first");
              },
              child: const Text("Move to First"),
            ),
          ],
        ),
      ),
    );
  }
}
