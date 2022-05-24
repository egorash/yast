class ScenariosModel {
  ScenariosModel({
    required this.id,
    required this.name,
    required this.isActive,
  });
  late final String id;
  late final String name;
  late final bool isActive;

  ScenariosModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    name = json['name'] ?? "";
    isActive = json['is_active'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['is_active'] = isActive;
    return _data;
  }
}
