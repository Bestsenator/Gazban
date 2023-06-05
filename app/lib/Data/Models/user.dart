import 'dart:convert';

class User {
  int? peCode;
  String? name;
  String? family;
  String? nationalCode;
  List<dynamic>? listOfPhone;
  String? registerTime;
  String? session;

  User({
    this.peCode,
    this.name,
    this.family,
    this.nationalCode,
    this.listOfPhone,
    this.registerTime,
    this.session,
  });

  @override
  String toString() {
    return 'User(peCode: $peCode, name: $name, family: $family, nationalCode: $nationalCode, listOfPhone: $listOfPhone, registerTime: $registerTime, session: $session)';
  }

  factory User.fromMap(Map<String, dynamic> data) => User(
        peCode: data['PeCode'] as int?,
        name: data['Name'] as String?,
        family: data['Family'] as String?,
        nationalCode: data['NationalCode'] as String?,
        listOfPhone: data['ListOfPhone'] as List<dynamic>?,
        registerTime: data['RegisterTime'] as String?,
        session: data['Session'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'PeCode': peCode,
        'Name': name,
        'Family': family,
        'NationalCode': nationalCode,
        'ListOfPhone': listOfPhone,
        'RegisterTime': registerTime,
        'Session': session,
      };

  factory User.fromJson(String data) {
    return User.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  User copyWith({
    int? peCode,
    String? name,
    String? family,
    String? nationalCode,
    List<String>? listOfPhone,
    String? registerTime,
    String? session,
  }) {
    return User(
      peCode: peCode ?? this.peCode,
      name: name ?? this.name,
      family: family ?? this.family,
      nationalCode: nationalCode ?? this.nationalCode,
      listOfPhone: listOfPhone ?? this.listOfPhone,
      registerTime: registerTime ?? this.registerTime,
      session: session ?? this.session,
    );
  }
}
