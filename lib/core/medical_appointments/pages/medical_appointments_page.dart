import 'package:flutter/material.dart';

class MedicalAppointmentPage extends StatefulWidget {
  MedicalAppointmentPage({Key key}) : super(key: key);

  @override
  _MedicalAppointmentPageState createState() => _MedicalAppointmentPageState();
}

class _MedicalAppointmentPageState extends State<MedicalAppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
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
                          SizedBox(height: 10.0),
                          Text(
                            'Hola, \nJessica',
                            style: TextStyle(
                                fontSize: 35.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'Estas son tus citas médicas',
                            style: TextStyle(
                                fontSize: 15.0, color: Color(0xff19adf3)),
                          ),
                          SizedBox(height: 10.0),
                          const Divider(
                              height: 20,
                              thickness: 2,
                              indent: 140,
                              endIndent: 140,
                              color: Colors.white),
                        ])))),
            SizedBox(height: 20),
            Expanded(
                flex: 2,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ListView(children: <Widget>[
                      Text(
                        'Citas médicas',
                        style:
                            TextStyle(fontSize: 15.0, color: Color(0xff38e3ff)),
                      ),
                      SizedBox(height: 20.0),
                      _buildMedicalAppointment(),
                      SizedBox(height: 10.0),
                      _buildMedicalAppointment()
                    ]))),
            SizedBox(height: 20.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: ListView(
                  children: <Widget>[],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildMedicalAppointment() => Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
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
          padding: EdgeInsets.only(top: 8.0),
          child: Column(children: <Widget>[
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.person, size: 32.0),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "CO2 - Dolor de garganta",
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              "14/11/2020",
                              style: const TextStyle(fontSize: 10.0),
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0)),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: const Icon(
                        Icons.keyboard_arrow_up,
                        size: 24.0,
                      ),
                    )
                  ],
                )),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                decoration: BoxDecoration(color: Color(0xffe7e8ea)),
                child: Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Text(
                      'Se diagnostico que el paciente tenia la garganta inflamada y sentia dolor de oido...',
                      style: const TextStyle(
                          fontSize: 12.0, color: Color(0xff639ae2)),
                    ))),
          ])));
}
