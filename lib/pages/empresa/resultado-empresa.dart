import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tms_mobile/controller/empresa-controller.dart';
import 'package:tms_mobile/global.dart';
import 'package:tms_mobile/widgets/dateTimePicker.dart';
import 'package:tms_mobile/widgets/drawer.dart';

import 'filtro-empresa.dart';

class ResultadoEmpresa extends StatefulWidget {
  final PageController pageController;

  ResultadoEmpresa(this.pageController);

  @override
  _ResultadoEmpresaState createState() => _ResultadoEmpresaState();
}

class _ResultadoEmpresaState extends State<ResultadoEmpresa> {
  DateTime _dataInicial, _dataFinal;
  final controller = EmpresaController();
  String _selectedCompetencia;
  MediaQueryData queryData;

  String dropdownValue = '';

  @override
  void initState() {
    super.initState();

    _dataInicial = DateTime.now();
    _dataFinal = DateTime.now();
    controller.popularListaCompetencias();
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
                hint: Text(
                  'Por Competência',
                  style: TextStyle(color: Color(COR_PRIMARY)),
                ),
                value: _selectedCompetencia,
                isExpanded: true,
                onChanged: (newValue) {
                  setState(() {
                    _selectedCompetencia = newValue;
                  });
                },
                items: controller.competencias.map((competencia) {
                  return DropdownMenuItem(
                    child: new Text(competencia),
                    value: competencia,
                  );
                }).toList(),
              );
            }),
            SizedBox(
              height: 13,
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
                height: 25,
                width: MediaQuery.of(context).size.width - 90,
                decoration: myBoxDecoration(.3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Frete Frota",
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${controller.freteFrotaVal}',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '${controller.freteFrotaPerc}',
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
                      flex: 2,
                      child: Text(
                        "Frete Agregados",
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${controller.freteAgregadosVal}',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '${controller.freteAgregadosPerc}',
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
                      flex: 2,
                      child: Text(
                        "Frete Terceiros",
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${controller.freteTerVal}',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '${controller.freteTerPerc}',
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
                // decoration: myBoxDecoration(3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 20,
                    ),
                    Container(
                      decoration: myBoxDecoration(.3),
                      height: 25,
                      width: MediaQuery.of(context).size.width - 90,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Despesas Adm",
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${controller.despesasAdmVal}',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              '${controller.despesasAdmPerc}',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        " [+]",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Color(COR_PRIMARY)
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
                // decoration: myBoxDecoration(3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 20,
                    ),
                    Container(
                      decoration: myBoxDecoration(.3),
                      height: 25,
                      width: MediaQuery.of(context).size.width - 90,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Despesas Operacionais",
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${controller.despesasOperVal}',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              '${controller.despesasOperPerc}',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        " [+]",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Color(COR_PRIMARY)
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
                // decoration: myBoxDecoration(3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 20,
                    ),
                    Container(
                      decoration: myBoxDecoration(.3),
                      height: 25,
                      width: MediaQuery.of(context).size.width - 90,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Investimentos",
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${controller.investimentosVal}',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              '${controller.investimentosPerc}',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        " [+]",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Color(COR_PRIMARY)
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
              height: 40,
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
                              FiltroEmpresa(widget.pageController)));
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
