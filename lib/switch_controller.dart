import 'package:get/get.dart';

class SwitchController extends GetxController {
  RxBool switchVal = false.obs;

  setNewVal(bool val) {
    switchVal.value = val;
  }
}
