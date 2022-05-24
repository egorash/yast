import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:yast/models/device_info_model.dart';
import 'package:yast/models/user_info_model.dart';

const baseUrl = 'https://api.iot.yandex.net/v1.0';
const _token = "AQAAAAASQfawAAeEGN9Nao14Q0YYnE9Xp5i3-88";

class ApiClient {
  final Dio httpClient;
  ApiClient({required this.httpClient});

  Future<UserInfoModel> getUserInfo() async {
    try {
      var response = await httpClient.get("$baseUrl/user/info",
          options: Options(headers: {"Authorization": "Bearer $_token"}));
      if (response.statusCode == 200) {
        return UserInfoModel.fromJson(response.data);
      } else {
        throw Exception("error getting user data");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  getDeviceInfo(String id) async {
    try {
      var response = await httpClient.get("$baseUrl/devices/$id",
          options: Options(headers: {"Authorization": "Bearer $_token"}));
      if (response.statusCode == 200) {
        return DeviceInfoModel.fromJson(response.data);
      } else
        print('erro -get');
    } catch (e) {
      throw Exception(e);
    }
  }

  setDeviceEnabled(String id, bool isEnabled) async {
    try {
      await httpClient.post("$baseUrl/devices/actions",
          data:
              '{ "devices": [ { "id": "$id", "actions": [ { "type": "devices.capabilities.on_off", "state": { "instance": "on", "value": $isEnabled } } ] } ] }',
          options: Options(headers: {"Authorization": "Bearer $_token"}));
    } catch (e) {
      throw Exception(e);
    }
  }
}
