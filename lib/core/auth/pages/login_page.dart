import 'package:dr_fast/core/home/patient/pages/indexPatient_page.dart';
import 'package:dr_fast/utils/service/auth/doctor/auth_doctor_service.dart';
import 'package:dr_fast/utils/service/auth/patient/auth_patient_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const String route = '/login';
  final String option;

  LoginPage({this.option});

  @override
  _LoginPageState createState() => _LoginPageState(option: this.option);
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String usernameErrorText;
  final _formKey = GlobalKey<FormState>();

  String option;
  _LoginPageState({this.option});

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
              _formLogin(),
              SizedBox(height: 60.0),
              GestureDetector(
                  child: Text(
                    '¿NECESITAS AYUDA?',
                    style: TextStyle(fontSize: 12.0, color: Colors.white),
                  ),
                  onTap: () {}),
              SizedBox(height: 20.0),
              const Divider(
                  height: 20,
                  thickness: 5,
                  indent: 170,
                  endIndent: 170,
                  color: Color(0xffb7eda91)),
            ])));
  }

  Form _formLogin() {
    const inputHorizontalPadding = 100.0;
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          Text(
            'USUARIO',
            style: TextStyle(
                fontSize: 16.0, color: Colors.white, letterSpacing: 1.2),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: inputHorizontalPadding),
              child: _buildUsernameTextField(emailValidator)),
          SizedBox(height: 20.0),
          Text(
            'PASSWORD',
            style: TextStyle(
                fontSize: 16.0, color: Colors.white, letterSpacing: 1.2),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: inputHorizontalPadding),
            child: _buildPasswordTextField(passwordValidator),
          ),
          SizedBox(height: 20.0),
          _buildLoginButton(option),
        ]));
  }

  TextFormField _buildUsernameTextField(Function validator) => TextFormField(
      controller: usernameController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        fillColor: Color(0xff454545),
        filled: true,
        contentPadding: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff454545)),
          borderRadius: const BorderRadius.all(
            const Radius.circular(50.0),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff454545)),
          borderRadius: const BorderRadius.all(
            const Radius.circular(50.0),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff454545)),
          borderRadius: const BorderRadius.all(
            const Radius.circular(50.0),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff454545)),
          borderRadius: const BorderRadius.all(
            const Radius.circular(50.0),
          ),
        ),
      ),
      style: TextStyle(
        fontSize: 16.0,
        color: Colors.white,
      ),
      validator: validator);

  TextFormField _buildPasswordTextField(Function validator) => TextFormField(
        controller: passwordController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          fillColor: Color(0xff454545),
          filled: true,
          contentPadding: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff454545)),
            borderRadius: const BorderRadius.all(
              const Radius.circular(50.0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff454545)),
            borderRadius: const BorderRadius.all(
              const Radius.circular(50.0),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff454545)),
            borderRadius: const BorderRadius.all(
              const Radius.circular(50.0),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff454545)),
            borderRadius: const BorderRadius.all(
              const Radius.circular(50.0),
            ),
          ),
        ),
        obscureText: true,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
      );

  ElevatedButton _buildLoginButton(String option) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xffb7eda91), // background
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            'Inicia sesión',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        onPressed: () async {
          try {
            if (!_formKey.currentState.validate()) return;
            var username = usernameController.text.trim();
            var password = passwordController.text.trim();

            if (option == "Patient") {
              await AuthPatientService.login(username, password);
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, __, ___) => IndexPatientPage()));
            } else {
              await AuthDoctorService.login(username, password);
            }
          } catch (e) {
            showSnackBar(context, 'Hubo un error al iniciar sesión');
          }
        },
      );

  void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  //Validators
  String emailValidator(String value) {
    if (value.isEmpty) return "Este campo es requerido";

    RegExp regExp = RegExp(r"^.*@.*$", multiLine: false);
    if (!regExp.hasMatch(value)) return "Debe llevar el @";
    return null;
  }

  String passwordValidator(String value) {
    if (value.isEmpty) return "Este campo es requerido";

    RegExp regExp = RegExp(r"^[a-zA-Z0-9]{1,10}$", multiLine: false);
    if (!regExp.hasMatch(value))
      return "Debe ser menor a 10 caracteres alfanuméricos";
    return null;
  }
}
