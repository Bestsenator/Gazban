import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';

class AddNotificationScreen extends StatefulWidget {
  const AddNotificationScreen({super.key});

  @override
  State<AddNotificationScreen> createState() => _AddNotificationScreenState();
}

class _AddNotificationScreenState extends State<AddNotificationScreen> {
  //
  bool notificationType = false;

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
                    'اطلاعیه جدید',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
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
                        label: Text('عنوان اطلاعیه'),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 0)),
                    maxLines: 2,
                    onChanged: (value) {},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp('[ء-ی ‌]'),
                    ),
                  ],
                  decoration: const InputDecoration(
                    label: Text('توضیحات'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text('اولویت بندی'),
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
                  selectedIndex: notificationType ? 0 : 1,
                  thumb: Center(
                    child: Container(),
                  ),
                  children: [
                    ToggleElement(
                      foreground: Center(child: Text('عادی')),
                      background: Center(
                        child: Text(
                          'عادی',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                    ToggleElement(
                      foreground: Center(child: Text('فوری')),
                      background: Center(
                        child: Text(
                          'فوری',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      notificationType = value == 1 ? true : false;
                    });
                  },
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text('تصویر پیوست ( اختیاری )'),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        final ImagePicker picker = ImagePicker();
                        final XFile? image =
                            await picker.pickImage(source: ImageSource.gallery);
                        String url =
                            'http://192.168.110.29:2602/api/login/'; // آدرس API جنگو
                        String fileName = image!.name; // نام فایل عکس
                        FormData formData = FormData.fromMap({
                          "image": await MultipartFile.fromFile(image.path,
                              filename: fileName),
                        });
                        print(formData.files);

                        try {
                          Response response = await Dio().post(url,
                              options: Options(headers: {
                                'ApiKey':
                                    '6c17072e16dbcfe0433be448bc0b6ce537344a51e3411e851a1cb13e326939f9'
                              }),
                              data: formData);
                          print(response.data);
                        } catch (error) {
                          print(error);
                        }
                      },
                      child: Neumorphic(
                        style: NeumorphicStyle(
                          color: Colors.transparent,
                          shadowDarkColor: Colors.black,
                          depth: 4,
                          intensity: 0.5,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(12)),
                        ),
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        padding: EdgeInsets.all(20),
                        child: Center(
                          child: Column(
                            children: [
                              Icon(CupertinoIcons.add_circled, size: 35),
                              Text('افزودن پیوست'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(onPressed: () {}, child: Text('انتشار اطلاعیه'))
            ],
          ),
        ),
      ),
    );
  }
}
