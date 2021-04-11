import 'package:dr_fast/core/home/patient/pages/findDoctor_page.dart';
import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

class ConfirmReservationPage extends StatefulWidget {
  static const String route = '/confirm-reservaton';
  ConfirmReservationPage({Key key}) : super(key: key);

  @override
  _ConfirmReservationPageState createState() => _ConfirmReservationPageState();
}

class _ConfirmReservationPageState extends State<ConfirmReservationPage> {
  final List<Map<String, dynamic>> paymentMethods = [
    {'value': 'efectivo', 'label': 'efectivo'}
  ];
  TimeOfDay _time = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                      color: Color(0xff0085fe),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: ListView(children: <Widget>[
                          SizedBox(height: 120.0),
                          Row(children: <Widget>[
                            Container(
                                width: 300,
                                height: 30,
                                child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text(
                                      'RESERVAR CITA MÉDICA A DOMICILIO',
                                      style: TextStyle(
                                          fontSize: 35.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ))),
                          ]),
                          SizedBox(height: 5.0),
                          const Divider(
                              height: 20,
                              thickness: 2,
                              indent: 140,
                              endIndent: 140,
                              color: Colors.white),
                        ])))),
            SizedBox(height: 20),
            Expanded(
                flex: 3,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ListView(children: <Widget>[
                      Text(
                        'Especialista de la Salud',
                        style:
                            TextStyle(fontSize: 15.0, color: Color(0xff90eaf7)),
                      ),
                      SizedBox(height: 10.0),
                      _doctor("Dr. Ernesto Torres"),
                      SizedBox(height: 10.0),
                      Text(
                        'Paciente',
                        style:
                            TextStyle(fontSize: 15.0, color: Color(0xff90eaf7)),
                      ),
                      SizedBox(height: 10.0),
                      Row(children: <Widget>[
                        Text(
                          'Jessica H.',
                          style: TextStyle(
                              fontSize: 15.0, color: Color(0xff8dafcd)),
                        ),
                      ]),
                    ]))),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  children: <Widget>[
                    Text(
                      'Horario',
                      style:
                          TextStyle(fontSize: 15.0, color: Color(0xff90eaf7)),
                    ),
                    SizedBox(height: 10.0),
                    Row(children: <Widget>[
                      ElevatedButton(
                          onPressed: _selectTime, child: Icon(Icons.timer)),
                      SizedBox(width: 20.0),
                      Text(_time.format(context)),
                      SizedBox(width: 50.0),
                      SizedBox(height: 40, child: VerticalDivider()),
                      SizedBox(width: 50.0),
                      Column(children: <Widget>[
                        Text("Hora de atención 18:45",
                            style: TextStyle(fontSize: 12.0)),
                        Text("Tiempo de espera\n30 MIN",
                            style: TextStyle(fontSize: 12.0)),
                      ]),
                    ]),
                    SizedBox(height: 15.0),
                    Text(
                      'Métodos de pago',
                      style:
                          TextStyle(fontSize: 15.0, color: Color(0xff90eaf7)),
                    ),
                    SizedBox(height: 5),
                    Row(children: <Widget>[
                      Container(
                          width: 120.0,
                          height: 20,
                          child: SelectFormField(
                            type: SelectFormFieldType
                                .dropdown, // or can be dialog
                            initialValue: 'efectivo',
                            items: paymentMethods,
                            onChanged: (val) => print(val),
                            onSaved: (val) => print(val),
                          )),
                      SizedBox(width: 50.0),
                      SizedBox(height: 20, width: 1, child: VerticalDivider()),
                      SizedBox(width: 50.0),
                      Text("Total",
                          style: TextStyle(
                              fontSize: 15.0, color: Color(0xff90eaf7))),
                      Text(".......S./ 30", style: TextStyle(fontSize: 15.0)),
                    ]),
                    SizedBox(height: 50),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 80.0),
                        child: _buildSearchButton())
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton _buildSearchButton() => ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color(0xff00b1ff), // background
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          'Confirmar Reserva',
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      ),
      onPressed: () async {
        Navigator.push(
            context,
            PageRouteBuilder(
                pageBuilder: (context, __, ___) => FindDoctorPage()));
      });

  void _selectTime() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  Container _doctor(String name) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 10,
              color: Colors.grey.withOpacity(.2),
            ),
            BoxShadow(
              offset: Offset(-3, 0),
              blurRadius: 15,
              color: Colors.grey.withOpacity(.1),
            )
          ],
        ),
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 100,
                        width: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(
                          "assets/img/doctor.png",
                          height: 100,
                          width: 50,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              "12 años de experiencia",
                              style: const TextStyle(fontSize: 12.0),
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0)),
                            Container(
                                decoration: BoxDecoration(
                                  color: Color(0xffc7dbf4),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 10.0),
                                    child: Text(
                                      'Medicina General',
                                      style: const TextStyle(
                                          fontSize: 12.0,
                                          color: Color(0xff639ae2)),
                                    ))),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: IconButton(
                            icon: const Icon(
                              Icons.calendar_today_rounded,
                              size: 24.0,
                            ),
                            onPressed: () {})),
                  ],
                ))));
  }
}
