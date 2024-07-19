import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getx_practice/login/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Gap(50),
            TextFormField(
              controller: loginController.emailController.value,
              decoration: const InputDecoration(hintText: 'email'),
            ),
            const Gap(10),
            TextFormField(
              controller: loginController.passwordController.value,
              decoration: const InputDecoration(hintText: 'password'),
            ),
            const Gap(30),
            Obx(() {
              log('loading value: ${loginController.isLoading.value}');
              return loginController.isLoading.value
                  ? const CupertinoActivityIndicator()
                  : OutlinedButton(
                      onPressed: () => loginController.login(),
                      child: const Text('Login'),
                    );
            }),
          ],
        ),
      ),
    );
  }
}
