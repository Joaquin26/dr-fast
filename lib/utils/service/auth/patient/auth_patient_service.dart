import 'dart:convert';
import 'package:dr_fast/constants/api_path.dart';
import 'package:dr_fast/core/auth/models/patient_register_dto.dart';
import 'package:http/http.dart' as http;

import '../auth_shared_preferences.dart';

class AuthPatientService {
  AuthPatientService();

  static Future<String> register(PatientRegisterDTO data) async {
    var response = await http.post('$BASE_URL/usuario/registroPaciente',
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

    final Map parsed = json.decode(response.body);
    await AuthSharedPreferences.saveUserToken(parsed['token']);

    return response.body;
  }
}
