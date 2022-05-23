class DeviceInfoModel {
  DeviceInfoModel.empty();

  DeviceInfoModel({
    required this.status,
    required this.requestId,
    required this.id,
    required this.name,
    required this.aliases,
    required this.type,
    required this.externalId,
    required this.skillId,
    required this.state,
    required this.groups,
    required this.room,
    required this.capabilities,
    required this.properties,
  });

  bool isReady = false;
  late final String status;
  late final String requestId;
  late final String id;
  late final String name;
  late final List<dynamic> aliases;
  late final String type;
  late final String externalId;
  late final String skillId;
  late final String state;
  late final List<dynamic> groups;
  late final String room;
  late final List<Capabilities> capabilities;
  late final List<Properties> properties;

  DeviceInfoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    requestId = json['request_id'];
    id = json['id'];
    name = json['name'];
    aliases = List.castFrom<dynamic, dynamic>(json['aliases']);
    type = json['type'];
    externalId = json['external_id'];
    skillId = json['skill_id'];
    state = json['state'];
    groups = List.castFrom<dynamic, dynamic>(json['groups']);
    room = json['room'];
    capabilities = List.from(json['capabilities'])
        .map((e) => Capabilities.fromJson(e))
        .toList();
    properties = List.from(json['properties'])
        .map((e) => Properties.fromJson(e))
        .toList();
    isReady = true;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['request_id'] = requestId;
    data['id'] = id;
    data['name'] = name;
    data['aliases'] = aliases;
    data['type'] = type;
    data['external_id'] = externalId;
    data['skill_id'] = skillId;
    data['state'] = state;
    data['groups'] = groups;
    data['room'] = room;
    data['capabilities'] = capabilities.map((e) => e.toJson()).toList();
    data['properties'] = properties.map((e) => e.toJson()).toList();
    return data;
  }
}

class Capabilities {
  Capabilities({
    required this.retrievable,
    required this.type,
    required this.parameters,
    required this.state,
    required this.lastUpdated,
  });
  late final bool retrievable;
  late final String type;
  late final Parameters parameters;
  late final State state;
  late final double lastUpdated;

  Capabilities.fromJson(Map<String, dynamic> json) {
    retrievable = json['retrievable'];
    type = json['type'];
    parameters = Parameters.fromJson(json['parameters']);
    state = State.fromJson(json['state']);
    lastUpdated = json['last_updated'];
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

class Parameters {
  Parameters({
    required this.split,
  });
  late final bool? split;

  Parameters.fromJson(Map<String, dynamic> json) {
    split = json['split'] == 'true';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['split'] = split;
    return data;
  }
}

class State {
  State({
    required this.instance,
    required this.value,
  });
  late final String instance;
  late final bool? value;

  State.fromJson(Map<String, dynamic> json) {
    instance = json['instance'];
    value = json['value'] == 'true';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['instance'] = instance;
    data['value'] = value;
    return data;
  }
}

class Properties {
  Properties({
    required this.retrievable,
    required this.type,
    required this.parameters,
    required this.state,
    required this.lastUpdated,
  });
  late final bool retrievable;
  late final String type;
  late final Parameters parameters;
  late final State state;
  late final double lastUpdated;

  Properties.fromJson(Map<String, dynamic> json) {
    retrievable = json['retrievable'];
    type = json['type'];
    parameters = Parameters.fromJson(json['parameters']);
    state = State.fromJson(json['state']);
    lastUpdated = json['last_updated'];
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
