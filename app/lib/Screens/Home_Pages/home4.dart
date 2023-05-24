import 'dart:io';

import 'package:expandable/expandable.dart';
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
            Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text('درخواست های مرخصی گازبانان'),
                      Divider(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                          padding: EdgeInsets.only(bottom: 290),
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                ExpandablePanel(
                                  theme: ExpandableThemeData(
                                    iconColor: Theme.of(context)
                                        .iconTheme
                                        .color!
                                        .withOpacity(0.5),
                                    iconSize: 30,
                                    iconPadding:
                                        EdgeInsets.fromLTRB(20, 20, 0, 10),
                                  ),
                                  header: ListTile(
                                    leading: Icon(
                                      Icons.access_time_rounded,
                                      size: 30,
                                    ),
                                    title: Text('مرخصی ${index + 1} ساعته'),
                                  ),
                                  collapsed: Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  CupertinoIcons
                                                      .arrow_up_right_circle,
                                                  size: 20,
                                                ),
                                                Text(' گازبان : اباصالح فاطمی'),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  CupertinoIcons
                                                      .arrow_down_left_circle,
                                                  size: 20,
                                                ),
                                                Text(
                                                    ' معین گازبان : مبین اطمینان'),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  expanded: Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  CupertinoIcons
                                                      .arrow_up_right_circle,
                                                  size: 20,
                                                ),
                                                Text(' گازبان : اباصالح فاطمی'),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  CupertinoIcons
                                                      .arrow_down_left_circle,
                                                  size: 20,
                                                ),
                                                Text(
                                                    ' معین گازبان : مبین اطمینان'),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.timer_sharp,
                                                  size: 20,
                                                ),
                                                Text(' شروع مرخصی : '),
                                                Text(' 09:15 '),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  CupertinoIcons.timer,
                                                  size: 20,
                                                ),
                                                Text(' پایان مرخصی : '),
                                                Text(' 12:15 '),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              child: SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    50,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5),
                                                        child: ElevatedButton(
                                                          onPressed: () {},
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    17,
                                                                    0),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        15),
                                                            child:
                                                                Text('رد کردن'),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5),
                                                        child: ElevatedButton(
                                                          onPressed: () {},
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                Color.fromARGB(
                                                                    255,
                                                                    32,
                                                                    193,
                                                                    37),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        15),
                                                            child: Text(
                                                                'تایید مرخصی'),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
