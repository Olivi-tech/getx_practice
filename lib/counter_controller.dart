import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt value = 0.obs;

  addValue() {
    value++;
  }
}
