import 'package:yast/models/capabilites_model.dart';

class GroupModel {
  GroupModel({
    required this.id,
    required this.name,
    required this.aliases,
    required this.householdId,
    required this.type,
    required this.devices,
    required this.capabilities,
  });
  late final String id;
  late final String name;
  late final List<dynamic> aliases;
  late final String householdId;
  late final String type;
  late final List<String> devices;
  late final List<CapabilitiesModel> capabilities;

  GroupModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    name = json['name'] ?? "";
    aliases = List.castFrom<dynamic, dynamic>(json['aliases']);
    householdId = json['household_id'] ?? "";
    type = json['type'] ?? "";
    devices = List.castFrom<dynamic, String>(json['devices']);
    capabilities = List.from(json['capabilities'])
        .map((e) => CapabilitiesModel.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['aliases'] = aliases;
    _data['household_id'] = householdId;
    _data['type'] = type;
    _data['devices'] = devices;
    _data['capabilities'] = capabilities.map((e) => e.toJson()).toList();
    return _data;
  }
}
