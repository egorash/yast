class ParametersModel {
  ParametersModel({
    required this.split,
  });
  late final bool? split;

  ParametersModel.fromJson(Map<String, dynamic> json) {
    split = json['split'] == 'true';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['split'] = split;
    return data;
  }
}