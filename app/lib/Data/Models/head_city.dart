import 'dart:convert';

import 'package:gazban/Data/Models/user.dart';

class HeadCity extends User {
  int? cityCode;
  int? areaCode;

  HeadCity({
    peCode,
    name,
    family,
    nationalCode,
    listOfPhone,
    registerTime,
    session,
    this.cityCode,
    this.areaCode,
  }) : super(
          peCode: peCode,
          name: name,
          family: family,
          nationalCode: nationalCode,
          listOfPhone: listOfPhone,
          registerTime: registerTime,
          session: session,
        );

  @override
  String toString() {
    return 'HeadArea(peCode: $peCode, name: $name, family: $family, nationalCode: $nationalCode, listOfPhone: $listOfPhone, registerTime: $registerTime, session: $session, cityCode: $cityCode, areaCode: $areaCode)';
  }

  factory HeadCity.fromMap(Map<String, dynamic> data) => HeadCity(
        peCode: data['PeCode'] as int?,
        name: data['Name'] as String?,
        family: data['Family'] as String?,
        nationalCode: data['NationalCode'] as String?,
        listOfPhone: data['ListOfPhone'] as List<dynamic>?,
        registerTime: data['RegisterTime'] as String?,
        session: data['Session'] as String?,
        cityCode: data['CityCode'] as int?,
        areaCode: data['AreaCode'] as int?,
      );

  @override
  Map<String, dynamic> toMap() => {
        'PeCode': peCode,
        'Name': name,
        'Family': family,
        'NationalCode': nationalCode,
        'ListOfPhone': listOfPhone,
        'RegisterTime': registerTime,
        'Session': session,
        'CityCode': cityCode,
        'AreaCode': areaCode,
      };

  factory HeadCity.fromJson(String data) {
    return HeadCity.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  @override
  String toJson() => json.encode(toMap());

  @override
  HeadCity copyWith({
    int? peCode,
    String? name,
    String? family,
    String? nationalCode,
    List<String>? listOfPhone,
    String? registerTime,
    String? session,
    int? cityCode,
    int? areaCode,
  }) {
    return HeadCity(
      peCode: peCode ?? this.peCode,
      name: name ?? this.name,
      family: family ?? this.family,
      nationalCode: nationalCode ?? this.nationalCode,
      listOfPhone: listOfPhone ?? this.listOfPhone,
      registerTime: registerTime ?? this.registerTime,
      session: session ?? this.session,
      cityCode: cityCode ?? this.cityCode,
      areaCode: areaCode ?? this.areaCode,
    );
  }
}
