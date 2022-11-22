import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicineDetail extends StatefulWidget {
  const MedicineDetail({Key? key}) : super(key: key);

  @override
  State<MedicineDetail> createState() => _MedicineDetail();
}

class _MedicineDetail extends State<MedicineDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Detalle del pedido'),
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 20),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 5,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(children: [
                          Container(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Text('Acetaminofen 500 mg',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.comfortaa(
                                  textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                  ),
                                )),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 40),
                            child: Column(
                              children: [
                                Text(
                                    'Fecha pedido: 27/10/2020 \nVendedor: Droguería cruz verde \nEntrega en: Carrera 15 #70-26 \nHora del pedido: 09:27 a.m.',
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
                                    Icons.medical_services_outlined,
                                    size: 150,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                        'No olvide que el encargado \ndel envío solo entregará el producto \n a la persona que lo solicitó. \nSi no puede recibir el medica- \nmento, asegurese de notificarlo con \n antelación.',
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
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: 335,
                  height: 50,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text('Cancelar pedido'),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Pedido cancelado con éxito!"),
                      ));
                      Navigator.pop(context);
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
