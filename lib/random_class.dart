import 'package:get/get.dart';

class RandomClass {
  static RandomClass? _instance;
  static RandomClass getInstance() {
    print("RandomClass.getInstance() called");
    _instance ??= RandomClass._(1);
    return _instance!;
  }

  RandomClass._(this.myValue);

  final int myValue;
}

class RandomController extends GetxController {}
