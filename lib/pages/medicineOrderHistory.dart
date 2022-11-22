import 'package:flutter/material.dart';

class MedicineOrderHistory extends StatefulWidget {
  const MedicineOrderHistory({Key? key}) : super(key: key);

  @override
  State<MedicineOrderHistory> createState() => _MedicineOrderHistory();
}

class _MedicineOrderHistory extends State<MedicineOrderHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Historial de pedidos'),
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
                      Navigator.pushNamed(context, '/medicineDetail');
                    },
                    child: Column(
                      children: const <Widget>[
                        ListTile(
                          contentPadding: EdgeInsets.fromLTRB(20, 10, 25, 10),
                          title: Text('Acetaminofen'),
                          subtitle: Text(
                              'Fecha pedido: 27/10/2022 \nFecha entrega: 19/11/2022'),
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
                      Navigator.pushNamed(context, '/medicineDetail');
                    },
                    child: Column(
                      children: const <Widget>[
                        ListTile(
                          contentPadding: EdgeInsets.fromLTRB(20, 10, 25, 10),
                          title: Text('Ibuprofeno'),
                          subtitle: Text(
                              'Fecha pedido: 29/10/2022 \nFecha entrega: 15/11/2022'),
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
                      Navigator.pushNamed(context, '/medicineDetail');
                    },
                    child: Column(
                      children: const <Widget>[
                        ListTile(
                          contentPadding: EdgeInsets.fromLTRB(20, 10, 25, 10),
                          title: Text('Salbutamol'),
                          subtitle: Text(
                              'Fecha pedido: 26/10/2022 \nFecha entrega: 14/11/2022'),
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
                      Navigator.pushNamed(context, '/medicineDetail');
                    },
                    child: Column(
                      children: const <Widget>[
                        ListTile(
                          contentPadding: EdgeInsets.fromLTRB(20, 10, 25, 10),
                          title: Text('Amoxicilina'),
                          subtitle: Text(
                              'Fecha pedido: 19/10/2022 \nFecha entrega: 10/11/2022'),
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
