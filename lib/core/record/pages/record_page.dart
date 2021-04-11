import 'package:dr_fast/core/home/patient/pages/customerService_page.dart';
import 'package:flutter/material.dart';

class RecordPage extends StatefulWidget {
  RecordPage({Key key}) : super(key: key);

  @override
  _RecordPageState createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
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
                            'Este es tu historial médico',
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
                        'Historiales médicos',
                        style:
                            TextStyle(fontSize: 15.0, color: Color(0xff38e3ff)),
                      ),
                      SizedBox(height: 20.0),
                      _taskComplete("Inflamación de garganta", "22/08/19"),
                      _taskComplete("Dolor de garganta", "09/01/20"),
                      _taskComplete("Intoxicación", "06/03/20"),
                      _taskComplete("Rinitis alérgica", "16/05/20"),
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

  Widget _taskComplete(String texto, String fecha) {
    return Container(
      foregroundDecoration: BoxDecoration(color: Color(0x60FDFDFD)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 12.0),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Icon(
                Icons.radio_button_checked,
                color: Theme.of(context).accentColor,
                size: 20,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 4,
              child: Text(
                texto,
                style: TextStyle(color: Colors.black),
              ),
            ),
            Expanded(
                flex: 2,
                child: Text(
                  fecha,
                  style: TextStyle(color: Color(0xffc3c3c3)),
                )),
          ],
        ),
      ),
    );
  }
}
