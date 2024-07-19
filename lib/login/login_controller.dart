import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  Rx<TextEditingController> emailController =
      TextEditingController(text: 'eve.holt@reqres.in').obs;
  Rx<TextEditingController> passwordController =
      TextEditingController(text: 'cityslicka').obs;
  RxBool isLoading = false.obs;
  login() async {
    try {
      isLoading.value = true;
      final response = await http.post(
        Uri.parse('https://reqres.in/api/login'),

        ///this api does not need to encode data
        body: {
          "email": emailController.value.text,
          "password": passwordController.value.text,
        },
      );
      log(response.body);
      log(response.statusCode.toString());
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        isLoading.value = false;
        Get.snackbar('Success', 'Logged in');
      } else {
        isLoading.value = false;
        Get.snackbar('Error', data['error']);
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Something went wrong',
        'Try again',
        backgroundColor: Colors.red[300],
      );
    }
  }
}
