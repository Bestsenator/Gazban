import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:gazban/Helpers/number.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../Data/Api/api_provider.dart';
import '../../Data/Models/head_city.dart';
import '../../Data/Models/head_relief.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  //
  ApiProvider test = ApiProvider();
  String? username;
  String? password = '';

  Future<bool> setSession(String session) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString('Session', session);
  }

  Future<int> checkInfoDelivery({
    required String username,
    required String password,
  }) async {
    try {
      Response response =
          await test.loginApi(username: username, password: password);
      Response response1 = await test.editCharacterInfoApi(
        peCode: '123',
        character: 'Ardi',
        peCodeCharacter: '123',
        name: 'ali',
        family: 'najaf',
        nationalCode: '6510097801',
        listOfPhone: ['09154807916', '09154807916', '09154807916'],
        listOfVillages: [],
      );
      //   String data = response.toString();
      print(response);
      print(response1);
      EasyLoading.dismiss();

      // سشن ذخیره می‌شود
      if (response.data['Status'] >= 200 || response.data['Status'] <= 205) {
        setSession(response.data['Info']['Session']);
      }

      if (response.data['Status'] == 200) {
        return 200;
      }
      if (response.data['Status'] == 201) {
        return 201;
      }
      if (response.data['Status'] == 202) {
        return 202;
      }
      if (response.data['Status'] == 203) {
        HeadCity ali = HeadCity();

        var reza = json.encode(response.data['Info']);
        print(reza);

        ali = HeadCity.fromJson(reza);
        print(ali);
        return 203;
      }
      if (response.data['Status'] == 204) {
        HeadRelief ali = HeadRelief();

        var reza = json.encode(response.data['Info']);
        print(reza);

        ali = HeadRelief.fromJson(reza);
        print(ali);
        return 204;
      }
      if (response.data['Status'] == 205) {
        return 205;
      } else if (response.data['Status'] == 400) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Row(
            children: const [
              Icon(Icons.close_rounded, color: Colors.white),
              Padding(padding: EdgeInsets.only(left: 5)),
              Text('نام کاربری یا رمز عبور اشتباه است'),
            ],
          ),
          backgroundColor: Colors.red,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          behavior: SnackBarBehavior.floating,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(14),
            ),
          ),
        ));
        print('نام کاربری یا رمز عبور اشتباه است');
        return 400;
      }  else if (response.data['Status'] == 900) {
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

  chekState() async {
    EasyLoading.show(status: 'در حال بارگذاری . . .');
    int status =
        await checkInfoDelivery(username: username!, password: password!);
    if (status == 200) {}
  }

  Future<bool> exitApp() async {
    return (await showDialog(
          barrierColor: const Color.fromARGB(97, 178, 216, 218),
          context: context,
          builder: (context) => AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            title: const Text('خروج از برنامه'),
            content: const Text('آیا می خواهید از برنامه خارج شوید؟'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('خیر'),
              ),
              TextButton(
                onPressed: () => exit(0),
                child: const Text('بله'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: exitApp,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
                      child: SizedBox(
                        height: 200,
                        width: 200,
                        child: Stack(
                          children: [
                            Image(
                              image: AssetImage('assets/icon/icon.png'),
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.transparent,
                              highlightColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              period: const Duration(milliseconds: 5000),
                              child: const Padding(
                                padding: EdgeInsets.only(bottom: 2),
                                child: Image(
                                  image: AssetImage('assets/icon/icon.png'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Text(
                      'ورود به حساب',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Neumorphic(
                    margin: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    style: NeumorphicStyle(
                      color: Colors.transparent,
                      shadowDarkColor: Colors.black,
                      depth: 4,
                      intensity: 0.5,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(12)),
                    ),
                    child: TextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp('[0-9۰۱۲۳۴۵۶۷۸۹]')),
                        TextInputFormatter.withFunction((oldValue, newValue) {
                          return newValue.copyWith(
                              text: convertToFa(newValue.text));
                        }),
                      ],
                      maxLength: 10,
                      style: const TextStyle(fontSize: 18, letterSpacing: 1.5),
                      textDirection: TextDirection.ltr,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        counterText: '',
                        label: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(CupertinoIcons.person_fill,
                                  color: Color.fromARGB(255, 19, 8, 118)),
                              Text(
                                ' نام کاربری ',
                                style: TextStyle(letterSpacing: 0),
                              ),
                            ]),
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        value = convertToEn(value);
                        setState(
                          () {
                            username = value;
                          },
                        );
                      },
                    ),
                  ),
                  Neumorphic(
                    margin: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    style: NeumorphicStyle(
                      color: Colors.transparent,
                      shadowDarkColor: Colors.black,
                      depth: 4,
                      intensity: 0.5,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(12)),
                    ),
                    child: TextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp('[0-9۰۱۲۳۴۵۶۷۸۹]')),
                        TextInputFormatter.withFunction((oldValue, newValue) {
                          return newValue.copyWith(
                              text: convertToFa(newValue.text));
                        }),
                      ],
                      maxLength: 10,
                      style: const TextStyle(fontSize: 18, letterSpacing: 1.5),
                      textDirection: TextDirection.ltr,
                      keyboardType: TextInputType.phone,
                      minLines: 1,
                      maxLines: 1,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        hintTextDirection: TextDirection.ltr,
                        counterText: '',
                        label: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/key.png',
                                  height: 20, width: 20, color: Colors.red),
                              const Text(
                                ' رمز عبور ',
                                style: TextStyle(letterSpacing: 0),
                              ),
                            ]),
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        value = convertToEn(value);
                        setState(
                          () {
                            password = value;
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: NeumorphicButton(
                      style: NeumorphicStyle(
                        color: password!.length == 10 && username != null
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).primaryColor.withOpacity(0.2),
                        shadowDarkColor: Colors.black,
                        depth: 4,
                        intensity: 0.5,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(40)),
                      ),
                      onPressed: password!.length == 10 && username != null
                          ? () {
                              chekState();
                            }
                          : null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 20),
                            child: Text(
                              'ورود',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
