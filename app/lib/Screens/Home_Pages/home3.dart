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

  List<Widget> listVillage = [];
  List<TableRow> listRowTable = [];

  createListVillageUser() {
    listVillage.clear();
    for (int i = 0; i < 10; i++) {
      listVillage.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('تربت'),
      ));
    }
  }

  createTableRow() {
    for (int i = 0; i < 40; i++) {
      listRowTable.add(
        TableRow(children: [
          Center(child: Text('ازغند')),
          Center(
            child: GestureDetector(
                onTap: () {
                  createListVillageUser();
                  infoUser();
                },
                child: Text('علی نجف زاده')),
          )
        ]),
      );
    }
  }

  Future<bool> infoUser() async {
    return (await showDialog(
          barrierColor: const Color.fromARGB(97, 178, 216, 218),
          context: context,
          builder: (context) => AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            title: const Text('اطلاعات گازبان'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('نام : علی نجف زاده'),
                  Text('منطقه : '),
                  Wrap(
                    children: listVillage,
                  ),
                  Text('شماره همراه : '),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Text('09154807916'),
                          Text('09154807916'),
                          Text('09154807916'),
                          Text('09154807916')
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: <Widget>[
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('بازگشت'),
              )
            ],
          ),
        )) ??
        false;
  }

  @override
  void initState() {
    createTableRow();
    super.initState();
  }

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
                          'کاربر امداد',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text('امداد گر انابد'),
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
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Table(
                      border: TableBorder.all(),
                      children: [
                            TableRow(children: [
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    'منطقه',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    'گازبان',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ] +
                          listRowTable),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
