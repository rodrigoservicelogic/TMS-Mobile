import 'package:flutter/material.dart';
import 'package:tms_mobile/widgets/dateTimePicker.dart';
import 'package:tms_mobile/widgets/drawer.dart';

import '../../global.dart';
import 'frota-propria-resultado.dart';

class FiltroFrotaPropria extends StatefulWidget {
  final PageController pageController;

  FiltroFrotaPropria(this.pageController);
  @override
  _FiltroFrotaPropriaState createState() => _FiltroFrotaPropriaState();
}

class _FiltroFrotaPropriaState extends State<FiltroFrotaPropria> {
  DateTime _dataInicial, _dataFinal;
  List<String> _motoristas = [
    'Unidade 1',
    'Unidade 2',
    'Unidade 3',
    'Unidade 4'
  ];
  String _selectedMotorista;
  List<String> _placas = ['Frete 1', 'Frete 2', 'Frete 3', 'Frete 4'];
  String _selectedPlaca;

  String dropdownValue = '';

  @override
  void initState() {
    super.initState();

    _dataInicial = DateTime.now();
    _dataFinal = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: DrawerPage(widget.pageController),
      appBar: AppBar(
        centerTitle: true,
        title: Text("RESULTADOS"),
        leading: Center(
          child: Image.asset(
            "images/icon_resultados.png",
            width: 45,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Color.fromRGBO(39, 74, 139, 1),
                Color.fromRGBO(110, 170, 211, 1)
              ])),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 60,
              width: double.infinity,
              child: Container(
                color: Color(COR_PRIMARY),
                child: Center(
                  child: Text(
                    "RESULTADO - FROTA PRÓPRIA",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: DateTimePicker(
                    labelText: "De:",
                    valueStyle: TextStyle(color: Colors.red),
                    selectedDate: _dataInicial,
                    selectDate: (DateTime date) {
                      print(date);
                      setState(() {
                        _dataInicial = date;
                      });
                    },
                  ),
                ),
                Container(
                  width: 15,
                ),
                Expanded(
                  flex: 4,
                  child: DateTimePicker(
                    labelText: "Até:",
                    valueStyle: TextStyle(color: Colors.red),
                    selectedDate: _dataInicial,
                    selectDate: (DateTime date) {
                      print(date);
                      setState(() {
                        _dataInicial = date;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 13,
            ),
            DropdownButton(
              hint: Text('Por Motorista'),
              value: _selectedMotorista,
              isExpanded: true,
              onChanged: (newValue) {
                setState(() {
                  _selectedMotorista = newValue;
                });
              },
              items: _motoristas.map((motorista) {
                return DropdownMenuItem(
                  child: new Text(motorista),
                  value: motorista,
                );
              }).toList(),
            ),
            SizedBox(
              height: 13,
            ),
            DropdownButton(
              hint: Text('Por Placa'),
              value: _selectedPlaca,
              isExpanded: true,
              onChanged: (newValue) {
                setState(() {
                  _selectedPlaca = newValue;
                });
              },
              items: _placas.map((placa) {
                return DropdownMenuItem(
                  child: new Text(placa),
                  value: placa,
                );
              }).toList(),
            ),
            SizedBox(
              height: 200,
            ),
            Container(
              height: 60,
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 295,
                  height: 60,
                  child: RaisedButton(
                    color: Color(COR_PRIMARY),
                    textColor: Colors.white,
                    child: Text(
                      "Aplicar Filtro",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              FrotaPropriaResultado(widget.pageController)));
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 60,
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 295,
                  height: 60,
                  child: RaisedButton(
                    color: Colors.grey,
                    textColor: Colors.white,
                    child: Text(
                      "Voltar",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    onPressed: () {
                       Navigator.pop(context);
                    },
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
