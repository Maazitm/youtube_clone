import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:youtube/controller/chengeTextController.dart';

class Testscreen extends StatelessWidget {
  const Testscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangeMyTextController());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(controller.msg.value)),
            TextButton(
              onPressed: () {
                controller.changevalue();
              },
              child: Text("super button"),
            ),
            Obx(() => Text("${controller.number.value}")),
            TextButton(
              onPressed: () {
                controller.upgrade();
              },
              child: Icon(Icons.add),
            ),
              TextButton(
              onPressed: () {
                controller.substract();
              },
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
