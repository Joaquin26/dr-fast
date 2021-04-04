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
  TextEditingController usernameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController directionController = TextEditingController();
  String birthdayController = "";
  TextEditingController dniController = TextEditingController();
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
                      'assets/img/auth_background.jpg',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      header,
                      Padding(
                          padding: const EdgeInsets.only(left: 32, right: 0),
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
                          child: _buildInputTextField(
                              usernameController, "Nombre de usuario", false)),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: inputLeftPadding, right: inputRightPadding),
                          child: _buildInputTextField(
                              passwordController, "Contraseña", true)),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: inputLeftPadding, right: inputRightPadding),
                          child: _buildInputTextField(
                              nameController, "Nombre", false)),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: inputLeftPadding, right: inputRightPadding),
                          child: _buildInputTextField(
                              lastNameController, "Apellidos", false)),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: inputLeftPadding, right: inputRightPadding),
                          child: _buildInputTextField(
                              dniController, "DNI", false)),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: inputLeftPadding, right: inputRightPadding),
                          child: _buildInputTextField(
                              emailController, "Correo electrónico", false)),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: inputLeftPadding, right: inputRightPadding),
                          child: _buildInputTextField(
                              phoneController, "Número telefónico", false)),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: inputLeftPadding, right: inputRightPadding),
                        child: DateTimeField(
                          format: DateFormat("yyyy-MM-dd"),
                          decoration:
                              InputDecoration(labelText: 'Fecha de nacimiento'),
                          onChanged: (value) {
                            birthdayController = value.toString();
                          },
                          onShowPicker: (context, currentValue) {
                            return showDatePicker(
                                context: context,
                                firstDate: DateTime(1900),
                                initialDate: currentValue ?? DateTime.now(),
                                lastDate: DateTime(2100));
                          },
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: inputLeftPadding, right: inputRightPadding),
                          child: _buildInputTextField(
                              districtController, "Distrito", false)),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: inputLeftPadding, right: inputRightPadding),
                          child: _buildInputTextField(
                              directionController, "Dirección", false)),
                      SizedBox(height: 20.0),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: inputLeftPadding + 85),
                          child: _buildRegisterButton()),
                      const Divider(
                          height: 20,
                          thickness: 5,
                          indent: 170,
                          endIndent: 170,
                          color: Color(0xffb7eda91)),
                    ]))));
  }

  TextField _buildInputTextField(
          TextEditingController controller, String hintText, bool obscure) =>
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
        obscureText: obscure,
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
        onPressed: () async {
          try {
            var username = usernameController.text;
            var password = passwordController.text;
            var name = nameController.text;
            var lastName = lastNameController.text;
            var dni = dniController.text;
            var email = emailController.text;
            var phone = phoneController.text;
            var birthday = birthdayController;
            var district = districtController.text;
            var direction = directionController.text;
            var surnames = lastName.split(" ");

            await AuthPatientService.register(
                username,
                password,
                name,
                surnames[0],
                surnames[1],
                dni,
                email,
                phone,
                birthday,
                district,
                direction);

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
}
