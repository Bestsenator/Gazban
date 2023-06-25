import 'package:dio/dio.dart';

String globalTimeApiUrl = 'https://timeapi.io/api/';
// String  iranTimeApiUrl = 'https://timeapi.io/api/';


String getTimeByTimezoneUrl = '${globalTimeApiUrl}Time/current/zone?timeZone=';

var timeLimit = const Duration(seconds: 10);

class HelperApiProvider {
  getTimeByTimezone({
    String zone ='',
  }) async {
    final response = await Dio().get(getTimeByTimezoneUrl).timeout(timeLimit);
    return response;
  }
}
