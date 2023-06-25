import 'package:dio/dio.dart';
import 'package:gazban/Data/dynamic_data_app.dart';

String checkSessionUrl = '${headUrl}checkSession/';
String loginUrl = '${headUrl}login/';
String getReportRequestUrl = '${headUrl}getReportRequest/';
String getListCharacterUrl = '${headUrl}getListCharacter/';
String deleteCharacterUrl = '${headUrl}deleteCharacter/';
String editCharacterInfoUrl = '${headUrl}editCharacterInfo/';
String getLocationUrl = '${headUrl}getLocation/';
String getAnnouncementUrl = '${headUrl}getAnnouncement/';
String addAnnouncementUrl = '${headUrl}addAnnouncement/';

var publicHeaderApi = Options(headers: {'ApiKey': apiKey});
var privateHeaderApi = Options(
  headers: {
    'ApiKey': apiKey,
    'Session': session,
  },
);

var timeLimit = const Duration(seconds: 10);

class ApiProvider {
  //
  checkSessionApi({
    required String session,
    required String appVersion,
    required String deviceIp,
    required String realDevice,
  }) async {
    final response = await Dio().post(
      checkSessionUrl,
      // TODO : change header type Api - private or poblic ( privateHeaderApi is for unique Apis related to each user )
      options: publicHeaderApi,
      data: {
        'Session': session,
        'VersionApp': appVersion,
        'IpAddress': deviceIp,
        'PhoneStatusKey': realDevice,
      },
    ).timeout(timeLimit);
    return response;
  }

  loginApi({
    required String username,
    required String password,
  }) async {
    final response = await Dio().post(
      loginUrl,
      // TODO : change header type Api - private or poblic ( privateHeaderApi is for unique Apis related to each user )
      options: publicHeaderApi,
      data: {
        'Username': username,
        'Password': password,
      },
    ).timeout(timeLimit);
    return response;
  }

  getReportRequestApi({
    required String from,
    required String to,
    required String peCode,
  }) async {
    final response = await Dio().post(
      getReportRequestUrl,
      // TODO : change header type Api - private or poblic ( privateHeaderApi is for unique Apis related to each user )
      options: publicHeaderApi,
      data: {
        'From': from,
        'To': to,
        'PeCode': peCode,
      },
    ).timeout(timeLimit);
    return response;
  }

  getListCharacterApi({
    required String areaCode,
    required String peCode,
    required String fromWho,
  }) async {
    final response = await Dio().post(
      getListCharacterUrl,
      options: publicHeaderApi,
      data: {
        'AreaCode': areaCode,
        'PeCode': peCode,
        'FromWho': fromWho,
      },
    ).timeout(timeLimit);
    return response;
  }

  deleteCharacterApi({
    required String peCode,
    required String characterPeCode,
    required String character,
  }) async {
    final response = await Dio().post(
      deleteCharacterUrl,
      // TODO : change header type Api - private or poblic ( privateHeaderApi is for unique Apis related to each user )
      options: publicHeaderApi,
      data: {
        'PeCode': peCode,
        'CharacterPeCode': characterPeCode,
        'Character': character,
      },
    ).timeout(timeLimit);
    return response;
  }

  editCharacterInfoApi({
    required String peCode,
    required String character,
    required String peCodeCharacter,
    required String name,
    required String family,
    required String nationalCode,
    required List<String> listOfPhone,
    List<int>? listOfVillages,
    List<int>? listOfMGasEmployee,
    int? agreementNumber,
    int? cityCode,
    List<int>? listOfCity,
  }) async {
    final response = await Dio().post(
      editCharacterInfoUrl,
      // TODO : change header type Api - private or poblic ( privateHeaderApi is for unique Apis related to each user )
      options: publicHeaderApi,
      data: {
        'PeCode': peCode,
        'Character': character,
        'PeCodeCharacter': peCodeCharacter,
        'Name': name,
        'Family': family,
        'NationalCode': nationalCode,
        'ListOfPhone': listOfPhone,
        //
        if (listOfVillages != null) 'ListOfVillages': listOfVillages,
        if (listOfMGasEmployee != null)
          'ListOfMGasEmployee': listOfMGasEmployee,
        if (agreementNumber != null) 'AgreementNumber': agreementNumber,
        if (cityCode != null) 'CityCode': cityCode,
        if (listOfCity != null) 'ListOfCity': listOfCity,
      },
    ).timeout(timeLimit);
    return response;
  }

  getLocationApi({
    required String areaCode,
  }) async {
    final response = await Dio().post(
      getLocationUrl,
      // TODO : change header type Api - private or poblic ( privateHeaderApi is for unique Apis related to each user )
      options: publicHeaderApi,
      data: {
        'AreaCode': areaCode,
      },
    ).timeout(timeLimit);
    return response;
  }

  getAnnouncementApi({
    required String areaCode,
  }) async {
    final response = await Dio().post(
      getAnnouncementUrl,
      // TODO : change header type Api - private or poblic ( privateHeaderApi is for unique Apis related to each user )
      options: publicHeaderApi,
      data: {
        'AreaCode': areaCode,
      },
    ).timeout(timeLimit);
    return response;
  }

  addAnnouncement({
    required String peCode,
    required String title,
    required String content,
    required bool priority,
    MultipartFile? image,
  }) async {
    final response = await Dio().post(
      addAnnouncementUrl,
      // TODO : change header type Api - private or poblic ( privateHeaderApi is for unique Apis related to each user )
      options: publicHeaderApi,
      data: {
        'PeCode': peCode,
        'Title': title,
        'Content': content,
        'Priority': priority,
        'Image': image,
      },
    ).timeout(timeLimit);
    return response;
  }
}
