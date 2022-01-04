import 'package:get/get.dart';

class IncrementController extends GetxController {
  Rx<int> counter = Rx<int>(0);

  void increment() {
    counter.value++;
  }

  // onInit is the best place to create workers
  @override
  void onInit() {
    // WORKERS:-
    // All workers are only execute after a value change. So everytime, no matter what, increment() method
    // will be executed first.

    // If for every time the variable in ever(<variable>, callback) is changed, and you
    // want to perform some action based on that, you can use this.
    ever(counter, (newValueOfCounter) {
      print("ever Value: $newValueOfCounter");
    });

    // If you have a list of variables that you are listening, you can use
    // NOTE that here [newValueReceived] will be only that variable's new value that was changed
    everAll([counter], (newValueReceived) {
      print("everAll Value: $newValueReceived");
    });

    // If you want to have a callback for a variable change only once
    once(counter, (newValueOfCounter) {
      print("once Value: $newValueOfCounter");
    });

    // The following is generally useful when you want to perform an action when the value changed is happening continuously
    // (Like sending a search request) and you want perform callback (send the request) only once the value has stopped
    // changing after a duration.
    //
    // In this case, if you continously click "Increment Counter" and stop all of a sudden, then after 3 seconds, the callback
    // is executed
    debounce(
      counter,
      (newValueOfCounter) {
        print("debounce Value: $newValueOfCounter");
      },
      time: const Duration(milliseconds: 3000),
    );

    // If you want to have a callback such that it is called only once within a specified duration
    // (doesn't matter if it is executed continuously or just once)
    // This is generally useful if you want to limit the number of callbacks
    interval(
      counter,
      (newValueOfCounter) {
        print("interval Value: $newValueOfCounter");
      },
      time: const Duration(milliseconds: 1000),
    );
    super.onInit();
  }
}
