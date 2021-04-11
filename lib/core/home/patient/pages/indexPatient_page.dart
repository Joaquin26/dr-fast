import 'package:dr_fast/core/medical_appointments/pages/medical_appointments_page.dart';
import 'package:dr_fast/core/record/pages/record_page.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'home_page.dart';

class IndexPatientPage extends StatefulWidget {
  static const String route = '/index-patient';

  @override
  _IndexPatientPageState createState() => _IndexPatientPageState();
}

class _IndexPatientPageState extends State<IndexPatientPage> {
  var pages = [HomePatientPage(), MedicalAppointmentPage(), RecordPage()];
  var currentIndex;
  var currentPage;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    currentPage = pages[currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage,
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  CurvedNavigationBar buildBottomNavigationBar() {
    Color iconsColor = Colors.white;
    Color primaryColor = Color(0xff1386fc);

    return CurvedNavigationBar(
      key: _bottomNavigationKey,
      backgroundColor: Colors.white10,
      color: primaryColor,
      height: 50.0,
      animationDuration: Duration(milliseconds: 300),
      items: <Widget>[
        Icon(
          Icons.home,
          color: iconsColor,
        ),
        Icon(
          Icons.calendar_today,
          color: iconsColor,
        ),
        Icon(
          Icons.paste_rounded,
          color: iconsColor,
        ),
        Icon(
          Icons.person,
          color: iconsColor,
        )
      ],
      index: currentIndex,
      onTap: (int index) {
        setState(() {
          currentIndex = index;
          currentPage = pages[currentIndex];
        });
      },
    );
  }
}
