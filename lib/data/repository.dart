import 'package:yast/data/api.dart';
import 'package:get/get.dart';

class DataRepository {
  final ApiClient api;

  DataRepository(this.api);

  getInfo({required String id}) async {
    return await api.getInfo(id);
  }
}

class DataRepositoryController extends GetxController {
  final DataRepository _repository;
  DataRepository get getRepository => _repository;
  DataRepositoryController(this._repository);
}
