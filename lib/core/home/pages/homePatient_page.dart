import 'package:dr_fast/core/auth/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePatientPage extends StatefulWidget {
  static const String route = '/home-patient';

  @override
  _HomePatientPageState createState() => _HomePatientPageState();
}

class _HomePatientPageState extends State<HomePatientPage> {
  var pages = [LoginPage()];
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
      body: Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage(
                'assets/img/auth_background.jpg',
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(children: <Widget>[
            SizedBox(height: 20.0),
            SizedBox(height: 30.0),
          ])),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  CurvedNavigationBar buildBottomNavigationBar() {
    Color iconsColor = Colors.white;
    Color primaryColor = Colors.red;

    return CurvedNavigationBar(
      key: _bottomNavigationKey,
      backgroundColor: Colors.white10,
      color: primaryColor,
      height: 50.0,
      animationDuration: Duration(milliseconds: 300),
      items: <Widget>[
        Icon(
          Icons.share,
          color: iconsColor,
        ),
        Icon(
          Icons.book,
          color: iconsColor,
        ),
        Icon(
          Icons.person,
          color: iconsColor,
        )
      ],
      index: currentIndex,
      onTap: (int index) {
        // setState(() {
        //   currentIndex = index;
        //   currentPage = pages[currentIndex];
        // });
      },
    );
  }
}
