import 'package:get/get.dart';

class ListController extends GetxController {
  RxList favourites = [].obs;
  favOnTap(int index) {
    if (favourites.contains(index)) {
      favourites.remove(index);
    } else {
      favourites.add(index);
    }
  }
}
