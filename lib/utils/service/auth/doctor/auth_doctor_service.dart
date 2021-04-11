import 'dart:convert';
import 'package:dr_fast/constants/api_path.dart';
import 'package:dr_fast/core/auth/models/doctor_register_dto.dart';
import 'package:http/http.dart' as http;

class AuthDoctorService {
  AuthDoctorService();

  static Future<String> register(DoctorRegisterDTO data) async {
    var response = await http.post('$BASE_URL/usuario/registroDoctor',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode(data.toJson()));

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
