import 'dart:io';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Home_Pages/home5.dart';
import '../Profile_Page/profile.dart';
import '../Report_Page/reports.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  //
  final List<Widget> bottomBarPages = [
    ReportScreen(),
    HomeScreen(),
    ProfileScreen(),
  ];
  PageController pageController = PageController(initialPage: 1);

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
        child: Scaffold(
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
            child: PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                  bottomBarPages.length, (index) => bottomBarPages[index]),
            ),
          ),
          extendBody: true,
          bottomNavigationBar: AnimatedNotchBottomBar(
            pageController: pageController,
            color: Theme.of(context).scaffoldBackgroundColor,
            showLabel: true,
            notchColor: Color.fromARGB(255, 255, 255, 255),
            showBlurBottomBar: true,
            blurOpacity: 0.3,
            bottomBarItems: const [
              BottomBarItem(
                inActiveItem: Icon(CupertinoIcons.square_list),
                activeItem: Icon(CupertinoIcons.square_list_fill),
                itemLabel: 'گزارشات',
              ),
              BottomBarItem(
                inActiveItem: Icon(CupertinoIcons.flame),
                activeItem: Icon(CupertinoIcons.flame_fill),
                itemLabel: 'خانه',
              ),
              BottomBarItem(
                inActiveItem: Icon(CupertinoIcons.person),
                activeItem: Icon(CupertinoIcons.person_fill),
                itemLabel: 'حساب',
              ),
            ],
            showShadow: false,
            onTap: (index) {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.decelerate,
              );
            },
          ),
        ));
  }
}
