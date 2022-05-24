import 'package:yast/models/parameters_model.dart';
import 'package:yast/models/state_model.dart';

class PropertiesModel {
  PropertiesModel({
    required this.type,
    required this.reportable,
    required this.retrievable,
    required this.parameters,
    required this.state,
    required this.stateChangedAt,
    required this.lastUpdated,
  });
  late final String type;
  late final bool reportable;
  late final bool retrievable;
  late final ParametersModel parameters;
  late final StateModel state;
  late final double stateChangedAt;
  late final double lastUpdated;

  PropertiesModel.fromJson(Map<String, dynamic> json) {
    type = json['type'] ?? "";
    reportable = json['reportable'] ?? false;
    retrievable = json['retrievable'] ?? false;
    parameters = ParametersModel.fromJson(json['parameters']);
    state = StateModel.fromJson(json['state']);
    stateChangedAt = json['state_changed_at'] ?? 0;
    lastUpdated = json['last_updated'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['reportable'] = reportable;
    _data['retrievable'] = retrievable;
    _data['parameters'] = parameters.toJson();
    _data['state'] = state.toJson();
    _data['state_changed_at'] = stateChangedAt;
    _data['last_updated'] = lastUpdated;
    return _data;
  }
}
