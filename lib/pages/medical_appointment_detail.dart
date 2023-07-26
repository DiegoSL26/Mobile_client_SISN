import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class MedicalAppointmentDetail extends StatefulWidget {
  const MedicalAppointmentDetail({Key? key}) : super(key: key);

  @override
  State<MedicalAppointmentDetail> createState() => _MedicalAppointmentDetail();
}

class _MedicalAppointmentDetail extends State<MedicalAppointmentDetail> {
  String unparsedUrl = "http://10.43.100.189:3000/gestor-citas/citas/eliminar";

  Future<bool> deleteMedicalAppointment(String medicalAppointmentId) async {
    unparsedUrl = unparsedUrl + medicalAppointmentId;
    final url = Uri.parse(unparsedUrl);
    final res = await http.delete(url);
    if (res.statusCode == 200) {
      final response = jsonDecode(res.body);
      return response['CitaEliminada'];
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Detalle de cita'),
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 5,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(children: [
                          Text('Control de oftalmología',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.comfortaa(
                                textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                ),
                              )),
                          Container(
                            padding: const EdgeInsets.only(top: 40),
                            child: Column(
                              children: [
                                Text(
                                    'Fecha: 27/10/2020 \nMédico: Natalia Díaz Montenegro \nDirección: Carrera 15 #70-26 \nHora: 11:15 a.m. \nLugar: Clínica Colombia',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.comfortaa(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    )),
                                Container(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  child: const Icon(
                                    Icons.content_paste_search,
                                    size: 150,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                        'No olvide estar mínimo 15 minutos \nantes de la consulta para evitar \ninconvenientes',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.comfortaa(
                                          textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                          ),
                                        )),
                                  ],
                                )
                              ],
                            ),
                          )
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: 335,
                  height: 50,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text('Cancelar cita'),
                    onPressed: () {
                      String medicalAppointmentId = "?id=replace";
                      deleteMedicalAppointment(medicalAppointmentId)
                          .then((bool value) {
                        setState(() {
                          if (value) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Cita cancelada con éxito!"),
                            ));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Error al cancelar la cita"),
                            ));
                          }
                        });
                      });
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
