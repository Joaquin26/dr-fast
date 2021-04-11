class DoctorRegisterDTO {
  String email;
  String password;
  String name;
  String lastName;
  String motherLastName;
  String dni;
  String phone;
  String tuitonNumber;

  DoctorRegisterDTO(
      {this.email,
      this.password,
      this.name,
      this.lastName,
      this.motherLastName,
      this.dni,
      this.phone,
      this.tuitonNumber});

  Map<String, dynamic> toJson() => {
        'usuario': {
          'correo': email,
          'password': password,
          'nombre': name,
          'apellidoPaterno': lastName,
          'apellidoMaterno': motherLastName,
          'dni': dni,
          'celular': phone
        },
        'numeroColegiatura': tuitonNumber,
        "dniFoto": "-",
        "centroLabor": "-",
        "tarifa": "0",
        "especialidad": {"nombre": "medicina general"}
      };
}
