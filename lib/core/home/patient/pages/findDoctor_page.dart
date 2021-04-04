import 'package:dr_fast/widgets/rating_star.dart';
import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

class FindDoctorPage extends StatefulWidget {
  static const String route = '/find-doctor';
  FindDoctorPage({Key key}) : super(key: key);

  @override
  _FindDoctorPageState createState() => _FindDoctorPageState();
}

class _FindDoctorPageState extends State<FindDoctorPage> {
  final List<String> doctors = <String>[
    'Dr. Ernesto Torres',
    'Dr. Jorge Soyer',
    'Dr. Mario Puente',
    'Dr. Mario Puente',
  ];

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
                          SizedBox(height: 50.0),
                          _searchField(),
                          SizedBox(height: 5.0),
                          Text(
                            'Estas son tus citas médicas',
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
                flex: 3,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
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
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 18, vertical: 8),
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              height: 100,
                                              width: 55,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Image.asset(
                                                "assets/img/doctor.png",
                                                height: 100,
                                                width: 50,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    doctors[index],
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 18.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    "12 años de experiencia",
                                                    style: const TextStyle(
                                                        fontSize: 12.0),
                                                  ),
                                                  const Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 5.0)),
                                                  Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffc7dbf4),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5)),
                                                      ),
                                                      child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 5.0,
                                                                  horizontal:
                                                                      10.0),
                                                          child: Text(
                                                            'Medicina General',
                                                            style: const TextStyle(
                                                                fontSize: 12.0,
                                                                color: Color(
                                                                    0xff639ae2)),
                                                          ))),
                                                  const Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 5.0)),
                                                  RatingStar(
                                                    rating: 3.5,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          const Icon(
                                            Icons.more_vert,
                                            size: 16.0,
                                          ),
                                        ],
                                      ))));
                          // )ListTile(
                          //                               contentPadding: EdgeInsets.all(0),
                          //                               leading: ClipRRect(
                          //                                 borderRadius:
                          //                                     BorderRadius.all(Radius.circular(13)),
                          //                                 child: Container(
                          //                                   height: 55,
                          //                                   width: 55,
                          //                                   decoration: BoxDecoration(
                          //                                     borderRadius: BorderRadius.circular(15),
                          //                                   ),
                          //                                   child: Image.asset(
                          //                                     "assets/img/doctor.png",
                          //                                     height: 50,
                          //                                     width: 50,
                          //                                     fit: BoxFit.contain,
                          //                                   ),
                          //                                 ),
                          //                               ),
                          //                               title: Text(doctors[index]),
                          //                               subtitle: Text("Neurology"),
                          //                               trailing: Icon(
                          //                                 Icons.keyboard_arrow_right,
                          //                                 size: 30,
                          //                                 color: Theme.of(context).primaryColor,
                          //                               ),
                          //                             ),
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                        itemCount: doctors.length)))
          ],
        ),
      ),
    );
  }

  Widget _searchField() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(13)),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Busca doctores, especialidades...",
          icon: SizedBox(width: 50, child: Icon(Icons.search)),
        ),
      ),
    );
  }
}
