import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:yast/controllers/home_controller.dart';
import 'package:yast/data/api.dart';
import 'package:yast/data/repository.dart';

class MyPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<DataRepositoryController>(() =>
        DataRepositoryController(DataRepository(ApiClient(httpClient: Dio()))));
  }
}
