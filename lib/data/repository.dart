import 'package:yast/data/api.dart';
import 'package:get/get.dart';

class DataRepository {
  final ApiClient api;

  DataRepository(this.api);

  getDeviceInfo({required String id}) async {
    return await api.getDeviceInfo(id);
  }

  setDeviceEnabled({required String id, required bool isEnabled}) async {
    return await api.setDeviceEnabled(id, isEnabled);
  }

  getUserInfo() async {
    return await api.getUserInfo();
  }
}

class DataRepositoryController extends GetxController {
  final DataRepository _repository;
  DataRepository get getRepository => _repository;
  DataRepositoryController(this._repository);
}
