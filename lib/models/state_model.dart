class StateModel {
  StateModel({
    required this.instance,
    required this.value,
  });
  late final String instance;
  bool value = false;

  StateModel.fromJson(Map<String, dynamic> json) {
    instance = json['instance'] ?? "";
    value = json['value'].toString() == 'true';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['instance'] = instance;
    data['value'] = value;
    return data;
  }
}
