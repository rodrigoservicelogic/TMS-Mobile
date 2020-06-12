import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tms_mobile/controller/frota/frota-propria-controller.dart';
import 'package:tms_mobile/widgets/dateTimePicker.dart';
import 'package:tms_mobile/widgets/drawer.dart';

import '../../global.dart';

class FrotaPropriaResultado extends StatefulWidget {
  final PageController pageController;

  FrotaPropriaResultado(this.pageController);
  @override
  _FrotaPropriaResultadoState createState() => _FrotaPropriaResultadoState();
}

class _FrotaPropriaResultadoState extends State<FrotaPropriaResultado> {
  DateTime _dataInicial, _dataFinal;
  final controller = FrotaPropriaController();

  String _selectedMotorista;
  String _selectedPlaca;
  MediaQueryData queryData;

  String dropdownValue = '';
  @override
  void initState() {
    super.initState();
    _dataInicial = DateTime.now();
    _dataFinal = DateTime.now();
  }

  BoxDecoration myBoxDecoration(double size) {
    return BoxDecoration(
      border: Border(bottom: BorderSide(width: size)),
    );
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
                    selectedDate: _dataFinal,
                    selectDate: (DateTime date) {
                      print(date);
                      setState(() {
                        _dataFinal = date;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 13,
            ),
            Observer(builder: (_) {
              return DropdownButton(
                hint: Text(
                  'Por Motorista',
                  style: TextStyle(
                    color: Color(COR_PRIMARY),
                  ),
                ),
                value: _selectedMotorista,
                isExpanded: true,
                onChanged: (newValue) {
                  setState(() {
                    _selectedMotorista = newValue;
                  });
                },
                items: controller.motorista.map((motorista) {
                  return DropdownMenuItem(
                    child: new Text(motorista.nome),
                    value: motorista.codMotorista,
                  );
                }).toList(),
              );
            }),
            SizedBox(
              height: 13,
            ),
            Observer(builder: (_) {
              return DropdownButton(
                hint: Text(
                  'Por Placa',
                  style: TextStyle(
                    color: Color(COR_PRIMARY),
                  ),
                ),
                value: _selectedPlaca,
                isExpanded: true,
                onChanged: (newValue) {
                  setState(() {
                    _selectedPlaca = newValue;
                  });
                },
                items: controller.placas.map((placas) {
                  return DropdownMenuItem(
                    child: new Text(placas),
                    value: placas,
                  );
                }).toList(),
              );
            }),
            Center(
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 50,
                decoration: myBoxDecoration(1.4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "RECEITA (R\$)",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '${controller.receita}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 50,
                decoration: myBoxDecoration(1.4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "DESPESA (R\$)",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '${controller.despesa}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: 25,
                width: MediaQuery.of(context).size.width - 50,
                decoration: myBoxDecoration(.3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Text(
                        "Impostos",
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${controller.impostoVal}',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '${controller.impostoPerc}',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: 25,
                width: MediaQuery.of(context).size.width - 50,
                decoration: myBoxDecoration(.3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Text(
                        "Custos Fixos",
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${controller.custoFixoVal}',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '${controller.custoFixoPerc}',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: 25,
                width: MediaQuery.of(context).size.width - 50,
                decoration: myBoxDecoration(.3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Text(
                        "Custos Variáveis",
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${controller.custoVariavelVal}',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '${controller.custoVariavelPerc}',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 50,
                decoration: myBoxDecoration(1.4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "RESULTADO (R\$)",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '${controller.resultadoVal}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: 25,
                width: MediaQuery.of(context).size.width - 50,
                decoration: myBoxDecoration(1.4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "RESULTADO (%)",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '${controller.resultadoPerc}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
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
