import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:top_modal_sheet/top_modal_sheet.dart';

import '../../Theme/theme_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //
  bool darkTheme = false;
  bool activeFingerPrint = false;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            GestureDetector(
              child: Column(
                children: [
                  Neumorphic(
                    child: Container(
                      height: 100,
                      width: 100,
                      padding: EdgeInsets.all(15),
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
                            child: Image(
                              image: AssetImage('assets/icon/icon.png'),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.2),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    style: NeumorphicStyle(
                      color: Colors.transparent,
                      shadowDarkColor: Colors.black,
                      depth: 3,
                      intensity: 0.4,
                      boxShape: NeumorphicBoxShape.circle(),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'محمد جهانگیر',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text('رئیس اداره شهر انابد'),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, '/infoUser');
              },
            ),
            SizedBox(height: 15),
            Neumorphic(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              padding: EdgeInsets.symmetric(vertical: 3),
              style: NeumorphicStyle(
                color: Colors.transparent,
                shadowDarkColor: Colors.black,
                depth: 4,
                intensity: 0.4,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 30,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(CupertinoIcons.bubble_left),
                          title: Text('درخواست به مدیریت'),
                          minLeadingWidth: 0,
                        ),
                        ListTile(
                          leading: Icon(Icons.info_outline_rounded),
                          title: Text('درباره برنامه'),
                          minLeadingWidth: 0,
                        ),
                        ListTile(
                          leading: Icon(
                              CupertinoIcons.chevron_left_slash_chevron_right),
                          title: Text('توسعه دهندگان'),
                          minLeadingWidth: 0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Neumorphic(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              padding: EdgeInsets.symmetric(vertical: 3),
              style: NeumorphicStyle(
                color: Colors.transparent,
                shadowDarkColor: Colors.black,
                depth: 4,
                intensity: 0.4,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 30,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.fingerprint),
                          title: Text('ورود با اثر انگشت'),
                          minLeadingWidth: 0,
                          trailing: NeumorphicSwitch(
                            height: 30,
                            style: NeumorphicSwitchStyle(
                                activeTrackColor:
                                    Theme.of(context).primaryColor,
                                inactiveTrackColor: Colors.transparent,
                                trackDepth: -5,
                                thumbDepth: 5),
                            value: activeFingerPrint,
                            onChanged: (value) {
                              if (value) {
                                setState(() {
                                  activeFingerPrint = value;
                                });
                              } else {
                                setState(() {
                                  activeFingerPrint = value;
                                });
                              }
                            },
                          ),
                        ),
                        ListTile(
                          leading: Icon(CupertinoIcons.moon_fill),
                          title: Text('حالت شب'),
                          minLeadingWidth: 0,
                          trailing: NeumorphicSwitch(
                            height: 30,
                            style: NeumorphicSwitchStyle(
                                activeTrackColor:
                                    Theme.of(context).primaryColor,
                                inactiveTrackColor: Colors.transparent,
                                trackDepth: -5,
                                thumbDepth: 5),
                            value: darkTheme,
                            onChanged: (value) {
                              if (value) {
                                themeProvider.toggleTheme(ThemeMode.dark);
                                setState(() {
                                  darkTheme = value;
                                });
                              } else {
                                themeProvider.toggleTheme(ThemeMode.light);
                                setState(() {
                                  darkTheme = value;
                                });
                              }
                            },
                          ),
                        ),
                        ListTile(
                          leading: Icon(CupertinoIcons.arrow_2_circlepath),
                          title: Text('بررسی بروزرسانی'),
                          minLeadingWidth: 0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Neumorphic(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              padding: EdgeInsets.symmetric(vertical: 3),
              style: NeumorphicStyle(
                color: Colors.transparent,
                shadowDarkColor: Colors.black,
                depth: 4,
                intensity: 0.4,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 30,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Image.asset('assets/images/logout.png',
                              height: 20, width: 20, color: Colors.red),
                          title: Text('خروج از حساب کاربری'),
                          trailing: Icon(CupertinoIcons.chevron_left),
                          minLeadingWidth: 0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
