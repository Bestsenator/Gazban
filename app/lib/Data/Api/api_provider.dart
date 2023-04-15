import 'package:dio/dio.dart';
import 'package:gazban/Data/dynamic_data_app.dart';
import 'package:gazban/Data/static_data_app.dart';


class ApiProvider {
  var timeLimit = const Duration(seconds: 10);

  checkSessionDeliveryApi(
      {required String session,
      required String appVersion,
      required String deviceIp,
      required String deviceModel,
      required String realDevice}) async {
    final response = await Dio().post(
      'checkSessionDeliveryUrl',
      options: Options(
        headers: {'ApiKey': 'key'},
      ),
      data: {
        'Session': session,
        'VersionApp': appVersion,
        'IpAddress': deviceIp,
        'PhoneModel': deviceModel,
        'PhoneStatusKey': realDevice,
      },
    ).timeout(timeLimit);

    return response;
  }
}
