import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  bool reportType = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
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
                        hintText: 'جستجو ...',
                        contentPadding: EdgeInsets.only(right: 10)),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    /////////////////////////Example 1////////////////////////////
                    var picked = await showPersianDateRangePicker(
                      context: context,
                      initialEntryMode: PDatePickerEntryMode.calendar,
                      initialDateRange: JalaliRange(
                        start: Jalali.now(),
                        end: Jalali.now().addDays(10),
                      ),
                      firstDate: Jalali(1385, 8),
                      lastDate: Jalali(1450, 9),
                      // errorInvalidText:
                    );

                    print(picked.toString());
                  },
                  icon: Icon(
                    CupertinoIcons.slider_horizontal_3,
                    size: 35,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: NeumorphicToggle(
                style: NeumorphicToggleStyle(
                  backgroundColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                selectedIndex: reportType ? 0 : 1,
                thumb: Center(
                  child: Container(),
                ),
                children: [
                  ToggleElement(
                    foreground: Center(child: Text('مرخصی ساعتی')),
                    background: Center(child: Text('مرخصی ساعتی')),
                  ),
                  ToggleElement(
                    foreground: Center(child: Text('مرخصی روزانه')),
                    background: Center(child: Text('مرخصی روزانه')),
                  ),
                ],
                onChanged: (value) {
                  print(value);
                  setState(() {
                    reportType = value == 1 ? true : false;
                  });
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                padding: EdgeInsets.only(bottom: 290),
                itemCount: 10 + 1,
                itemBuilder: (context, index) {
                  return ExpandablePanel(
                    theme: const ExpandableThemeData(
                      iconColor: Colors.grey,
                      iconSize: 30,
                      iconPadding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                    ),
                    header: ListTile(
                      leading: Icon(Icons.ac_unit_rounded),
                      title: reportType
                          ? Text('مرخصی ${index + 1} روزه')
                          : Text('مرخصی ${index + 2} ساعته'),
                      subtitle:
                          Text('12:4${index + 1} - 1402/02/0${index + 1}'),
                    ),
                    collapsed: Row(),
                    expanded: Row(
                      children: [
                        Text('اطلاعاتی موجود نیست !'),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
