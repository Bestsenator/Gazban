import 'dart:convert';

import 'user.dart';

class HeadRelief extends User {
  List<dynamic>? listOfCity;
  int? areaCode;

  HeadRelief({
    peCode,
    name,
    family,
    nationalCode,
    listOfPhone,
    registerTime,
    session,
    this.listOfCity,
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
    return 'HeadRelief(peCode: $peCode, name: $name, family: $family, nationalCode: $nationalCode, listOfPhone: $listOfPhone, registerTime: $registerTime, session: $session, listOfCity: $listOfCity, areaCode: $areaCode)';
  }

  factory HeadRelief.fromMap(Map<String, dynamic> data) => HeadRelief(
        peCode: data['PeCode'] as int?,
        name: data['Name'] as String?,
        family: data['Family'] as String?,
        nationalCode: data['NationalCode'] as String?,
        listOfPhone: data['ListOfPhone'] as List<dynamic>?,
        registerTime: data['RegisterTime'] as String?,
        session: data['Session'] as String?,
        listOfCity: data['ListOfCity'] as List<dynamic>?,
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
        'ListOfCity': listOfCity,
        'AreaCode': areaCode,
      };

  factory HeadRelief.fromJson(String data) {
    return HeadRelief.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  @override
  String toJson() => json.encode(toMap());

  @override
  HeadRelief copyWith({
    int? peCode,
    String? name,
    String? family,
    String? nationalCode,
    List<String>? listOfPhone,
    String? registerTime,
    String? session,
    List<int>? listOfCity,
    int? areaCode,
  }) {
    return HeadRelief(
      peCode: peCode ?? this.peCode,
      name: name ?? this.name,
      family: family ?? this.family,
      nationalCode: nationalCode ?? this.nationalCode,
      listOfPhone: listOfPhone ?? this.listOfPhone,
      registerTime: registerTime ?? this.registerTime,
      session: session ?? this.session,
      listOfCity: listOfCity ?? this.listOfCity,
      areaCode: areaCode ?? this.areaCode,
    );
  }
}
