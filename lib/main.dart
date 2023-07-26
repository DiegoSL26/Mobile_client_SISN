import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_client/pages/home.dart';
import 'package:mobile_client/pages/medical_appointments_request.dart';
import 'package:mobile_client/pages/medical_appointment_detail.dart';
import 'package:mobile_client/pages/medical_history_detail.dart';
import 'package:mobile_client/pages/medicine_request.dart';
import 'package:mobile_client/pages/medicine_order_history.dart';
import 'package:mobile_client/pages/medicine_detail.dart';
import 'package:mobile_client/pages/search_clinical_history.dart';
import 'package:mobile_client/pages/search_medical_appointments.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mobile Client',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        home: const MyHomePage(title: 'Login'),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => const Home(),
          '/clinicalHistory': (BuildContext context) => const ClinicalHistory(),
          '/searchMedicalAppointments': (BuildContext context) =>
              const SearchMedicalAppointments(),
          '/requestMedicine': (BuildContext context) => const RequestMedicine(),
          '/medicineOrderHistory': (BuildContext context) =>
              const MedicineOrderHistory(),
          '/medicalAppointmentsRequest': (BuildContext context) =>
              const MedicalAppointmentsRequest(),
          '/medicalAppointmentDetail': (BuildContext context) =>
              const MedicalAppointmentDetail(),
          '/medicalHistoryDetail': (BuildContext context) =>
              const MedicalHistoryDetail(),
          '/medicineDetail': (BuildContext context) => const MedicineDetail(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  late String token;
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  final url = Uri.parse("http://10.43.100.176:3000/login");

  Future<String> login(String cc, String pass) async {
    final user = {"cedula": cc, "contrasenna": pass};
    final headers = {"Content-type": "application/json;charset=UTF-8"};
    final res = await http.post(url, headers: headers, body: jsonEncode(user));
    if (res.statusCode == 200) {
      final response = jsonDecode(res.body);
      return response['token'];
    } else {
      return "Failed";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(
                    top: 150, bottom: 50, left: 10, right: 10),
                child: Text('Sistema de interoperabilidad de salud nacional',
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
                controller: nameController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Cedula',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Contraseña',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: Text('¿Olvidó su contraseña?',
                  style: GoogleFonts.comfortaa(
                    textStyle: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  )),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Ingresar'),
                  onPressed: () {
                    login(nameController.text, passwordController.text)
                        .then((String value) {
                      setState(() {
                        String token = value;
                        if (token != "Failed") {
                          nameController.clear();
                          passwordController.clear();
                          Navigator.pushNamed(context, '/home',
                              arguments: <String, String>{'token': token});
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Error al iniciar sesión"),
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
