import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yast/controllers/home_controller.dart';
import 'package:yast/widgets/device_info_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('HomePage')),
        body: Column(
          children: [
            Expanded(
              child: Obx((() {
                if (controller.info != null) {
                  return ListView.builder(
                      itemCount: controller.info!.rooms.length,
                      itemBuilder: ((context, index) {
                        return Column(
                          children: [
                            ListTile(
                              title: Text(controller.info!.rooms[index].name),
                            ),
                            Container(
                              height: 150,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller
                                      .info!.rooms[index].devices.length,
                                  itemBuilder: ((context, index2) {
                                    return Container(
                                      width: 400,
                                      child: DeviceInfoWidget(controller
                                          .info!.rooms[index].devices[index2]),
                                    );
                                  })),
                            )
                          ],
                        );
                      }));
                } else {
                  controller.updateData();
                  return const Center(child: CircularProgressIndicator());
                }
              })),
            )
          ],
        ));
  }
}
