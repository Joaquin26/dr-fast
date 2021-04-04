import 'package:dr_fast/core/home/patient/pages/findDoctor_page.dart';
import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

class CustomerServicePage extends StatefulWidget {
  static const String route = '/customer-service';
  CustomerServicePage({Key key}) : super(key: key);

  @override
  _CustomerServicePageState createState() => _CustomerServicePageState();
}

class _CustomerServicePageState extends State<CustomerServicePage> {
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
                          Row(children: <Widget>[
                            Container(
                                width: 280,
                                height: 120,
                                child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text(
                                      '¿Para quién será el \n servicio de atención?',
                                      style: TextStyle(
                                          fontSize: 35.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ))),
                            Image.asset('assets/img/symptom-2.png',
                                height: 100, width: 60),
                          ]),
                          Text(
                            'Podrás encontrar un especialista indicado',
                            style: TextStyle(
                                fontSize: 15.0, color: Color(0xff19adf3)),
                          ),
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
                flex: 1,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ListView(children: <Widget>[
                      Text(
                        'Paciente',
                        style: TextStyle(fontSize: 15.0, color: Colors.black),
                      ),
                      SizedBox(height: 10.0),
                      Row(children: <Widget>[
                        Text(
                          'Jessica H.',
                          style: TextStyle(
                              fontSize: 15.0, color: Color(0xff8dafcd)),
                        ),
                      ]),
                      SizedBox(height: 20.0),
                      Text(
                        'Descripción del sintoma',
                        style: TextStyle(fontSize: 15.0, color: Colors.black),
                      ),
                      TextFormField(
                        style:
                            TextStyle(fontSize: 15.0, color: Color(0xff8dafcd)),
                      )
                    ]))),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  children: <Widget>[
                    Text(
                      'Horario',
                      style:
                          TextStyle(fontSize: 15.0, color: Color(0xff19adf3)),
                    ),
                    SizedBox(height: 10.0),
                    Row(children: <Widget>[
                      ElevatedButton(
                          onPressed: _selectTime, child: Icon(Icons.timer)),
                      SizedBox(width: 20.0),
                      Text(_time.format(context))
                    ]),
                    SizedBox(height: 15.0),
                    Text(
                      'Métodos de pago',
                      style:
                          TextStyle(fontSize: 15.0, color: Color(0xff19adf3)),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(right: 200),
                        child: SelectFormField(
                          type:
                              SelectFormFieldType.dropdown, // or can be dialog
                          initialValue: 'efectivo',
                          items: paymentMethods,
                          onChanged: (val) => print(val),
                          onSaved: (val) => print(val),
                        )),
                    SizedBox(height: 150),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 100.0),
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
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          'Buscar',
          style: TextStyle(color: Colors.white, fontSize: 20.0),
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
}
