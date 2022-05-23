import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:yast/models/device_info_model.dart';

const baseUrl = 'https://api.iot.yandex.net/v1.0';
const _token = "AQAAAAASQfawAAeEGN9Nao14Q0YYnE9Xp5i3-88";

class ApiClient {
  final Dio httpClient;
  ApiClient({required this.httpClient});

  getInfo(String id) async {
    try {
      var response = await httpClient.get("$baseUrl/devices/$id",
          options: Options(headers: {"Authorization": "Bearer $_token"}));
      if (response.statusCode == 200) {
        // Map<String, dynamic> jsonResponse =
        //     json.decode(response.data.toString());

        return DeviceInfoModel.fromJson(response.data);
      } else
        print('erro -get');
    } catch (e) {
      throw Exception(e);
    }
  }
}
