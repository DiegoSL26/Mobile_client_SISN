import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class RequestMedicine extends StatefulWidget {
  const RequestMedicine({Key? key}) : super(key: key);

  @override
  State<RequestMedicine> createState() => _RequestMedicine();
}

class _RequestMedicine extends State<RequestMedicine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Solicitar medicamento'),
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
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final List<String> items = [
    'Drogas Capital',
    'Cruz verde',
    'Farmatodo',
    'Droguerías Carulla',
    'Droguerías Colsubsidio',
    'Droguerías Olímpica',
    'Farmasanitas',
    'Droguerías Colsubsidio',
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
                child: Text('Sistema solicitud de medicamentos',
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
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nombre del medicamento',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Dosis (en mg) del medicamento',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
              child: DropdownButton2(
                isExpanded: true,
                hint: const Expanded(
                  child: Text(
                    'Seleccione el vendedor',
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
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                  ),
                  iconSize: 14,
                ),
                buttonStyleData: ButtonStyleData(
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey),
                    color: Colors.white,
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(height: 55),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey),
                        color: Colors.white),
                    scrollbarTheme: ScrollbarThemeData(
                      radius: const Radius.circular(5),
                      thickness: MaterialStateProperty.all<double>(6),
                      thumbVisibility: MaterialStateProperty.all<bool>(true),
                    )),
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Solicitar medicamento'),
                  onPressed: () {
                    if (nameController.text != '' &&
                        passwordController.text != '' &&
                        selectedValue != null) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Pedido creado con éxito!"),
                      ));
                      Navigator.pop(context);
                    }
                  },
                )),
          ],
        ));
  }
}
