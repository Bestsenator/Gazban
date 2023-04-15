// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names, avoid_print

import 'dart:async';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  //

  bool chek = true;

  // Future<String> GetIp() async {
  //   late String ip;
  //   for (var interface in await NetworkInterface.list()) {
  //     ip = interface.addresses[0].address;
  //   }
  //   return ip;
  // }

  // Future<String> GetDeviceModel() async {
  //   if (Platform.isAndroid) {
  //     DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //     AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  //     return androidInfo.model;
  //   }
  //   if (Platform.isWindows) {
  //     DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //     WindowsDeviceInfo windowsInfo = await deviceInfo.windowsInfo;
  //     return windowsInfo.productName;
  //   } else {
  //     DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //     WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
  //     return webBrowserInfo.appName!;
  //   }
  // }

  // Future<String> CheckRealDevice() async {
  //   if (Platform.isAndroid) {
  //     DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //     AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  //     return androidInfo.isPhysicalDevice.toString();
  //   } else {
  //     return 'none';
  //   }
  // }

  // Future<String> GetSession() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.getString('session') ?? '0';
  // }

  // Future<String> GetUrl() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   headUrl = prefs.getString('url') ?? headUrl1;
  //   // headUrl = headUrl1;
  //   return headUrl;
  // }

  // Future ChangeUrl(String url) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setString('url', url);
  // }

  // String GetAppVersion() {
  //   return appVersion;
  // }

  // checkSessionState() async {
  //   // loading
  //   EasyLoading.instance
  //     ..maskType = EasyLoadingMaskType.custom
  //     ..displayDuration = const Duration(milliseconds: 2000)
  //     ..indicatorType = EasyLoadingIndicatorType.ripple
  //     ..loadingStyle = EasyLoadingStyle.custom
  //     ..indicatorSize = 60
  //     ..radius = 40
  //     ..backgroundColor = Theme.of(context).primaryColorLight
  //     ..indicatorColor = Theme.of(context).primaryColor
  //     ..textColor = Theme.of(context).primaryColor
  //     ..textStyle =
  //         const TextStyle(fontWeight: FontWeight.bold, color: Colors.red)
  //     ..maskColor = Theme.of(context).scaffoldBackgroundColor.withOpacity(0.6)
  //     ..dismissOnTap = false;
  //   // loading

  //   String session = await GetSession();
  //   String version = GetAppVersion();
  //   String ip = await GetIp();
  //   String model = await GetDeviceModel();
  //   String real = await CheckRealDevice();

  //   try {
  //     print(headUrl);
  //     Response response = await test.checkSessionDeliveryApi(
  //         session: session,
  //         appVersion: version,
  //         deviceIp: ip,
  //         deviceModel: model,
  //         realDevice: real);

  //     String data = response.toString();
  //     print(response);
  //     if (CheckResponse(data: data) == 200) {
  //       String session = SaveDataResponse(data: data);
  //       final prefs = await SharedPreferences.getInstance();
  //       await prefs.setString('session', session);
  //       print('مشکلی نیست باید بریم صفحه خانه');
  //       return 200;
  //     } else if (CheckResponse(data: data) == 400) {
  //       print('سشن تموم شده یا معتبر نیست');
  //       return 400;
  //     } else if (CheckResponse(data: data) == 401) {
  //       print('برنامه نیاز به آپدیت دارد');
  //       return 401;
  //     } else if (CheckResponse(data: data) == 402) {
  //       print('حساب کاربری شما غیر فعال است');
  //       return 402;
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
  //   } on TimeoutException catch (e) {
  //     if (headUrl == headUrl1) {
  //       await ChangeUrl(headUrl2);
  //     } else {
  //       await ChangeUrl(headUrl1);
  //     }

  //     setState(() {
  //       chek = false;
  //     });
  //     print(e);

  //     showTopSnackBar(
  //       Overlay.of(context),
  //       const CustomSnackBar.error(
  //         message: 'پاسخی از سرور دریافت نشد',
  //       ),
  //     );

  //     print('پاسخی از سرور دریافت نشد');
  //     return 1000;
  //   } catch (e) {
  //     setState(() {
  //       chek = false;
  //     });
  //     print(e);

  //     showTopSnackBar(
  //       Overlay.of(context),
  //       const CustomSnackBar.error(
  //         message:
  //             'درخواست ارسال نشد اتصال به شبکه را بررسی نمایید یا فیلترشکن خود را خاموش نمایید',
  //       ),
  //     );

  //     print(
  //         'ای پی آی به ارور خورد ( ممکنه نت قط باشه یا عیبی تو شبکه گوشی باشه)');
  //     return 1000;
  //   }
  // }

  // Future Update() async {
  //   return (await showDialog(
  //     barrierColor: const Color.fromARGB(97, 178, 216, 218),
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       shape: const RoundedRectangleBorder(
  //           borderRadius: BorderRadius.all(Radius.circular(20.0))),
  //       title: const Text('بروزرسانی برنامه'),
  //       content: Text(
  //           'به دلیل توسعه و بهینه سازی نسخه جدید از برنامه منتشر شده است ، برای اسفاده از برنامه ابتدا برنامه را بروزرسانی کنید\nنسخه فعلی برنامه : ${GetAppVersion()}'),
  //       actions: <Widget>[
  //         TextButton(
  //           onPressed: () => exit(0),
  //           child: const Text('خروج از برنامه'),
  //         ),
  //         ElevatedButton(
  //           onPressed: (
  //               {String url = 'https://pishkhan.cafebazaar.ir/'}) async {
  //             await launchUrl(Uri.parse(url),
  //                 mode: LaunchMode.externalApplication);
  //           },
  //           child: const Text('بروز رسانی'),
  //         ),
  //       ],
  //     ),
  //   ));
  // }

  // ChekState() async {
  //   headUrl = await GetUrl();
  //   String session = await GetSession();
  //   if (session == '0') {
  //     Navigator.pushReplacement(context,
  //         MaterialPageRoute(builder: (context) => const LoginScreen()));
  //   } else {
  //     int status = await checkSessionState();
  //     if (status == 200) {
  //       Navigator.pushReplacement(context,
  //           MaterialPageRoute(builder: (context) => const HomeScreen()));
  //     }
  //     if (status == 400) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text('نشست شما منقضی شده است به صفحه ورود منتقل می شوید'),
  //           backgroundColor: Colors.red,
  //           margin: EdgeInsets.all(20),
  //           padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
  //           behavior: SnackBarBehavior.floating,
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.all(
  //               Radius.circular(14),
  //             ),
  //           ),
  //         ),
  //       );
  //       Navigator.pushReplacement(context,
  //           MaterialPageRoute(builder: (context) => const LoginScreen()));
  //     }

  //     if (status == 401) {
  //       Update();
  //     }
  //     if (status == 402) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Row(
  //             children: const [
  //               Icon(Icons.close_rounded),
  //               Padding(padding: EdgeInsets.only(left: 5)),
  //               Text('حساب کاربری شما غیر فعال است با پشتیبانی ارتباط بگیرید'),
  //             ],
  //           ),
  //           backgroundColor: Colors.red,
  //           margin: const EdgeInsets.all(20),
  //           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
  //           behavior: SnackBarBehavior.floating,
  //           shape: const RoundedRectangleBorder(
  //             borderRadius: BorderRadius.all(
  //               Radius.circular(14),
  //             ),
  //           ),
  //           duration: const Duration(seconds: 10),
  //         ),
  //       );
  //     }
  //     if (status == 900) {
  //       Update();
  //     }
  //     if (status == 901) {
  //       exit(0);
  //     }
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   ChekState();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
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
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 250,
                width: 250,
                child: Image(
                  image: AssetImage('assets/icon/icon.png'),
                ),
              ),
              Column(
                children: [
                  const Text(
                    'گازبان',
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text('شرکت ملی پخش فرآورده های نفتی',
                      style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 30),
                  chek
                      ? LoadingAnimationWidget.staggeredDotsWave(
                          color: Theme.of(context).primaryColor,
                          size: 60,
                        )
                      : ElevatedButton(
                          onPressed: () {
                            setState(() {
                              chek = true;
                            });
                            // ChekState();
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 20),
                            child: Text(
                              'تلاش مجدد',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
