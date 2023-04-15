import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';

import '../../Helpers/number.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //

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
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 15),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: NetworkImage(
                                  'https://www.peykarman.ir/static/supportLogo/DevSupervisor.jpg'),
                            ),
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'محمد جهانگیر',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text('رئیس اداره شهر انابد'),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: IconButton(
                          onPressed: () {},
                          tooltip: 'اعلان ها',
                          icon: const Icon(Icons.notifications_outlined)),
                    ),
                  ],
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
