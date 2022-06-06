import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yast/controllers/home_controller.dart';
import 'package:yast/widgets/device_info_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx((() {
          if (controller.info != null) {
            List<Widget> tabs = [];
            List<Widget> pages = [];

            controller.info!.rooms.forEach(
              (element) {
                tabs.add(Tab(
                  text: element.name,
                ));
                pages.add(
                  GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 6),
                      itemCount: element.devices.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return DeviceInfoWidget(element.devices[index]);
                      }),
                );
              },
            );

            return DefaultTabController(
                initialIndex: 0,
                length: tabs.length,
                child: Scaffold(
                  appBar: AppBar(
                    bottom: TabBar(
                      tabs: tabs,
                    ),
                  ),
                  body: TabBarView(
                    children: pages,
                  ),
                ));
          } else {
            controller.updateData();
            return const Center(child: CircularProgressIndicator());
          }
        }));
  }
}
