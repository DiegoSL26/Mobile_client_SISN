import 'package:flutter/material.dart';

class SearchMedicalAppointments extends StatefulWidget {
  const SearchMedicalAppointments({Key? key}) : super(key: key);

  @override
  State<SearchMedicalAppointments> createState() =>
      _SearchMedicalAppointments();
}

class _SearchMedicalAppointments extends State<SearchMedicalAppointments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Citas médicas'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 30),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 5,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/medicalAppointmentDetail');
                    },
                    child: const Column(
                      children: <Widget>[
                        ListTile(
                          contentPadding: EdgeInsets.fromLTRB(20, 10, 25, 10),
                          title: Text('Control de oftalmología'),
                          subtitle: Text(
                              'Fecha: 27/10/2022 \nMédico: Natalia Díaz Montenegro'),
                          leading: Icon(
                            Icons.medical_services_outlined,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  )),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 5,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/medicalAppointmentDetail');
                    },
                    child: const Column(
                      children: <Widget>[
                        ListTile(
                          contentPadding: EdgeInsets.fromLTRB(20, 10, 25, 10),
                          title: Text('Control General'),
                          subtitle: Text(
                              'Fecha: 02/12/2022 \nMédico: Juan Camilo Sosa Rivera'),
                          leading: Icon(
                            Icons.medical_services_outlined,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  )),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 5,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/medicalAppointmentDetail');
                    },
                    child: const Column(
                      children: <Widget>[
                        ListTile(
                          contentPadding: EdgeInsets.fromLTRB(20, 10, 25, 10),
                          title: Text('Ortopedista'),
                          subtitle: Text(
                              'Fecha: 15/01/2023 \nMédico: Nicolas Ovalle Peña'),
                          leading: Icon(
                            Icons.medical_services_outlined,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  )),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 5,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/medicalAppointmentDetail');
                    },
                    child: const Column(
                      children: <Widget>[
                        ListTile(
                          contentPadding: EdgeInsets.fromLTRB(20, 10, 25, 10),
                          title: Text('Otorrinolaringólogo'),
                          subtitle: Text(
                              'Fecha: 19/02/2023 \nMédico: Jaime Montero Rivera'),
                          leading: Icon(
                            Icons.medical_services_outlined,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
