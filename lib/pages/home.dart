import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('Home'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(top: 70),
        child: Column(
          children: <Widget>[
            Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Icon(
                  Icons.account_box_rounded,
                  size: 200,
                )),
            Text('Bienvenido, Diego!',
                textAlign: TextAlign.center,
                style: GoogleFonts.comfortaa(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                )),
            Container(
                padding: const EdgeInsets.only(top: 60),
                child: const Column(
                  children: [
                    Text(
                      'Tipo de documento: C.C.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'No. de documento: 1111111111',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Edad: 20 años',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                )),
            Container(
                padding: const EdgeInsets.only(top: 100),
                child: SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text('Cerrar sesión'),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Sesión cerrada con éxito!"),
                      ));
                      Navigator.pop(context);
                    },
                  ),
                ))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        spacing: 15,
        spaceBetweenChildren: 15,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.manage_search),
            label: 'Consultar sus citas médicas',
            labelStyle: const TextStyle(fontSize: 18.0),
            onTap: () =>
                Navigator.pushNamed(context, '/searchMedicalAppointments'),
          ),
          SpeedDialChild(
            child: const Icon(Icons.medical_services_outlined),
            label: 'Pedidos de medicamentos',
            labelStyle: const TextStyle(fontSize: 18.0),
            onTap: () => Navigator.pushNamed(context, '/medicineOrderHistory'),
          ),
          SpeedDialChild(
            child: const Icon(Icons.content_paste_search),
            label: 'Consultar historial médico',
            labelStyle: const TextStyle(fontSize: 18.0),
            onTap: () => Navigator.pushNamed(context, '/clinicalHistory'),
          ),
          SpeedDialChild(
            child: const Icon(Icons.medication_outlined),
            label: 'Solicitar medicamento',
            labelStyle: const TextStyle(fontSize: 18.0),
            onTap: () => Navigator.pushNamed(context, '/requestMedicine'),
          ),
          SpeedDialChild(
            child: const Icon(Icons.medical_information_outlined),
            label: 'Solicitar cita medica',
            labelStyle: const TextStyle(fontSize: 18.0),
            onTap: () =>
                Navigator.pushNamed(context, '/medicalAppointmentsRequest'),
          ),
        ],
      ),
    );
  }
}
