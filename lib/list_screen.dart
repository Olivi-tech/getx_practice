import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/list_controller.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  static final ListController listController = Get.put(ListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Updation'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            log('/////////called/////itemBuilder');
            return Card(
              child: ListTile(
                onTap: () => listController.favOnTap(index),
                title: Text(
                  index.toString(),
                ),
                trailing: Obx(
                  () {
                    log('/////////called/////iconx');

                    return Icon(
                      Icons.favorite,
                      color: listController.favourites.contains(index)
                          ? Colors.red
                          : Colors.white,
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
