import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicalHistoryDetail extends StatefulWidget {
  const MedicalHistoryDetail({Key? key}) : super(key: key);

  @override
  State<MedicalHistoryDetail> createState() => _MedicalHistoryDetail();
}

class _MedicalHistoryDetail extends State<MedicalHistoryDetail> {
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
          ],
        ),
      ),
    );
  }
}
