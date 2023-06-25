// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names, avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gazban/Data/Api/api_provider.dart';
import 'package:gazban/Screens/Navigation/navigation.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Data/Models/head_area.dart';
import '../../Data/static_data_app.dart';
import '../Login_Pages/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  //
  ApiProvider test = ApiProvider();

  bool chek = true;

  Future<String> GetIp() async {
    late String ip;
    for (var interface in await NetworkInterface.list()) {
      ip = interface.addresses[0].address;
    }
    return ip;
  }

  Future<String> GetDeviceModel() async {
    if (Platform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.model;
    }
    if (Platform.isWindows) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      WindowsDeviceInfo windowsInfo = await deviceInfo.windowsInfo;
      return windowsInfo.productName;
    } else {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
      return webBrowserInfo.appName!;
    }
  }

  Future<String> GetSession() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('Session') ?? '0';
  }

  String GetAppVersion() {
    return appVersion;
  }

  Future<String> CheckRealDevice() async {
    if (Platform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.isPhysicalDevice.toString();
    } else {
      return 'none';
    }
  }

  checkSessionState() async {
    // loading
    EasyLoading.instance
      ..maskType = EasyLoadingMaskType.custom
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.ripple
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 60
      ..radius = 40
      ..backgroundColor = Theme.of(context).primaryColorLight
      ..indicatorColor = Theme.of(context).primaryColor
      ..textColor = Theme.of(context).primaryColor
      ..textStyle =
          const TextStyle(fontWeight: FontWeight.bold, color: Colors.red)
      ..maskColor = Theme.of(context).scaffoldBackgroundColor.withOpacity(0.6)
      ..dismissOnTap = false;
    // loading

    String session = await GetSession();
    String version = GetAppVersion();
    String ip = await GetIp();
    String real = await CheckRealDevice();

    try {
      Response response = await test.checkSessionApi(
          session: session,
          appVersion: version,
          deviceIp: ip,
          realDevice: real);

      String data = response.toString();

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
        return 203;
      }
      if (response.data['Status'] == 204) {
        return 204;
      }
      if (response.data['Status'] == 205) {
       
        return 205;
      } else if (response.data['Status'] == 400) {
        print('سشن تموم شده یا معتبر نیست');
        return 400;
      } else if (response.data['Status'] == 401) {
        print('برنامه نیاز به آپدیت داره');
        return 401;
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
    } on TimeoutException catch (e) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: 'پاسخی از سرور دریافت نشد',
        ),
      );

      print('پاسخی از سرور دریافت نشد');
      return 1000;
    } catch (e) {
      print(e);
      setState(() {
        chek = false;
      });

      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.success(
          message:
              'درخواست ارسال نشد اتصال به شبکه را بررسی نمایید یا فیلترشکن خود را خاموش نمایید',
        ),
      );

      print(
          'ای پی آی به ارور خورد ( ممکنه نت قط باشه یا عیبی تو شبکه گوشی باشه)');
      return 1000;
    }
  }

  Future Update() async {
    return (await showDialog(
      barrierColor: const Color.fromARGB(97, 178, 216, 218),
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        title: const Text('بروزرسانی برنامه'),
        content: Text(
            'به دلیل توسعه و بهینه سازی نسخه جدید از برنامه منتشر شده است ، برای اسفاده از برنامه ابتدا برنامه را بروزرسانی کنید\nنسخه فعلی برنامه : ${GetAppVersion()}'),
        actions: <Widget>[
          TextButton(
            onPressed: () => exit(0),
            child: const Text('خروج از برنامه'),
          ),
          ElevatedButton(
            onPressed: (
                {String url = 'https://pishkhan.cafebazaar.ir/'}) async {
              await launchUrl(Uri.parse(url),
                  mode: LaunchMode.externalApplication);
            },
            child: const Text('بروز رسانی'),
          ),
        ],
      ),
    ));
  }

  ChekState() async {
    String session = await GetSession();
    if (session == '0') {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    } else {
      int status = await checkSessionState();
      if (status == 200) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Navigation()));
      }
      if (status == 400) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('نشست شما منقضی شده است به صفحه ورود منتقل می شوید'),
            backgroundColor: Colors.red,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(14),
              ),
            ),
          ),
        );
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      }

      if (status == 401) {
        Update();
      }
      if (status == 900) {
        Update();
      }
      if (status == 901) {
        exit(0);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    ChekState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                  IconButton(
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.clear();
                    },
                    icon: Icon(Icons.delete),
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
