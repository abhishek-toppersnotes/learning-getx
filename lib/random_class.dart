import 'package:get/get.dart';

// Unlike GetxController(which controlls pages), GetxService is used to maintain
// instance throughout the app lifecycle. They are not removed by getx garbage
// collector, and have to be disposed manually.
class RandomClass extends GetxService {
  static RandomClass? _instance;
  static Future<RandomClass> getInstance() async {
    print("RandomClass.getInstance() called");
    await Future.delayed(const Duration(milliseconds: 2000));
    _instance ??= RandomClass._(1);
    return _instance!;
  }

  RandomClass._(this.myValue);

  final int myValue;
}

class RandomController extends GetxController {}
