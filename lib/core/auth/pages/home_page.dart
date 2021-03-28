import 'package:dr_fast/core/auth/pages/userMode_pages.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String route = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var header = Stack(children: <Widget>[
      Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 90.0),
            Container(
              width: 230.0,
              height: 230.0,
              child: Image.asset(
                'assets/img/doctorFast_logo.png',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      )
    ]);
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
              header,
              SizedBox(height: 20.0),
              _buildLoginButton(),
              SizedBox(height: 30.0),
              _buildRegisterButton(),
            ])));
  }

  ElevatedButton _buildLoginButton() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xffb7eda91), // background
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 10),
          child: Text(
            'Inicia sesión',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        onPressed: () {
          Navigator.push(
              context,
              PageRouteBuilder(
                  pageBuilder: (context, __, ___) =>
                      UserModePage(option: "login")));
          // MaterialPageRoute(
          //     builder: (context) => UserModePage(option: "login")));
        },
      );

  ElevatedButton _buildRegisterButton() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent.withOpacity(0),
          elevation: 0,
          side: BorderSide(color: Color(0xff84b4fd), width: 3.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            'Registrate',
            style: TextStyle(color: Color(0xffb7eda91), fontSize: 20.0),
          ),
        ),
        onPressed: () {
          Navigator.push(
              context,
              PageRouteBuilder(
                  pageBuilder: (context, __, ___) =>
                      UserModePage(option: "register")));
        },
      );
}
