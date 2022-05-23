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
        body: SafeArea(child: DeviceInfoWidget()));
  }
}
