import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yast/controllers/device_controller.dart';

class DeviceInfoWidget extends Container {
  final controller = Get.find<DeviceController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() {
        if (!controller.busy.value) {
          return Text(controller.info.value.name.toString());
        } else {
          controller.refresh();
          return CircularProgressIndicator();
        }
      }),
    );
  }
}
