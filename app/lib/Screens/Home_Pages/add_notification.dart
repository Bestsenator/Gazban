import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../Data/Api/api_provider.dart';

class AddNotificationScreen extends StatefulWidget {
  const AddNotificationScreen({super.key});

  @override
  State<AddNotificationScreen> createState() => _AddNotificationScreenState();
}

class _AddNotificationScreenState extends State<AddNotificationScreen> {
  //
  ApiProvider test = ApiProvider();
  String? title;
  String? content;
  bool notificationType = false;
  XFile? photo;
  MultipartFile? image;

  Future<int> addAnnouncement({
    required String peCode,
    required String title,
    required String content,
    required bool priority,
    required MultipartFile image,
  }) async {
    try {
      Response response = await test.addAnnouncement(
        peCode: peCode,
        title: title,
        content: content,
        priority: false,
        image: image,
      );

      //   String data = response.toString();
      print(response);

      EasyLoading.dismiss();

      if (response.data['Status'] == 200) {
        return 200;
      } else if (response.data['Status'] == 400) {
        print('نام کاربری یا رمز عبور اشتباه است');
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
      EasyLoading.dismiss();
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message:
              'درخواست ارسال نشد اتصال به شبکه را بررسی نمایید یا لحظاتی دیگر تلاش نمایید',
        ),
      );
      print(e);
      print('ای پی آی به ارور خورد ( ممکنه نت قط باشه ممکنه هم سرور جواب نده)');
      return 1000;
    }
  }

  Future<bool> showPhoto() async {
    return (await showDialog(
          barrierColor: const Color.fromARGB(97, 178, 216, 218),
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: Image.file(File(photo!.path)),
          ),
        )) ??
        false;
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
                    'اطلاعیه جدید',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
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
                        label: Text('عتوان اطلاعیه'),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
                    onChanged: (value) {
                      setState(() {
                        title = value;
                      });
                    },
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
                    minLines: 1,
                    maxLines: 5,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        label: Text('توضیحات'),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
                    onChanged: (value) {
                      setState(() {
                        content = value;
                      });
                    },
                  ),
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
                  if (photo == null)
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          ImagePicker picker = ImagePicker();
                          photo = await picker.pickImage(
                              source: ImageSource.gallery);
                          image = await MultipartFile.fromFile(photo!.path,
                              filename: photo!.path.split('/').last);
                          setState(() {
                            photo;
                          });
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
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
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
                    )
                  else
                    Expanded(
                      child: Stack(
                        children: [
                          Neumorphic(
                            style: NeumorphicStyle(
                              color: Colors.transparent,
                              shadowDarkColor: Colors.black,
                              depth: 4,
                              intensity: 0.5,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(12)),
                            ),
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            padding: EdgeInsets.all(20),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    showPhoto();
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      File(photo!.path),
                                      height: 120,
                                      width: 120,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 10,
                            top: 10,
                            child: IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {
                                setState(() {
                                  photo = null;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90),
                child: NeumorphicButton(
                  style: NeumorphicStyle(
                    color: (title == null || content == null)
                        ? Theme.of(context).primaryColor.withOpacity(0.2)
                        : (title!.length > 2 && content!.length > 2)
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).primaryColor.withOpacity(0.2),
                    shadowDarkColor: Colors.black,
                    depth: 5,
                    intensity: 0.5,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(40)),
                  ),
                  onPressed: (title == null || content == null)
                      ? null
                      : (title!.length > 2 && content!.length > 2)
                          ? () {
                              addAnnouncement(
                                  peCode: '11111',
                                  title: title!,
                                  content: content!,
                                  priority: notificationType,
                                  image: image!);
                            }
                          : null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        child: Text(
                          'انتشار اطلاعیه',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
