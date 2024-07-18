import 'package:get/get.dart';
import 'package:getx_practice/counter_screen.dart';
import 'package:getx_practice/home_screen.dart';
import 'package:getx_practice/list_screen.dart';
import 'package:getx_practice/screen_one.dart';
import 'package:getx_practice/screen_two.dart';

class AppRoutes {
  static const homePage = '/';
  static const screenOne = '/screenOne';
  static const screenTwo = '/screenTwo';
  static const increment = '/increment';
  static const listScreen = '/listScreen';

  /// for transition
  static const Transition transitionRtoL = Transition.rightToLeft;

  static List<GetPage<dynamic>>? getRoutes() => [
        GetPage(
          name: homePage,
          page: () => HomeScreen(),
          transition: transitionRtoL,
        ),
        GetPage(
          name: screenOne,
          page: () => const ScreenOne(),
          transition: transitionRtoL,
        ),
        GetPage(
          name: screenTwo,
          page: () {
            final name = Get.arguments;
            return ScreenTwo(name: name);
          },
          transition: transitionRtoL,
        ),
        GetPage(
          name: increment,
          page: () => CounterScreen(),
          transition: transitionRtoL,
        ),
        GetPage(
          name: listScreen,
          page: () => const ListScreen(),
          transition: transitionRtoL,
        ),
      ];
}
