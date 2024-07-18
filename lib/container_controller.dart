import 'package:get/get.dart';

class ContainerController extends GetxController {
  RxDouble opacity = 0.6.obs;

  setColor(double val) {
    opacity.value = val;
  }
}
