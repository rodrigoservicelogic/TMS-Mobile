import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tms_mobile/controller/empresa/empresa-controller.dart';
import 'package:tms_mobile/global.dart';
import 'package:tms_mobile/pages/empresa/resultado-empresa.dart';
import 'package:tms_mobile/widgets/dateTimePicker.dart';
import 'package:tms_mobile/widgets/drawer.dart';

import '../resultado-page.dart';

class FiltroEmpresa extends StatefulWidget {
  final PageController pageController;

  FiltroEmpresa(this.pageController);

  @override
  _FiltroEmpresaState createState() => _FiltroEmpresaState();
}

class _FiltroEmpresaState extends State<FiltroEmpresa> {
  DateTime _dataInicial, _dataFinal;
  final controller = EmpresaController();
  String _selectedRegime;

  String dropdownValue = '';

  @override
  void initState() {
    super.initState();

    _dataInicial = DateTime.now();
    _dataFinal = DateTime.now();
    controller.popularListaRegimes();
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
                    "RESULTADO - EMPRESA",
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
                hint: Text('Por Regime'),
                value: _selectedRegime,
                isExpanded: true,
                onChanged: (newValue) {
                  setState(() {
                    _selectedRegime = newValue;
                  });
                },
                items: controller.regimes.map((regime) {
                  return DropdownMenuItem(
                    child: new Text(regime),
                    value: regime,
                  );
                }).toList(),
              );
            }),
            SizedBox(
              height: 300,
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
                                ResultadoEmpresa(widget.pageController)));
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
                      Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ResultadoPage(widget.pageController)));
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
