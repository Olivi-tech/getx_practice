import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getx_practice/app_routes.dart';
import 'package:getx_practice/container_controller.dart';
import 'package:getx_practice/counter_controller.dart';
import 'package:getx_practice/switch_controller.dart';

class CounterScreen extends StatelessWidget {
  CounterScreen({super.key});

  final CounterController counterController = Get.put(CounterController());

  final ContainerController containerController =
      Get.put(ContainerController());
  final SwitchController switchController = Get.put(SwitchController());

  @override
  Widget build(BuildContext context) {
    log('build is called');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(
                () => Text(
                  counterController.value.toString(),
                  style: const TextStyle(
                    fontSize: 40,
                  ),
                ),
              ),
              const Gap(10),
              Obx(
                () => Container(
                  width: Get.width * 0.8,
                  height: Get.height * 0.2,
                  color: Colors.blue
                      .withOpacity(containerController.opacity.toDouble()),
                ),
              ),
              const Gap(10),
              Obx(
                () => Slider.adaptive(
                  value: containerController.opacity.toDouble(),
                  onChanged: (value) {
                    containerController.setColor(value.toDouble());
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('Switch'),
                  Obx(
                    () => Switch.adaptive(
                      value: switchController.switchVal.value,
                      onChanged: (value) {
                        switchController.setNewVal(value);
                      },
                    ),
                  ),
                ],
              ),
              const Gap(20),
              OutlinedButton(
                onPressed: () => Get.toNamed(AppRoutes.listScreen),
                child: const Text('Go to List Page'),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[200],
        onPressed: () => counterController.addValue(),
        child: const Text('add'),
      ),
    );
  }
}
