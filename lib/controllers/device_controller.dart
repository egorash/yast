import 'package:get/get.dart';
import 'package:yast/data/repository.dart';
import 'package:yast/models/device_info_model.dart';

class DeviceController extends GetxController {
  final DataRepositoryController repository =
      Get.find<DataRepositoryController>();

  final String id;
  final Rx<DeviceInfoModel> _info = DeviceInfoModel.empty().obs;
  RxBool busy = true.obs;
  DeviceController({required this.id});

  Rx<DeviceInfoModel> get info {
    if (!_info.value.isReady) {
      refresh();
    }
    return _info;
  }

  @override
  refresh() async {
    if (!busy.value || !_info.value.isReady) {
      busy.value = true;
      var t = await repository.getRepository.getInfo(id: id);
      _info.value = t;
      busy.value = false;
    } else {
      super.refresh();
    }
  }
}
