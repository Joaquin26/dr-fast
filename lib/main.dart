import 'package:flutter/material.dart';

import 'core/auth/pages/home_page.dart';
import 'core/auth/pages/login_page.dart';
import 'core/auth/pages/patientRegister.dart';
import 'core/auth/pages/userMode_pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DoctorFast',
      initialRoute: HomePage.route,
      // routes: Routes.getRoute(),
      //   onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
      routes: {
        HomePage.route: (context) => HomePage(),
        UserModePage.route: (context) => UserModePage(),
        PatientRegisterPage.route: (context) => PatientRegisterPage(),
        LoginPage.route: (context) => LoginPage()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
