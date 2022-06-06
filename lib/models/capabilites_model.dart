import 'package:yast/models/parameters_model.dart';
import 'package:yast/models/state_model.dart';
import 'package:yast/models/user_info_model.dart';

class CapabilitiesModel {
  CapabilitiesModel({
    required this.retrievable,
    required this.type,
    required this.parameters,
    required this.state,
    required this.lastUpdated,
  });
  late final bool retrievable;
  late final String type;
  late final ParametersModel parameters;
  late final StateModel state;
  late final double lastUpdated;

  CapabilitiesModel.fromJson(Map<String, dynamic> json) {
    retrievable = json['retrievable'] ?? false;
    type = json['type'] ?? "";
    parameters = ParametersModel.fromJson(json['parameters']);
    state = json['state'] != null
        ? StateModel.fromJson(json['state'])
        : StateModel(instance: "null", value: false);
    lastUpdated = json['last_updated'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['retrievable'] = retrievable;
    data['type'] = type;
    data['parameters'] = parameters.toJson();
    data['state'] = state.toJson();
    data['last_updated'] = lastUpdated;
    return data;
  }
}
