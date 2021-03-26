import 'package:flutter/material.dart';

class PatientRegisterPage extends StatefulWidget {
  static const String route = '/patient-register';

  @override
  _PatientRegisterState createState() => _PatientRegisterState();
}

class _PatientRegisterState extends State<PatientRegisterPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const inputLeftPadding = 35.0;
    const inputRightPadding = 75.0;
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
                'img/doctorFast_logo.png',
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
                  'img/auth_background.jpg',
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(children: <Widget>[
              header,
              Padding(
                  padding: const EdgeInsets.only(left: 0, right: 150),
                  child: Text(
                    'Crear cuenta - Paciente',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xff1994f7),
                        letterSpacing: 1.2),
                  )),
              Padding(
                  padding: const EdgeInsets.only(
                      left: inputLeftPadding, right: inputRightPadding),
                  child: _buildInputTextField(usernameController, "Nombre")),
              Padding(
                  padding: const EdgeInsets.only(
                      left: inputLeftPadding, right: inputRightPadding),
                  child: _buildInputTextField(lastNameController, "Apellidos")),
              Padding(
                  padding: const EdgeInsets.only(
                      left: inputLeftPadding, right: inputRightPadding),
                  child: _buildInputTextField(
                      phoneController, "Número telefónico")),
              Padding(
                  padding: const EdgeInsets.only(
                      left: inputLeftPadding, right: inputRightPadding),
                  child: _buildInputTextField(
                      emailController, "Correo electrónico")),
              SizedBox(height: 20.0),
              _buildRegisterButton(),
              const Divider(
                  height: 20,
                  thickness: 5,
                  indent: 170,
                  endIndent: 170,
                  color: Color(0xffb7eda91)),
            ])));
  }

  TextField _buildInputTextField(
          TextEditingController controller, String hintText) =>
      TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff1994f7)),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff1994f7)),
          ),
        ),
        style: TextStyle(fontSize: 16.0, color: Colors.white),
        onChanged: (value) {},
      );

  ElevatedButton _buildRegisterButton() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xffb7eda91), // background
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            'Registrar',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        onPressed: () async {},
      );
}
