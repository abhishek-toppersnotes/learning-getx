// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx1/home.dart';
import 'package:getx1/random_class.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  static const String title = "Dependency Injection Types";

  // Used with several depency injection
  static const String uniqueTag = "Unique Tag";

  // ***** Ways of dependency injection ******

  // In the following way, the instance of the [RandomClass] is created as
  // soon as the app starts. This approach is useful for when you want a
  // single instance to be accessed every time, and don't want to have a new
  // instance whenever it is called. See terminal:-
  //
  // ? I/flutter ( 4749): RandomClass.getInstance() called
  // ? [GETX] Instance "RandomClass" has been created
  // ! ↑ This line is printed as soon as the app starts ↑
  // ? I/flutter ( 4749): Button Clicked
  // ? I/flutter ( 4749): Value Received: 1
  // ! ↑ First Click ↑
  // ? I/flutter ( 4749): Button Clicked
  // ? I/flutter ( 4749): Value Received: 1
  // ! ↑ Second Click ↑
  //
  // This behaviour is observed for all the following ways
  // * Default way
  final RandomClass randomClass = Get.put(
    RandomClass.getInstance(),
  );
  //
  // * Using a [tag] is beneficial in case we are dealing with number of instances
  // * of similar data types
  // final RandomClass randomClass = Get.put(
  //   RandomClass.getInstance(),
  //   tag: uniqueTag,
  // );
  // Here the only difference in terminal will be this:-
  // ? I/flutter ( 4749): RandomClass.getInstance() called
  // ? [GETX] Instance "RandomClass" has been created with tag "Unique Tag"
  // ! Notice the tag here ----------------------------------------↑
  //
  // * Setting [permanent] = true causes the instance to survive desposing from
  // * GetX's Smart Management, and is then required to be disposed manually
  // final RandomClass randomClass = Get.put(
  //   RandomClass.getInstance(),
  //   permanent: true,
  // );

  // The following way is useful when you want to create a depency injection for async tasks.
  // It works the same as Get.put() with same parameters, just meant for async.
  // For RandomClass it won't be necessary, but you get the idea.
  //
  // Similarly as above, the builder is executed right as the app starts.
  // So by the time you will read the value, it should be fetched.
  // Here's the terminal:-
  // ? Restarted application in 1,880ms.
  // ? I/flutter ( 5290): RandomClass.getInstance() called
  // ! ↑ This line is printed as soon as the app starts ↑
  // ? [GETX] Instance "RandomClass" has been created
  // ? I/flutter ( 5290): Button Clicked
  // ? I/flutter ( 5290): Value Received: 1
  // ? I/flutter ( 5290): Button Clicked
  // ? I/flutter ( 5290): Value Received: 1
  //
  // * Default
  // Future<RandomClass> randomClass = Get.putAsync(
  //   () async => await RandomClass.getInstance(),
  // );
  //
  // * With [tag] (works similar to Get.put())
  // Future<RandomClass> randomClass = Get.putAsync(
  //   () async => await RandomClass.getInstance(),
  //   tag: uniqueTag,
  // );
  //
  // * With [permanent] = true (works similar to Get.put())
  // Future<RandomClass> randomClass = Get.putAsync(
  //   () async => await RandomClass.getInstance(),
  //   permanent: true,
  // );

  @override
  Widget build(BuildContext context) {
    // * A lot of dependency injection can happen from build function only

    // If you want to create a new instance, everytime you access via Get.find(),
    // you can use Get.create(). Rest of the thing works same as Get.put().
    // See the terminal:-
    //
    // ? Restarted application in 1,964ms.
    // ? I/flutter ( 5290): Button Clicked
    // ? I/flutter ( 5290): RandomClass.getInstance() called
    // ! ↑ A new instace is created on each click ↑
    // ? I/flutter ( 5290): Value Received: 1
    // ? I/flutter ( 5290): Button Clicked
    // ? I/flutter ( 5290): RandomClass.getInstance() called
    // ! ↑ A new instace is created on each click ↑
    // ? I/flutter ( 5290): Value Received: 1
    //
    // * Default way
    // Get.create<RandomClass>(
    //   () => RandomClass.getInstance(),
    // );
    //
    // * With a unique [tag].
    // Get.create<RandomClass>(
    //   () => RandomClass.getInstance(),
    //   tag: uniqueTag,
    // );
    //
    // * With [permanent] = true.
    // Get.create<RandomClass>(
    //   () => RandomClass.getInstance(),
    //   permanent: true,
    // );

    // In the following way, the instance of the [RandomClass] is created only
    // when the instance is starting to be used. This approach is useful for when
    // you want a single instance to be accessed every time, and don't want to
    // have a new instance whenever it is called.See terminal:-
    //
    // ? Restarted application in 1,839ms.
    // ? I/flutter ( 4749): Button Clicked
    // ? [GETX] Instance "RandomClass" has been created
    // ! ↑ This line is printed after the button is clicked ↑
    // ? I/flutter ( 4749): RandomClass.getInstance() called
    // ? I/flutter ( 4749): Value Received: 1
    // ? I/flutter ( 4749): Button Clicked
    // ? I/flutter ( 4749): Value Received: 1
    //
    // This behaviour is observed for all the following ways
    // * Default way
    // Get.lazyPut(
    //   () => RandomClass.getInstance(),
    // );
    //
    // * Here also you can use [tag] in cases where you work with objects of
    // * similar data types
    // The only difference in the terminal will be this:-
    // ? Restarted application in 1,766ms.
    // ? I/flutter ( 5290): Button Clicked
    // ? I/flutter ( 5290): RandomClass.getInstance() called
    // ? [GETX] Instance "RandomClass" has been created with tag "Unique Tag"
    // ! Notice the tag here ----------------------------------------↑
    // ? I/flutter ( 5290): Value Received: 1
    // Get.lazyPut<RandomClass>(
    //   () => RandomClass.getInstance(),
    //   tag: uniqueTag,
    // );
    //
    // * By default after garbage collection, the instance is not available.
    // * However, if you would like to use the value again, you can use
    // * [fenix] = true. This will create a new instance if the old
    // * instance was disposed
    // Get.lazyPut(
    //   () => RandomClass.getInstance(),
    //   fenix: true,
    // );

    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
