import 'package:dr_fast/core/auth/pages/doctorRegister.dart';
import 'package:dr_fast/core/home/patient/pages/customerService_page.dart';
import 'package:dr_fast/core/home/patient/pages/findDoctor_page.dart';
import 'package:flutter/material.dart';

import 'core/auth/pages/home_page.dart';
import 'core/auth/pages/login_page.dart';
import 'core/auth/pages/patientRegister.dart';
import 'core/auth/pages/userMode_pages.dart';
import 'core/home/patient/pages/indexPatient_page.dart';

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
        LoginPage.route: (context) => LoginPage(),
        IndexPatientPage.route: (context) => IndexPatientPage(),
        DoctorRegisterPage.route: (context) => DoctorRegisterPage(),
        CustomerServicePage.route: (context) => CustomerServicePage(),
        FindDoctorPage.route: (context) => FindDoctorPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
