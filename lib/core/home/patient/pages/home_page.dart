import 'package:dr_fast/core/home/patient/pages/customerService_page.dart';
import 'package:flutter/material.dart';

class HomePatientPage extends StatefulWidget {
  HomePatientPage({Key key}) : super(key: key);

  @override
  _HomePatientPageState createState() => _HomePatientPageState();
}

class _HomePatientPageState extends State<HomePatientPage> {
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
                            'Te ayudaremos a que elijas la mejor opción',
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
                        'Categorias',
                        style:
                            TextStyle(fontSize: 15.0, color: Color(0xff38e3ff)),
                      ),
                      SizedBox(height: 20.0),
                      Row(children: <Widget>[
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: _buildCategoryButton(
                                'Sintomas', 'symptom.png', Color(0xfff38e3ff))),
                        _buildCategoryButton(
                            'Especialidad', 'specialty.png', Color(0xffffd300))
                      ]),
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

  GestureDetector _buildCategoryButton(
          String category, String asset, Color color) =>
      GestureDetector(
          onTap: () {
            if (category == "Especialidad")
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, __, ___) =>
                          CustomerServicePage()));
          },
          child: Container(
              height: 70,
              width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: color,
              ),
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20.0, horizontal: 5),
                  child: Row(children: <Widget>[
                    Image.asset('assets/img/' + asset, height: 50, width: 45),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          category,
                          style: TextStyle(fontSize: 15.0, color: Colors.white),
                        )),
                  ]))));
}
