import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:http/http.dart' as http;

class MedicalAppointmentsRequest extends StatefulWidget {
  const MedicalAppointmentsRequest({Key? key}) : super(key: key);

  @override
  State<MedicalAppointmentsRequest> createState() =>
      _MedicalAppointmentsRequest();
}

class _MedicalAppointmentsRequest extends State<MedicalAppointmentsRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Solicitar cita médica'),
      ),
      body: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController serviceController = TextEditingController();
  TextEditingController documentController = TextEditingController();

  final url = Uri.parse("http://10.43.100.189:3000/gestor-citas/citas/crear");

  Future<bool> createMedicalAppointment() async {
    final now = DateTime.now();
    final medicalAppointmentInfo = {
      "Servicio": serviceController.text,
      "Autorizacion": 20,
      "fechaHoraCita": now.toIso8601String(),
      "tipoAgendamiento": selectedValue,
      "estado": "pendiente",
      "personaID": documentController.text,
    };
    final headers = {"Content-type": "application/json;charset=UTF-8"};
    final res = await http.post(url,
        headers: headers, body: jsonEncode(medicalAppointmentInfo));
    if (res.statusCode == 200) {
      final response = jsonDecode(res.body);
      return response['CitaCreada'];
    } else {
      return false;
    }
  }

  final List<String> items = [
    'General',
    'Prioritario',
    'No prioritario',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(
                    top: 50, bottom: 50, left: 10, right: 10),
                child: Text('Sistema agendamiento de citas',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      textStyle: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ))),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: serviceController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Servicio',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: documentController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Documento del paciente',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
              child: DropdownButton2(
                isExpanded: true,
                hint: const Expanded(
                  child: Text(
                    'Tipo de agendamiento',
                    style: TextStyle(),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                items: items
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value as String;
                  });
                },
                icon: const Icon(
                  Icons.arrow_forward_ios_outlined,
                ),
                iconSize: 14,
                buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                buttonDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey),
                  color: Colors.white,
                ),
                itemHeight: 55,
                dropdownMaxHeight: 200,
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey),
                  color: Colors.white,
                ),
                dropdownElevation: 0,
                scrollbarRadius: const Radius.circular(5),
                scrollbarThickness: 6,
                scrollbarAlwaysShow: true,
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Solicitar cita'),
                  onPressed: () {
                    createMedicalAppointment().then((bool value) {
                      setState(() {
                        if (serviceController.text != "" &&
                            documentController.text != "" &&
                            selectedValue != null) {
                          if (value) {
                            serviceController.clear();
                            documentController.clear();
                            selectedValue = null;
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Cita solicitada"),
                            ));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Error al solicitar la cita"),
                            ));
                          }
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Por favor complete los campos"),
                          ));
                        }
                      });
                    });
                  },
                )),
          ],
        ));
  }
}
