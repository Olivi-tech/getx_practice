import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getx_practice/app_routes.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen One'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: Column(
          children: [
            ListTile(
              tileColor: Colors.blue[50],
              title: const Text('Goto Screen two'),
              onTap: () => Get.toNamed(
                AppRoutes.screenTwo,
                arguments: 'GetX',
              ),
            ),
            const Gap(10),
            Container(
              height: Get.height * 0.5,
              width: Get.width,
              decoration: ShapeDecoration(
                color: context.theme.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  const Gap(10),
                  ListTile(
                    title: Text('name'.tr),
                    subtitle: Text('age'.tr),
                    tileColor: Colors.green[10],
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      OutlinedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.green[200]),
                        ),
                        onPressed: () async =>
                            await Get.updateLocale(const Locale('en', 'US')),
                        child: const Text('English'),
                      ),
                      const Gap(20),
                      OutlinedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.green[200]),
                        ),
                        onPressed: () async =>
                            await Get.updateLocale(const Locale('ur', 'PK')),
                        child: const Text('URDU'),
                      ),
                    ],
                  ),
                  const Gap(20),
                  OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.green[200]),
                    ),
                    onPressed: () async => Get.toNamed(
                      AppRoutes.increment,
                    ),
                    child: const Text('Go to increment page'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
