import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/route_manager.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
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
              title: const Text('Goto Back'),
              onTap: () => Get.back(),
            ),
            const Gap(10),
          ],
        ),
      ),
    );
  }
}
