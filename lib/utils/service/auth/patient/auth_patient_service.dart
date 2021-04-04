import 'dart:convert';
import 'package:dr_fast/constants/api_path.dart';
import 'package:http/http.dart' as http;

class AuthPatientService {
  AuthPatientService();

  static Future<String> register(
      String username,
      String password,
      String name,
      String lastName,
      String motherLastName,
      String dni,
      String email,
      String phone,
      String birthday,
      String district,
      String direction) async {
    var response = await http.post(
      '$BASE_URL/usuario/registroPaciente',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode(
        {
          'usuario': {
            'nombreUsuario': username,
            'password': password,
            'name': name,
            'apellidoPaterno': lastName,
            'apellidoMaterno': motherLastName,
            'dni': dni,
            'correo': email,
            'celular': phone,
            'birthday': birthday,
            'distrito': district,
            'direccion': direction
          },
        },
      ),
    );

    if (response.statusCode != 200) {
      throw Exception();
    }

    return response.body;
  }

  static Future<String> login(String username, String password) async {
    var response = await http.post(
      '$BASE_URL/api/auth/login',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode({'username': username, 'password': password}),
    );

    if (response.statusCode != 200) {
      throw Exception();
    }

    return response.body;
  }
}
