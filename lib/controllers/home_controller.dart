import 'package:get/get.dart';
import 'package:yast/data/repository.dart';
import 'package:yast/models/room_model.dart';
import 'package:yast/models/user_info_model.dart';

class HomeController extends GetxController {
  final DataRepositoryController repository =
      Get.find<DataRepositoryController>();

  final Rx<UserInfoModel?> _info = Rx(null);
  RxBool busy = false.obs;

  UserInfoModel? get info {
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
      _info.value = await repository.getRepository.getUserInfo();
      _info.value?.rooms.sort(
          ((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase())));
      busy.value = false;
    }
  }
}
