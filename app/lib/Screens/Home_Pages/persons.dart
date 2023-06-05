import 'package:dio/dio.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

import '../../Data/Api/api_provider.dart';

class PersonsScreen extends StatefulWidget {
  const PersonsScreen({super.key});

  @override
  State<PersonsScreen> createState() => _PersonsScreenState();
}

class _PersonsScreenState extends State<PersonsScreen> {
  //
  ApiProvider test = ApiProvider();
  bool headType = false;
  int personType = 3;
  var gasEmployee = ['علی', 'احمد', 'سعید', 'رضا', 'حسین', 'جمشید'];
  var represenatative = ['حسین', 'سجاد', 'علی', 'احمد', 'باقر', 'صادق'];
  var rescuer = ['احمد', 'علیرضا', 'جمشید', 'هاشم', 'عارف', 'محمد'];
  var headCity = ['امین', 'مجتبی', 'وحید', 'احسان', 'علی', 'حسین'];
  var headRelief = ['حسین', 'علی', 'مرتضی', 'حسن', 'حسین', 'عرفان'];

  Future<int> deleteCharacter({
    required String peCode,
    required String characterPeCode,
    required String character,
  }) async {
    try {
      Response response = await test.deleteCharacterApi(
          peCode: peCode,
          characterPeCode: characterPeCode,
          character: character);
      print(response);
      if (response.data['Status'] == 200) {
        return 200;
      } else if (response.data['Status'] == 400) {
        print('اطلاعات ارسالی اشتباه است');
        return 400;
      } else if (response.data['Status'] == 900) {
        print('کلید ای پی آی معتبر نیست');
        return 900;
      } else if (response.data['Status'] == 901) {
        print('کلیدهای ای پی آی اشتباه تعریف شده است');
        return 901;
      } else {
        print(
            'وضعیت ناشناخته! کد وضعیت برنامه ریزی نشده است \n پاسخ درخواست : \n ${response.data}');
        return 1000;
      }
    } catch (e) {
      return 1000;
    }
  }

  Future<int> editCharacterInfo({
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
    try {
      Response response = await test.editCharacterInfoApi(
          peCode: peCode,
          character: character,
          peCodeCharacter: peCodeCharacter,
          name: name,
          family: family,
          nationalCode: nationalCode,
          listOfPhone: listOfPhone,
          listOfVillages: listOfVillages,
          listOfMGasEmployee: listOfMGasEmployee,
          agreementNumber: agreementNumber,
          cityCode: cityCode,
          listOfCity: listOfCity);
      print(response);
      if (response.data['Status'] == 200) {
        return 200;
      } else if (response.data['Status'] == 400) {
        print('اطلاعات ارسالی (ایستا) اشتباه است');
        return 400;
      } else if (response.data['Status'] == 401) {
        print('اطلاعات ارسالی (پویا) اشتباه است');
        return 401;
      } else if (response.data['Status'] == 900) {
        print('کلید ای پی آی معتبر نیست');
        return 900;
      } else if (response.data['Status'] == 901) {
        print('کلیدهای ای پی آی اشتباه تعریف شده است');
        return 901;
      } else {
        print(
            'وضعیت ناشناخته! کد وضعیت برنامه ریزی نشده است \n پاسخ درخواست : \n ${response.data}');
        return 1000;
      }
    } catch (e) {
      return 1000;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(80, 38, 0, 255),
              Color.fromARGB(80, 255, 0, 0),
            ],
          ),
        ),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    child: TextField(
                     
                      magnifierConfiguration: TextMagnifierConfiguration(),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'جستجو ...',
                        icon: Icon(CupertinoIcons.search, size: 28),
                        iconColor: Theme.of(context).iconTheme.color,
                        contentPadding: EdgeInsets.only(right: 5),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {},
                    icon: Icon(
                      CupertinoIcons.slider_horizontal_3,
                      size: 35,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: NeumorphicToggle(
                  style: NeumorphicToggleStyle(
                    backgroundColor: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  selectedIndex: personType,
                  thumb: Center(
                    child: Container(),
                  ),
                  children: [
                    ToggleElement(
                      foreground: Center(child: Text('گازبان')),
                      background: Center(child: Text('گازبان')),
                    ),
                    ToggleElement(
                      foreground: Center(child: Text('نماینده')),
                      background: Center(child: Text('نماینده')),
                    ),
                    ToggleElement(
                      foreground: Center(child: Text('امدادگر')),
                      background: Center(child: Text('امدادگر')),
                    ),
                    ToggleElement(
                      foreground: Center(child: Text('رئیس')),
                      background: Center(child: Text('رئیس')),
                    ),
                  ],
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      if (value == 0) personType = 3;
                      if (value == 1) personType = 2;
                      if (value == 2) personType = 1;
                      if (value == 3) personType = 0;
                    });
                  },
                ),
              ),
              personType == 0
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: NeumorphicToggle(
                        width: 250,
                        style: NeumorphicToggleStyle(
                          backgroundColor: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        selectedIndex: headType ? 0 : 1,
                        thumb: Center(
                          child: Container(),
                        ),
                        children: [
                          ToggleElement(
                            foreground: Center(child: Text('رئیس شهر')),
                            background: Center(
                              child: Text(
                                'رئیس شهر',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                          ToggleElement(
                            foreground: Center(child: Text('رئیس امداد')),
                            background: Center(
                              child: Text(
                                'رئیس امداد',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            headType = value == 1 ? true : false;
                          });
                        },
                      ),
                    )
                  : Container(),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 40),
                  itemCount: gasEmployee.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Slidable(
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            dismissible: null,
                            children: [
                              Expanded(flex: 1, child: Container()),
                              const SizedBox(width: 8),
                              SlidableAction(
                                onPressed: (context) {},
                                backgroundColor: Theme.of(context).primaryColor,
                                foregroundColor: Colors.white,
                                icon: Icons.edit_location_alt_outlined,
                                label: 'ویرایش',
                                borderRadius: BorderRadius.circular(20),
                                flex: 6,
                              ),
                              const SizedBox(width: 8),
                              SlidableAction(
                                onPressed: (context) async {
                                  setState(() {
                                    personType == 3
                                        ? gasEmployee.removeAt(index)
                                        : null;
                                  });
                                },
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                icon: Icons.delete_rounded,
                                label: 'حذف',
                                borderRadius: BorderRadius.circular(20),
                                flex: 5,
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                          child: ListTile(
                            leading: Icon(Icons.ac_unit_rounded),
                            title: Text(personType == 3
                                ? '${gasEmployee[index]}'
                                : personType == 2
                                    ? '${represenatative[index]}'
                                    : personType == 1
                                        ? '${rescuer[index]}'
                                        : '${headRelief[index]}'),
                            subtitle: Text(personType == 3
                                ? 'گازبان'
                                : personType == 2
                                    ? 'نماینده'
                                    : personType == 1
                                        ? 'امدادگر'
                                        : 'رییس'),
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          indent: 20,
                          endIndent: 20,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
