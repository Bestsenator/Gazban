import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class LocationsScreen extends StatefulWidget {
  const LocationsScreen({super.key});

  @override
  State<LocationsScreen> createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
  bool locationType = false;

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
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    child: TextField(
                      magnifierConfiguration: TextMagnifierConfiguration(),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'جستجو ...',
                        icon: Icon(CupertinoIcons.search, size: 28),
                        iconColor: Theme.of(context).iconTheme.color,
                        contentPadding: EdgeInsets.only(right: 5),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {},
                    icon: Icon(
                      CupertinoIcons.slider_horizontal_3,
                      size: 35,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
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
                      foreground: Center(child: Text('شهر')),
                      background: Center(
                        child: Text(
                          'شهر',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
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
                  ],
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      locationType = value == 1 ? true : false;
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 40),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Slidable(
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            dismissible: null,
                            children: [
                              Expanded(flex: 1, child: Container()),
                              const SizedBox(width: 8),
                              SlidableAction(
                                onPressed: (context) {},
                                backgroundColor: Theme.of(context).primaryColor,
                                foregroundColor: Colors.white,
                                icon: Icons.edit_location_alt_outlined,
                                label: 'ویرایش',
                                borderRadius: BorderRadius.circular(20),
                                flex: 6,
                              ),
                              const SizedBox(width: 8),
                              SlidableAction(
                                onPressed: (context) async {
                                  // ignore: unused_local_variable
                                },
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                icon: Icons.delete_rounded,
                                label: 'حذف',
                                borderRadius: BorderRadius.circular(20),
                                flex: 5,
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                          child: ListTile(
                            leading: Icon(Icons.ac_unit_rounded),
                            title: Text('تست 1'),
                            subtitle: Text('تست'),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(CupertinoIcons.eye)),
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          indent: 20,
                          endIndent: 20,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
