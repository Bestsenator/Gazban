import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gazban/Helpers/number.dart';
import 'package:shimmer/shimmer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  //
  String? username;
  String? password = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Future<int> checkInfoDelivery({
  //   required String username,
  //   required String password,
  // }) async {

  //   try {
  //     Response response = await test.checkInfoDeliveryApi(
  //         username: username, password: password);
  //     String data = response.toString();
  //     print(response);
  //     EasyLoading.dismiss();
  //     if (CheckResponse(data: data) == 200) {
  //       String session = SaveDataResponse(data: data);
  //       final prefs = await SharedPreferences.getInstance();
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  //       await prefs.setString('session', session);
  //       print('مشکلی نیست بریم خونه');
  //       return 200;
  //     } else if (CheckResponse(data: data) == 400) {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Row(
  //           children: const [
  //             Icon(Icons.close_rounded, color: Colors.white),
  //             Padding(padding: EdgeInsets.only(left: 5)),
  //             Text('نام کاربری یا رمز عبور اشتباه است'),
  //           ],
  //         ),
  //         backgroundColor: Colors.red,
  //         margin: const EdgeInsets.all(20),
  //         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
  //         behavior: SnackBarBehavior.floating,
  //         shape: const RoundedRectangleBorder(
  //           borderRadius: BorderRadius.all(
  //             Radius.circular(14),
  //           ),
  //         ),
  //       ));
  //       print('نام کاربری یا رمز عبور اشتباه است');
  //       return 400;
  //     } else if (CheckResponse(data: data) == 900) {
  //       print('کلید ای پی آی معتبر نیست ، احتمالا بکند بروزرسانی داشته');
  //       return 900;
  //     } else if (CheckResponse(data: data) == 901) {
  //       print('یه چیزی توی ارسال داده ها درست نیست');
  //       return 901;
  //     } else {
  //       print('خطای ناشناخته ، کد خطا برنامه ریزی نشده');
  //       return 1000;
  //     }
  //   } catch (e) {
  //     EasyLoading.dismiss();
  //     showTopSnackBar(
  //       Overlay.of(context),
  //       const CustomSnackBar.error(
  //         message:
  //             'درخواست ارسال نشد اتصال به شبکه را بررسی نمایید یا لحظاتی دیگر تلاش نمایید',
  //       ),
  //     );
  //     print('ای پی آی به ارور خورد ( ممکنه نت قط باشه ممکنه هم سرور جواب نده)');
  //     return 1000;
  //   }
  // }

  // chekState() async {
  //   EasyLoading.show(status: 'در حال بارگذاری . . .');
  //   int status =
  //       await checkInfoDelivery(username: username!, password: password!);
  //   if (status == 200) {}
  // }

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
    var width_screen = MediaQuery.of(context).size.width;
    var height_screen = MediaQuery.of(context).size.height;

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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
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
                        border: const OutlineInputBorder(),
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
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
                        border: const OutlineInputBorder(),
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
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: ElevatedButton(
                      autofocus: true,
                      onPressed: password!.length == 10 && username != null
                          ? () {
                              // chekState();
                            }
                          : null,
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                      ),
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
