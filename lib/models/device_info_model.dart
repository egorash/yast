import 'package:yast/models/capabilites_model.dart';
import 'package:yast/models/properties_model.dart';

class DeviceInfoModel {
  DeviceInfoModel.empty();

  DeviceInfoModel({
    required this.id,
    required this.name,
    required this.aliases,
    required this.type,
    required this.externalId,
    required this.skillId,
    required this.householdId,
    required this.room,
    required this.groups,
    required this.capabilities,
    required this.properties,
  });
  bool isReady = false;
  late final String id;
  late final String name;
  late final List<dynamic> aliases;
  late final String type;
  late final String externalId;
  late final String skillId;
  late final String householdId;
  late final String room;
  late final List<dynamic> groups;
  late final List<CapabilitiesModel> capabilities;
  late final List<PropertiesModel> properties;

  DeviceInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    name = json['name'] ?? "";
    aliases = List.castFrom<dynamic, dynamic>(json['aliases']);
    type = json['type'] ?? "";
    externalId = json['external_id'] ?? "";
    skillId = json['skill_id'] ?? "";
    householdId = json['household_id'] ?? "";
    room = json['room'] ?? "";
    groups = List.castFrom<dynamic, dynamic>(json['groups']);
    capabilities = List.from(json['capabilities'])
        .map((e) => CapabilitiesModel.fromJson(e))
        .toList();
    properties = List.from(json['properties'])
        .map((e) => PropertiesModel.fromJson(e))
        .toList();
    isReady = true;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['aliases'] = aliases;
    _data['type'] = type;
    _data['external_id'] = externalId;
    _data['skill_id'] = skillId;
    _data['household_id'] = householdId;
    _data['room'] = room;
    _data['groups'] = groups;
    _data['capabilities'] = capabilities.map((e) => e.toJson()).toList();
    _data['properties'] = properties.map((e) => e.toJson()).toList();
    return _data;
  }
}
