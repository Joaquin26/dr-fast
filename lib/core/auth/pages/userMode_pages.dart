import 'package:dr_fast/core/auth/pages/doctorRegister.dart';
import 'package:dr_fast/core/auth/pages/patientRegister.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class UserModePage extends StatefulWidget {
  final String option;
  static const String route = '/user-mode';

  UserModePage({this.option});

  @override
  _UserModePageState createState() => _UserModePageState(option: this.option);
}

class _UserModePageState extends State<UserModePage> {
  String option;
  _UserModePageState({this.option});

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
                  'assets/img/auth_background.jpeg',
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(children: <Widget>[
              header,
              Text(
                'Eligir el modo de usuario',
                style: TextStyle(
                    fontSize: 16.0, color: Colors.black, letterSpacing: 1.2),
              ),
              SizedBox(height: 20.0),
              _buildPatientButton(option),
              SizedBox(height: 30.0),
              _buildDoctorButton(option),
              SizedBox(height: 151.0),
              const Divider(
                  height: 20,
                  thickness: 5,
                  indent: 170,
                  endIndent: 170,
                  color: Color(0xffb7eda91)),
            ])));
  }

  ElevatedButton _buildPatientButton(String option) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xffb7eda91), // background
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 10),
          child: Text(
            'Paciente',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        onPressed: () {
          if (option == "login")
            Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, __, ___) => LoginPage(option: "Patient")));
          else
            Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, __, ___) => PatientRegisterPage()));
        },
      );

  ElevatedButton _buildDoctorButton(String option) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xffb818ad7),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            'Doctor',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        onPressed: () {
          if (option == "login")
            Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, __, ___) => LoginPage(option: "Doctor")));
          else
            Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, __, ___) => DoctorRegisterPage()));
        },
      );
}
