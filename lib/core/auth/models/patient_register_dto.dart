class PatientRegisterDTO {
  String email;
  String password;
  String name;
  String lastName;
  String motherLastName;
  String dni;
  String phone;

  PatientRegisterDTO(
      {this.email,
      this.password,
      this.name,
      this.lastName,
      this.motherLastName,
      this.dni,
      this.phone});

  Map<String, dynamic> toJson() => {
        'usuario': {
          'correo': email,
          'password': password,
          'nombre': name,
          'apellidoPaterno': lastName,
          'apellidoMaterno': motherLastName,
          'dni': dni,
          'celular': phone
        }
      };
}
