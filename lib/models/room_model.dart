class RoomModel {
  RoomModel({
    required this.id,
    required this.name,
    required this.householdId,
    required this.devices,
  });
  late final String id;
  late final String name;
  late final String householdId;
  late final List<String> devices;

  RoomModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    name = json['name'] ?? "";
    householdId = json['household_id'] ?? "";
    devices = List.castFrom<dynamic, String>(json['devices']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['household_id'] = householdId;
    _data['devices'] = devices;
    return _data;
  }
}
