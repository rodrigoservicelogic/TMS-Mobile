import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tms_mobile/controller/terceiro-controller.dart';
import 'package:tms_mobile/global.dart';
import 'package:tms_mobile/widgets/dateTimePicker.dart';
import 'package:tms_mobile/widgets/drawer.dart';

import 'filtro-terceiro.dart';

class ResultadoTerceiro extends StatefulWidget {
  final PageController pageController;

  ResultadoTerceiro(this.pageController);

  @override
  _ResultadoTerceiroState createState() => _ResultadoTerceiroState();
}

class _ResultadoTerceiroState extends State<ResultadoTerceiro> {
  DateTime _dataInicial, _dataFinal;
  final controller = TerceiroController();
  String _selectedTerceiro;
  String _selectedPlaca;
  MediaQueryData queryData;

  String dropdownValue = '';

  @override
  void initState() {
    super.initState();

    _dataInicial = DateTime.now();
    _dataFinal = DateTime.now();
    controller.popularListaTerceiros();
    controller.popularListaPlacas();
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
                    "RESULTADO - TERCEIRO",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
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
                  'Todos os Terceiros',
                  style: TextStyle(color: Color(COR_PRIMARY)),
                ),
                value: _selectedTerceiro,
                isExpanded: true,
                onChanged: (newValue) {
                  setState(() {
                    _selectedTerceiro = newValue;
                  });
                },
                items: controller.terceiros.map((agregado) {
                  return DropdownMenuItem(
                    child: new Text(agregado),
                    value: agregado,
                  );
                }).toList(),
              );
            }),
            SizedBox(
              height: 13,
            ),
            DropdownButton(
              hint: Text(
                'Todas as Placas',
                style: TextStyle(color: Color(COR_PRIMARY)),
              ),
              value: _selectedPlaca,
              isExpanded: true,
              onChanged: (newValue) {
                setState(() {
                  _selectedPlaca = newValue;
                });
              },
              items: controller.placas.map((placa) {
                return DropdownMenuItem(
                  child: new Text(placa),
                  value: placa,
                );
              }).toList(),
            ),
            Center(
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 90,
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
                width: MediaQuery.of(context).size.width - 90,
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
                width: MediaQuery.of(context).size.width - 90,
                decoration: myBoxDecoration(.3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Text(
                        "Impostos",
                        style: TextStyle(
                          fontWeight: FontWeight.normal
                        ),
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
                width: MediaQuery.of(context).size.width - 90,
                decoration: myBoxDecoration(.3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Text(
                        "Frete Pago ao Terceiro",
                        style: TextStyle(
                          fontWeight: FontWeight.normal
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${controller.fretePagoTerVal}',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '${controller.fretePagoTerPerc}',
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
                width: MediaQuery.of(context).size.width - 90,
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
                width: MediaQuery.of(context).size.width - 90,
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
              height: 80,
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              FiltroTerceiro(widget.pageController)));
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
