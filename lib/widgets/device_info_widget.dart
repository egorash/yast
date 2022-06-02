import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yast/controllers/device_controller.dart';

class DeviceInfoWidget extends Container {
  final String id;
  late final DeviceController controller;

  DeviceInfoWidget(this.id, {Key? key}) : super(key: key) {
    controller = DeviceController(id: id);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Obx(() {
        if (controller.info != null) {
          // вынести в контроллер
          var isOnOff = controller.info!.capabilities.where(
              (element) => element.type == "devices.capabilities.on_off");

          return ListTile(
            title: Text(controller.info!.name.toString()),
            subtitle: Text(controller.info!.room),
            trailing: isOnOff.isNotEmpty
                ? controller.busy.value
                    ? CircularProgressIndicator()
                    : Switch(
                        value: isOnOff.first.state.value,
                        onChanged: (bool value) {
                          controller.setEnabled(value);
                        },
                      )
                : Text(""),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
