import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yast/controllers/device_controller.dart';
import 'package:yast/utils/device_images.dart';
import 'package:yast/widgets/device_image_widget.dart';

class DeviceInfoWidget extends Container {
  final String id;
  late final DeviceController controller;

  DeviceInfoWidget(this.id, {Key? key}) : super(key: key) {
    controller = DeviceController(id: id);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.info != null) {
        // вынести в контроллер
        var isOnOff = controller.info!.capabilities
            .where((element) => element.type == "devices.capabilities.on_off");

        return Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              color: isOnOff.isNotEmpty && isOnOff.first.state.value
                  ? Colors.green.withOpacity(0.3)
                  : Colors.grey.withOpacity(0.3),
            ),
            padding: const EdgeInsets.all(8),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: DeviceImageWidget(
                      height: 60,
                      src: DeviceImagesUtil.getImage(
                        controller.info!.type,
                      )),
                ),
                InkWell(
                    onTap: () => isOnOff.isNotEmpty
                        ? controller.setEnabled(!isOnOff.first.state.value)
                        : null,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          // padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            controller.info!.name.toString(),
                            style: Get.theme.textTheme.bodyMedium,
                          ),
                        ),
                        if (isOnOff.isNotEmpty)
                          controller.busy.value
                              ? const Center(child: CircularProgressIndicator())
                              : Switch(
                                  value: isOnOff.first.state.value,
                                  onChanged: (bool value) {
                                    controller.setEnabled(value);
                                  },
                                )
                      ],
                    )),
              ],
            ));
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
