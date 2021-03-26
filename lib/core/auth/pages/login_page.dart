import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const String route = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String usernameErrorText;

  @override
  Widget build(BuildContext context) {
    const inputHorizontalPadding = 100.0;
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
              Text(
                'USUARIO',
                style: TextStyle(
                    fontSize: 16.0, color: Colors.white, letterSpacing: 1.2),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: inputHorizontalPadding),
                  child: _buildUsernameTextField()),
              SizedBox(height: 20.0),
              Text(
                'PASSWORD',
                style: TextStyle(
                    fontSize: 16.0, color: Colors.white, letterSpacing: 1.2),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: inputHorizontalPadding),
                child: _buildPasswordTextField(),
              ),
              SizedBox(height: 20.0),
              _buildLoginButton(),
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

  TextField _buildUsernameTextField() => TextField(
        controller: usernameController,
        decoration: InputDecoration(
          fillColor: Color(0xff5475b2),
          filled: true,
          contentPadding: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          errorText: usernameErrorText,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff5475b2)),
            borderRadius: const BorderRadius.all(
              const Radius.circular(50.0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff5475b2)),
            borderRadius: const BorderRadius.all(
              const Radius.circular(50.0),
            ),
          ),
        ),
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
        onChanged: (value) {},
      );

  TextField _buildPasswordTextField() => TextField(
        controller: passwordController,
        decoration: InputDecoration(
          fillColor: Color(0xff5475b2),
          filled: true,
          contentPadding: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff5475b2)),
            borderRadius: const BorderRadius.all(
              const Radius.circular(50.0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff5475b2)),
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

  ElevatedButton _buildLoginButton() => ElevatedButton(
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
          var username = usernameController.text.trim();
          var password = passwordController.text.trim();
        },
      );
}
