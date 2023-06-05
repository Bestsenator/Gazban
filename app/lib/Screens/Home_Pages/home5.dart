import 'dart:io';

import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:shimmer/shimmer.dart';

import '../../Helpers/number.dart';
import '../Navigation/navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 60),
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
                            color: Theme.of(context).primaryColor, width: 2),
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
                        Text('رئیس ناحیه بردسکن'),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/notification');
                      },
                      tooltip: 'اعلان ها',
                      icon: const Icon(Icons.notifications_outlined)),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/persons');
                              },
                              child: Neumorphic(
                                style: NeumorphicStyle(
                                  color: Colors.transparent,
                                  shadowDarkColor: Colors.black,
                                  depth: 4,
                                  intensity: 0.4,
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(12)),
                                ),
                                margin: EdgeInsets.fromLTRB(7.5, 5, 10, 5),
                                padding: EdgeInsets.all(20),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Icon(CupertinoIcons.person, size: 40),
                                      Text('مشاهده افراد'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/add_person');
                              },
                              child: Neumorphic(
                                style: NeumorphicStyle(
                                  color: Colors.transparent,
                                  shadowDarkColor: Colors.black,
                                  depth: 4,
                                  intensity: 0.4,
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(12)),
                                ),
                                margin: EdgeInsets.fromLTRB(10, 5, 7.5, 5),
                                padding: EdgeInsets.all(20),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Icon(CupertinoIcons.person_add, size: 40),
                                      Text('افزودن افراد'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/add_notification');
                              },
                              child: Neumorphic(
                                style: NeumorphicStyle(
                                  color: Colors.transparent,
                                  shadowDarkColor: Colors.black,
                                  depth: 4,
                                  intensity: 0.4,
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(12)),
                                ),
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                padding: EdgeInsets.all(20),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Icon(CupertinoIcons.envelope, size: 40),
                                      Text('ابلاغیه جدید'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/locations');
                              },
                              child: Neumorphic(
                                style: NeumorphicStyle(
                                  color: Colors.transparent,
                                  shadowDarkColor: Colors.black,
                                  depth: 4,
                                  intensity: 0.4,
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(12)),
                                ),
                                margin: EdgeInsets.fromLTRB(7.5, 5, 10, 5),
                                padding: EdgeInsets.all(20),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Icon(Icons.location_on_outlined,
                                          size: 40),
                                      Text('مشاهده اماکن'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/add_location');
                              },
                              child: Neumorphic(
                                style: NeumorphicStyle(
                                  color: Colors.transparent,
                                  shadowDarkColor: Colors.black,
                                  depth: 4,
                                  intensity: 0.4,
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(12)),
                                ),
                                margin: EdgeInsets.fromLTRB(10, 5, 7.5, 5),
                                padding: EdgeInsets.all(20),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Icon(Icons.add_location, size: 40),
                                      Text('افزودن اماکن'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
