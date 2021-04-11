import 'package:dr_fast/core/auth/models/patient_register_dto.dart';
import 'package:dr_fast/utils/service/auth/patient/auth_patient_service.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class PatientRegisterPage extends StatefulWidget {
  static const String route = '/patient-register';

  @override
  _PatientRegisterState createState() => _PatientRegisterState();
}

class _PatientRegisterState extends State<PatientRegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dniController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var header = Stack(children: <Widget>[
      Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 32.0),
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
        body: SingleChildScrollView(
            child: Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage(
                      'assets/img/auth_background.jpeg',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      header,
                      Padding(
                          padding: const EdgeInsets.only(left: 50, right: 0),
                          child: Text(
                            'Crear cuenta - Paciente',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Color(0xff454545),
                                letterSpacing: 1.2),
                          )),
                      SizedBox(height: 10.0),
                      _formPatientRegister(),
                    ]))));
  }

  Form _formPatientRegister() {
    const inputLeftPadding = 35.0;
    const inputRightPadding = 75.0;
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(
                  left: inputLeftPadding, right: inputRightPadding),
              child: _buildInputTextField(emailController, "Correo electrónico",
                  false, emailValidator)),
          SizedBox(height: 10.0),
          Padding(
              padding: const EdgeInsets.only(
                  left: inputLeftPadding, right: inputRightPadding),
              child: _buildInputTextField(
                  passwordController, "Contraseña", true, passwordValidator)),
          SizedBox(height: 10.0),
          Padding(
              padding: const EdgeInsets.only(
                  left: inputLeftPadding, right: inputRightPadding),
              child: _buildInputTextField(
                  nameController, "Nombre", false, nameValidator)),
          SizedBox(height: 10.0),
          Padding(
              padding: const EdgeInsets.only(
                  left: inputLeftPadding, right: inputRightPadding),
              child: _buildInputTextField(
                  lastNameController, "Apellidos", false, lastNameValidator)),
          SizedBox(height: 10.0),
          Padding(
              padding: const EdgeInsets.only(
                  left: inputLeftPadding, right: inputRightPadding),
              child: _buildInputTextField(
                  dniController, "DNI", false, dniValidator)),
          SizedBox(height: 10.0),
          Padding(
              padding: const EdgeInsets.only(
                  left: inputLeftPadding, right: inputRightPadding),
              child: _buildInputTextField(
                  phoneController, "Número telefónico", false, phoneValidator)),
          SizedBox(height: 40.0),
          _buildRegisterButton(),
          const Divider(
              height: 20,
              thickness: 5,
              indent: 170,
              endIndent: 170,
              color: Color(0xffb7eda91))
        ]));
  }

  TextFormField _buildInputTextField(TextEditingController controller,
          String hintText, bool obscure, Function validator) =>
      TextFormField(
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 16.0, color: Color(0xff454545)),
            fillColor: Colors.white,
            filled: true,
            contentPadding: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
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
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff5475b2)),
              borderRadius: const BorderRadius.all(
                const Radius.circular(50.0),
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff5475b2)),
              borderRadius: const BorderRadius.all(
                const Radius.circular(50.0),
              ),
            ),
          ),
          obscureText: obscure,
          style: TextStyle(fontSize: 16.0, color: Color(0xff454545)),
          validator: validator);

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
        onPressed: () async {
          try {
            if (!_formKey.currentState.validate()) return;
            var surnames = lastNameController.text.split(" ");
            final patientRegisterDTO = PatientRegisterDTO(
                email: emailController.text,
                password: passwordController.text,
                name: nameController.text,
                lastName: surnames[0],
                motherLastName: surnames[1],
                dni: dniController.text,
                phone: phoneController.text);

            await AuthPatientService.register(patientRegisterDTO);

            showSuccessAlert(context);
          } catch (e) {
            showSnackBar(context, 'Hubo un error al registrarse');
          }
        },
      );

  void showSuccessAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('🎉 Bienvenido! 🎉', textAlign: TextAlign.center),
        content: Text('Se registro exitosamente', textAlign: TextAlign.center),
        actions: <Widget>[
          TextButton(
            child: Text('Aceptar'),
            onPressed: () {
              // Para cerrar el dialog
              Navigator.of(context).pop();
              // Para salir de la pantalla de registro
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

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

  String nameValidator(String value) {
    if (value.isEmpty) return "Este campo es requerido";

    RegExp regExp = RegExp(r"^[a-zA-Z]{1,15}$", multiLine: false);
    if (!regExp.hasMatch(value))
      return "Debe ser menor a 15 caracteres alfabéticos";
    return null;
  }

  String lastNameValidator(String value) {
    if (value.isEmpty) return "Este campo es requerido";
    var surnames = value.split(" ");
    if (surnames.length != 2) return "Debe ingresar sus dos apellidos";

    RegExp regExp = RegExp(r"^[a-zA-Z]{1,20}$", multiLine: false);
    var newValue = value.split(" ").join("");
    if (!regExp.hasMatch(newValue))
      return "Debe ser menor a 20 caracteres alfabéticos";
    return null;
  }

  String dniValidator(String value) {
    if (value.isEmpty) return "Este campo es requerido";

    RegExp regExp = RegExp(r"^[0-9]{8}$", multiLine: false);
    if (!regExp.hasMatch(value)) return "Debe tener 8 dígitos númericos";
    return null;
  }

  String phoneValidator(String value) {
    if (value.isEmpty) return "Este campo es requerido";

    RegExp regExp = RegExp(r"^[0-9]{9}$", multiLine: false);
    if (!regExp.hasMatch(value)) return "Debe tener 9 dígitos númericos";
    return null;
  }
}
