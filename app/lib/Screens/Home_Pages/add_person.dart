import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';

class AddPersonScreen extends StatefulWidget {
  const AddPersonScreen({super.key});

  @override
  State<AddPersonScreen> createState() => _AddPersonScreenState();
}

class _AddPersonScreenState extends State<AddPersonScreen> {
  //
  bool headType = false;
  int personType = 3;
  String? region = 'بردسکن';

  List listVillageCode = [];
  List<Widget> listVillage = [];

  List listCityCode = [];
  List<Widget> listCity = [];

  createListVillage() {
    listVillage.clear();
    for (int i = 0; i < listVillageCode.length; i++) {
      listVillage.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Neumorphic(
            style: NeumorphicStyle(
              color: Colors.transparent,
              shadowDarkColor: Colors.black,
              depth: 4,
              intensity: 0.5,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Text('روستا ${listVillageCode[i]}'),
                SizedBox(width: 5),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        listVillageCode.removeAt(i);
                        createListVillage();
                      });
                    },
                    child: Icon(CupertinoIcons.clear_circled))
              ]),
            ),
          ),
        ),
      );
    }
  }

  createListCity() {
    listCity.clear();
    for (int i = 0; i < listCityCode.length; i++) {
      listCity.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Neumorphic(
            style: NeumorphicStyle(
              color: Colors.transparent,
              shadowDarkColor: Colors.black,
              depth: 4,
              intensity: 0.5,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Text('شهر ${listCityCode[i]}'),
                SizedBox(width: 5),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        listCityCode.removeAt(i);
                        createListCity();
                      });
                    },
                    child: Icon(CupertinoIcons.clear_circled))
              ]),
            ),
          ),
        ),
      );
    }
  }

  popPage() {
    Navigator.of(context).pop(false);
    Navigator.of(context).pop(false);
  }

  Future<bool> choicePersonType() async {
    return (await showDialog(
          barrierDismissible: false,
          barrierColor: const Color.fromARGB(97, 178, 216, 218),
          context: context,
          builder: (context) => WillPopScope(
            onWillPop: () => popPage(),
            child: AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              title: const Text('انتخاب دسته بندی'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                      'برای تعریف فرد جدید ابتدا دسته بندی آن را انتخاب نمایید'),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  personType = 3;
                                });
                                Navigator.of(context).pop(false);
                              },
                              child: Neumorphic(
                                padding: EdgeInsets.all(5),
                                style: NeumorphicStyle(
                                  color: Colors.transparent,
                                  shadowDarkColor: Colors.black,
                                  depth: 2,
                                  intensity: 0.5,
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(12)),
                                ),
                                child: Center(child: Text('گازبان')),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  personType = 2;
                                });
                                Navigator.of(context).pop(false);
                              },
                              child: Neumorphic(
                                padding: EdgeInsets.all(5),
                                style: NeumorphicStyle(
                                  color: Colors.transparent,
                                  shadowDarkColor: Colors.black,
                                  depth: 2,
                                  intensity: 0.5,
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(12)),
                                ),
                                child: Center(child: Text('نماینده')),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  personType = 1;
                                });
                                Navigator.of(context).pop(false);
                              },
                              child: Neumorphic(
                                padding: EdgeInsets.all(5),
                                style: NeumorphicStyle(
                                  color: Colors.transparent,
                                  shadowDarkColor: Colors.black,
                                  depth: 2,
                                  intensity: 0.5,
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(12)),
                                ),
                                child: Center(child: Text('امدادگر')),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  personType = 0;
                                });
                                Navigator.of(context).pop(false);
                              },
                              child: Neumorphic(
                                padding: EdgeInsets.all(5),
                                style: NeumorphicStyle(
                                  color: Colors.transparent,
                                  shadowDarkColor: Colors.black,
                                  depth: 2,
                                  intensity: 0.5,
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(12)),
                                ),
                                child: Center(child: Text('رئیس')),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        )) ??
        false;
  }

  wait() {
    var durtion = Duration(microseconds: 10);
    return Timer(durtion, choicePersonType);
  }

  @override
  void initState() {
    wait();
    super.initState();
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
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'افزودن فرد',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text('دسته بندی'),
                  ),
                ],
              ),
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

                      listCityCode.clear();
                      createListCity();
                    });
                  },
                ),
              ),
              personType == 0
                  ? Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text('نوع رئیس '),
                        ),
                      ],
                    )
                  : Container(),
              personType == 0
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: NeumorphicToggle(
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
              Padding(
                padding: const EdgeInsets.all(10),
                child: Neumorphic(
                  style: NeumorphicStyle(
                    color: Colors.transparent,
                    shadowDarkColor: Colors.black,
                    depth: 4,
                    intensity: 0.5,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        label: Text('نام'),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
                    onChanged: (value) {},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Neumorphic(
                  style: NeumorphicStyle(
                    color: Colors.transparent,
                    shadowDarkColor: Colors.black,
                    depth: 4,
                    intensity: 0.5,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        label: Text('نام خانوادگی'),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
                    onChanged: (value) {},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Neumorphic(
                  style: NeumorphicStyle(
                    color: Colors.transparent,
                    shadowDarkColor: Colors.black,
                    depth: 4,
                    intensity: 0.5,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        label: Text('شماره همراه'),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
                    onChanged: (value) {},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Neumorphic(
                  style: NeumorphicStyle(
                    color: Colors.transparent,
                    shadowDarkColor: Colors.black,
                    depth: 4,
                    intensity: 0.5,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        label: Text('کد ملی'),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
                    onChanged: (value) {},
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text('ناحیه'),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Neumorphic(
                  style: NeumorphicStyle(
                    color: Colors.transparent,
                    shadowDarkColor: Colors.black,
                    depth: 4,
                    intensity: 0.5,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 15),
                      IgnorePointer(
                        ignoring: true,
                        child: DropdownButton(
                            hint: Text(
                              region ?? '',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .color,
                              ),
                            ),
                            underline: Container(),
                            icon: Container(),
                            items: const [],
                            onChanged: null),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text('شهر'),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Neumorphic(
                  style: NeumorphicStyle(
                    color: Colors.transparent,
                    shadowDarkColor: Colors.black,
                    depth: 4,
                    intensity: 0.5,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 20,
                    child: Wrap(
                      children: <Widget>[
                            DropdownButton(
                              hint: Neumorphic(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                margin: EdgeInsets.fromLTRB(0, 2, 10, 2),
                                style: NeumorphicStyle(
                                  color: Colors.transparent,
                                  shadowDarkColor: Colors.black,
                                  depth: 2,
                                  intensity: 0.7,
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(12)),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'انتخاب شهر',
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .displayLarge!
                                            .color,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(
                                      CupertinoIcons.add_circled,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                              underline: Container(),
                              icon: Container(),
                              items: [
                                DropdownMenuItem(
                                    value: '1', child: Text('data1')),
                                DropdownMenuItem(
                                    value: '2', child: Text('data2')),
                                DropdownMenuItem(
                                    value: '3', child: Text('data3')),
                                DropdownMenuItem(
                                    value: '4', child: Text('data4')),
                                DropdownMenuItem(
                                    value: '5', child: Text('data5')),
                                DropdownMenuItem(
                                    value: '6', child: Text('data6')),
                                DropdownMenuItem(
                                    value: '7', child: Text('data7')),
                                DropdownMenuItem(
                                    value: '8', child: Text('data8')),
                                DropdownMenuItem(
                                    value: '9', child: Text('data9')),
                                DropdownMenuItem(
                                    value: '10', child: Text('data10')),
                                DropdownMenuItem(
                                    value: '11', child: Text('data11')),
                                DropdownMenuItem(
                                    value: '12', child: Text('data12')),
                                DropdownMenuItem(
                                    value: '13', child: Text('data13')),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  if (listCityCode.indexOf(value) < 0) {
                                    if (personType == 3 || personType == 1) {
                                      listCityCode.clear();
                                      listCityCode.add(value!);
                                    } else {
                                      listCityCode.add(value!);
                                    }
                                  }
                                  createListCity();
                                });
                              },
                            ),
                          ] +
                          listCity,
                    ),
                  ),
                ),
              ),
              personType == 3
                  ? Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Text('روستا'),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Neumorphic(
                            style: NeumorphicStyle(
                              color: Colors.transparent,
                              shadowDarkColor: Colors.black,
                              depth: 4,
                              intensity: 0.5,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(12)),
                            ),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width - 20,
                              child: Wrap(
                                children: <Widget>[
                                      DropdownButton(
                                        hint: Neumorphic(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 5),
                                          margin:
                                              EdgeInsets.fromLTRB(0, 2, 10, 2),
                                          style: NeumorphicStyle(
                                            color: Colors.transparent,
                                            shadowDarkColor: Colors.black,
                                            depth: 2,
                                            intensity: 0.7,
                                            boxShape:
                                                NeumorphicBoxShape.roundRect(
                                                    BorderRadius.circular(12)),
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                'انتخاب روستا',
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .displayLarge!
                                                      .color,
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              Icon(
                                                CupertinoIcons.add_circled,
                                                size: 20,
                                              ),
                                            ],
                                          ),
                                        ),
                                        underline: Container(),
                                        icon: Container(),
                                        items: [
                                          DropdownMenuItem(
                                              value: '1', child: Text('data1')),
                                          DropdownMenuItem(
                                              value: '2', child: Text('data2')),
                                          DropdownMenuItem(
                                              value: '3', child: Text('data3')),
                                          DropdownMenuItem(
                                              value: '4', child: Text('data4')),
                                          DropdownMenuItem(
                                              value: '5', child: Text('data5')),
                                          DropdownMenuItem(
                                              value: '6', child: Text('data6')),
                                          DropdownMenuItem(
                                              value: '7', child: Text('data7')),
                                          DropdownMenuItem(
                                              value: '8', child: Text('data8')),
                                          DropdownMenuItem(
                                              value: '9', child: Text('data9')),
                                          DropdownMenuItem(
                                              value: '10',
                                              child: Text('data10')),
                                          DropdownMenuItem(
                                              value: '11',
                                              child: Text('data11')),
                                          DropdownMenuItem(
                                              value: '12',
                                              child: Text('data12')),
                                          DropdownMenuItem(
                                              value: '13',
                                              child: Text('data13')),
                                        ],
                                        onChanged: (value) {
                                          setState(() {
                                            if (listVillageCode.indexOf(value) <
                                                0) {
                                              listVillageCode.add(value!);
                                            }
                                            createListVillage();
                                          });
                                        },
                                      ),
                                    ] +
                                    listVillage,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
