import 'package:get/get.dart';
import 'package:yast/data/repository.dart';
import 'package:yast/models/device_info_model.dart';

class DeviceController extends GetxController {
  final DataRepositoryController repository =
      Get.find<DataRepositoryController>();

  final String id;

  final Rx<DeviceInfoModel?> _info = Rx(null);
  RxBool busy = false.obs;

  DeviceController({required this.id});

  DeviceInfoModel? get info {
    try {
      if (_info.value == null) {
        updateData();
      } else {
        return _info.value;
      }
    } catch (e) {
      updateData();
    }

    return null;
  }

  Future<void> updateData({bool isForce = false}) async {
    if (!busy.value || isForce) {
      busy.value = true;
      _info.value = await repository.getRepository.getDeviceInfo(id: id);
      busy.value = false;
    }
  }

  setEnabled(bool isEnabled) async {
    busy.value = true;
    info!.capabilities
        .where((element) => element.type == "devices.capabilities.on_off")
        .first
        .state
        .value = isEnabled;
    await repository.getRepository
        .setDeviceEnabled(id: _info.value!.id, isEnabled: isEnabled);
    await Future.delayed(const Duration(seconds: 1));
    await updateData();
    busy.value = false;
  }
}
