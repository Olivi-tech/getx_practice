import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import 'package:getx_practice/app_routes.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              tileColor: Colors.blue[50],
              title: const Text('Show Dialog'),
              onTap: () => Get.defaultDialog(
                title: "Adaptive Dialog",
                middleText: "This is an adaptive dialog.",
                textConfirm: "Confirm",
                textCancel: "Cancel",
                onConfirm: () {
                  Get.back();
                },
                onCancel: () {
                  Get.back();
                },
              ),
            ),
            const Gap(10),
            ListTile(
              tileColor: Colors.blue[50],
              title: const Text('See bottom Sheet'),
              onTap: () => Get.bottomSheet(
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const Gap(10),
                        ListTile(
                          tileColor: Colors.green[50],
                          title: const Text('Change to dark mode'),
                          onTap: () {
                            box.write('isDarkMode', true);
                            Get.changeTheme(
                              ThemeData.dark(),
                            );
                          },
                        ),
                        const Gap(10),
                        ListTile(
                          tileColor: Colors.green[50],
                          title: const Text('Change to light mode'),
                          onTap: () {
                            box.write('isDarkMode', false);
                            Get.changeTheme(
                              ThemeData.light(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  backgroundColor: Colors.white,
                  enableDrag: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  )
                  // shape:
                  ),
            ),
            const Gap(10),
            ListTile(
              tileColor: Colors.green[50],
              title: const Text('Go to Screen One'),
              onTap: () => Get.toNamed(AppRoutes.screenOne),
              // onTap: () => Get.to(
              //   const ScreenOne(),
              //   transition: Transition.rightToLeft,
              // ),
            ),
            const Gap(10),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () => Get.snackbar(
          'title',
          'message',
          snackPosition: SnackPosition.BOTTOM,
        ),
        child: const Text('show Snack'),
      ),
    );
  }
}
