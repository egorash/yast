import 'package:yast/models/device_info_model.dart';
import 'package:yast/models/group_model.dart';
import 'package:yast/models/households_model.dart';
import 'package:yast/models/room_model.dart';
import 'package:yast/models/scenarios_model.dart';

class UserInfoModel {
  UserInfoModel({
    required this.status,
    required this.requestId,
    required this.rooms,
    required this.groups,
    required this.devices,
    required this.scenarios,
    required this.households,
  });
  late final String status;
  late final String requestId;
  late final List<RoomModel> rooms;
  late final List<GroupModel> groups;
  late final List<DeviceInfoModel> devices;
  late final List<ScenariosModel> scenarios;
  late final List<HouseholdsModel> households;

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? "";
    requestId = json['request_id'] ?? "";
    rooms = List.from(json['rooms']).map((e) => RoomModel.fromJson(e)).toList();
    groups =
        List.from(json['groups']).map((e) => GroupModel.fromJson(e)).toList();
    devices = List.from(json['devices'])
        .map((e) => DeviceInfoModel.fromJson(e))
        .toList();
    scenarios = List.from(json['scenarios'])
        .map((e) => ScenariosModel.fromJson(e))
        .toList();
    households = List.from(json['households'])
        .map((e) => HouseholdsModel.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['request_id'] = requestId;
    _data['rooms'] = rooms.map((e) => e.toJson()).toList();
    _data['groups'] = groups.map((e) => e.toJson()).toList();
    _data['devices'] = devices.map((e) => e.toJson()).toList();
    _data['scenarios'] = scenarios.map((e) => e.toJson()).toList();
    _data['households'] = households.map((e) => e.toJson()).toList();
    return _data;
  }
}
