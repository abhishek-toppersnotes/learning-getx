// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx1/main.dart';
import 'package:getx1/random_class.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyApp.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            print("Button Clicked");

            // When using without a tag, execute this:-
            print("Value Received: ${Get.find<RandomClass>().myValue}");

            // When using with tag - "Unique Tag", execute this:-
            // print(
            //     "Value Received: ${Get.find<RandomClass>(tag: MyApp.uniqueTag).myValue}");
          },
          child: Text("Access value"),
        ),
      ),
    );
  }
}
