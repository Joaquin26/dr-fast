import 'package:dr_fast/widgets/rating_star.dart';
import 'package:flutter/material.dart';

import 'confirm_reservation_page.dart';

class DetailPage extends StatefulWidget {
  static const String route = '/detail-doctor';
  DetailPage({Key key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
  }

  Widget _appbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        BackButton(color: Theme.of(context).primaryColor),
        IconButton(
            icon: Icon(
              Icons.more_horiz,
              color: Colors.grey,
            ),
            onPressed: () {})
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            Image.asset("assets/img/doctor.png"),
            DraggableScrollableSheet(
              maxChildSize: .8,
              initialChildSize: .6,
              minChildSize: .6,
              builder: (context, scrollController) {
                return Container(
                  padding: EdgeInsets.only(
                      left: 19,
                      right: 19,
                      top: 16), //symmetric(horizontal: 19, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Dr. Ernesto Torres",
                                style: TextStyle(color: Color(0xff62ace3)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.check_circle,
                                  size: 18,
                                  color: Theme.of(context).primaryColor),
                              Spacer(),
                              RatingStar(
                                rating: 3.5,
                              )
                            ],
                          ),
                          subtitle: Text(
                            "Medicina General",
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _buildDetail("47", "Años"),
                            SizedBox(width: 20),
                            _buildDetail("1000+", "Pacientes"),
                            SizedBox(width: 20),
                            _buildDetail("12 años", "experiencia")
                          ],
                        ),
                        SizedBox(height: 20),
                        Text("Resumen"),
                        SizedBox(height: 5),
                        Text(
                          "Médico con amplia experiencia en atención ambulatoria, reconocido tres veces por el hospital Casimiro Ulloa, por operaciones y proyectos exitosos.",
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          height: 35,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xfff4f4f6),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      pageBuilder: (context, __, ___) =>
                                          ConfirmReservationPage()));
                            },
                            child: Text(
                              "Reservar Cita a domicilio",
                              style: TextStyle(
                                  color: Color(0xff62ace3), fontSize: 20),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            _appbar(),
          ],
        ),
      ),
    );
  }

  Container _buildDetail(String data, String measure) => Container(
      width: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color(0xff0b92fb),
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5),
          child: Column(children: <Widget>[
            Text(
              data,
              style: TextStyle(fontSize: 12.0, color: Colors.white),
            ),
            Text(
              measure,
              style: TextStyle(fontSize: 12.0, color: Colors.white),
            ),
          ])));
}
