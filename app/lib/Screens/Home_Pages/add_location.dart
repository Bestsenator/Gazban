import 'dart:async';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';


class AddLocationScreen extends StatefulWidget {
  const AddLocationScreen({super.key});

  @override
  State<AddLocationScreen> createState() => _AddLocationScreenState();
}

class _AddLocationScreenState extends State<AddLocationScreen> {
  //
  bool locationType = false;
  String? region = 'بردسکن';
  String? city;

  popPage() {
    Navigator.of(context).pop(false);
    Navigator.of(context).pop(false);
  }

  Future<bool> choicePersonType() async {
    return (await showDialog(
          barrierDismissible: false,
          barrierColor: const Color.fromARGB(97, 178, 216, 218),
          context: context,
          builder: (context) => WillPopScope(
            onWillPop: () => popPage(),
            child: AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              title: const Text('انتخاب دسته بندی'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                      'برای تعریف منطقه جدید ابتدا دسته‌بندی آن را انتخاب نمایید'),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              locationType = false;
                            });
                            Navigator.of(context).pop(false);
                          },
                          child: Neumorphic(
                            padding: EdgeInsets.all(5),
                            style: NeumorphicStyle(
                              color: Colors.transparent,
                              shadowDarkColor: Colors.black,
                              depth: 2,
                              intensity: 0.5,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(12)),
                            ),
                            child: Center(child: Text('روستا')),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              locationType = true;
                            });
                            Navigator.of(context).pop(false);
                          },
                          child: Neumorphic(
                            padding: EdgeInsets.all(5),
                            style: NeumorphicStyle(
                              color: Colors.transparent,
                              shadowDarkColor: Colors.black,
                              depth: 2,
                              intensity: 0.5,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(12)),
                            ),
                            child: Center(child: Text('شهر')),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )) ??
        false;
  }

  wait() {
    var durtion = Duration(microseconds: 100);
    return Timer(durtion, choicePersonType);
  }

  @override
  void initState() {
    wait();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'افزودن منطقه',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text('دسته بندی'),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: NeumorphicToggle(
                  style: NeumorphicToggleStyle(
                    backgroundColor: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  selectedIndex: locationType ? 0 : 1,
                  thumb: Center(
                    child: Container(),
                  ),
                  children: [
                    ToggleElement(
                      foreground: Center(child: Text('روستا')),
                      background: Center(
                        child: Text(
                          'روستا',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                    ToggleElement(
                      foreground: Center(child: Text('شهر')),
                      background: Center(
                        child: Text(
                          'شهر',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      locationType = value == 1 ? true : false;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Neumorphic(
                  style: NeumorphicStyle(
                    color: Colors.transparent,
                    shadowDarkColor: Colors.black,
                    depth: 4,
                    intensity: 0.5,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        label: Text('نام ${locationType ? 'شهر' : 'روستا'}'),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
                    onChanged: (value) {},
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text('ناحیه'),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Neumorphic(
                  style: NeumorphicStyle(
                    color: Colors.transparent,
                    shadowDarkColor: Colors.black,
                    depth: 4,
                    intensity: 0.5,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 15),
                      IgnorePointer(
                        ignoring: true,
                        child: DropdownButton(
                            hint: Text(
                              region ?? '',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .color,
                              ),
                            ),
                            underline: Container(),
                            icon: Container(),
                            items: const [],
                            onChanged: null),
                      ),
                    ],
                  ),
                ),
              ),
              !locationType
                  ? Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Text('شهر'),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Neumorphic(
                            style: NeumorphicStyle(
                              color: Colors.transparent,
                              shadowDarkColor: Colors.black,
                              depth: 4,
                              intensity: 0.5,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(12)),
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 15),
                                DropdownButton(
                                    hint: Text(
                                      'انتخاب شهر',
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .displayLarge!
                                            .color,
                                      ),
                                    ),
                                    underline: Container(),
                                    icon: Container(),
                                    value: city,
                                    items: [
                                      DropdownMenuItem(
                                          value: '1', child: Text('شهر1')),
                                      DropdownMenuItem(
                                          value: '2', child: Text('شهر2')),
                                      DropdownMenuItem(
                                          value: '3', child: Text('شهر3')),
                                      DropdownMenuItem(
                                          value: '4', child: Text('شهر4')),
                                      DropdownMenuItem(
                                          value: '5', child: Text('شهر5')),
                                      DropdownMenuItem(
                                          value: '6', child: Text('شهر6')),
                                      DropdownMenuItem(
                                          value: '7', child: Text('شهر7')),
                                      DropdownMenuItem(
                                          value: '8', child: Text('شهر8')),
                                      DropdownMenuItem(
                                          value: '9', child: Text('شهر9')),
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        city = value!;
                                      });
                                    }),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
