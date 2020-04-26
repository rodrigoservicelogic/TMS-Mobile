import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tms_mobile/controller/faturamento-cliente-controller.dart';
import 'package:tms_mobile/global.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class FaturamentoCliente extends StatefulWidget {
  @override
  _FaturamentoCliente createState() => _FaturamentoCliente();
}

class _FaturamentoCliente extends State<FaturamentoCliente> {
  List empresas;
  String empresaSelected;

  final controller = FaturamentoClienteController();

  MediaQueryData queryData;

  String dropdownValue = '';
  bool visaoTabela = true;
  bool visaoGrafico = false;
  Color corGrafico = Colors.black26;
  Color corTabela = Color(COR_PRIMARY);

  @override
  void initState() {
    super.initState();

    empresas = [
      {'id': 1, 'nome': 'Empresa 1'},
      {'id': 2, 'nome': 'Empresa 2'},
      {'id': 3, 'nome': 'Empresa 3'},
      {'id': 4, 'nome': 'Empresa 4'},
      {'id': 5, 'nome': 'Empresa 5'},
    ];
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(width: 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    var data = [
      Dados('2016', 12),
      Dados('2017', 15),
      Dados('2020', 10),
    ];

    var series = [
      charts.Series(
        domainFn: (Dados clickData, _) => clickData.ano,
        measureFn: (Dados clickData, _) => clickData.valor,
        id: 'Clicks',
        data: data,
      ),
    ];
    return Container(
      height: 400,
      child: ListView(
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.black12,
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "VISÃO POR CLIENTE",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xFF606062)),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    width: 110,
                  ),
                  IconButton(
                    icon: Icon(Icons.grid_on),
                    color: corTabela,
                    tooltip: 'Tabela',
                    onPressed: () {
                      setState(() {
                        visaoTabela = true;
                        visaoGrafico = false;
                        corTabela = Color(COR_PRIMARY);
                        corGrafico = Colors.black26;
                      });
                    },
                  ),
                  IconButton(
                    color: corGrafico,
                    icon: Icon(Icons.pie_chart),
                    tooltip: 'Gráficos',
                    onPressed: () {
                      setState(() {
                        visaoGrafico = true;
                        visaoTabela = false;
                        corTabela = Colors.black26;
                        corGrafico = Color(COR_PRIMARY);
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 13,
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: Container(
                decoration: myBoxDecoration(),
                child: Center(
                  child: Text(
                    '${controller.valor}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color(COR_PRIMARY)),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: visaoTabela,
            child: SingleChildScrollView(
              child: DataTable(
                columns: [
                  DataColumn(
                      label: Text(
                    'Tipo de Cliente',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 9,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Container(
                    height: 50,
                    width: 260,
                    decoration: myBoxDecoration(),
                    child: Center(
                      child: Text(
                        '${controller.valor}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 15,
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: myBoxDecoration(),
                    child: Center(
                      child: Text(
                        " 88,00",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0XFF00ab85),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 13,
            ),
            Container(
              height: 50,
              color: Colors.black12,
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "VISÃO POR CLIENTE",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: (Colors.black)),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    IconButton(
                      icon: Icon(Icons.grid_on),
                      color: corTabela,
                      iconSize: 22,
                      tooltip: 'Tabela',
                      onPressed: () {
                        setState(() {
                          visaoTabela = true;
                          visaoGrafico = false;
                          corTabela = Color(COR_PRIMARY);
                          corGrafico = Colors.black26;
                        });
                      },
                    ),
                    IconButton(
                      color: corGrafico,
                      icon: Icon(Icons.pie_chart),
                      iconSize: 22,
                      tooltip: 'Gráficos',
                      onPressed: () {
                        setState(() {
                          visaoGrafico = true;
                          visaoTabela = false;
                          corTabela = Colors.black26;
                          corGrafico = Color(COR_PRIMARY);
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width - 50,
                child: Visibility(
                  visible: visaoTabela,
                  child: SingleChildScrollView(
                    child: DataTable(
                      columns: [
                        DataColumn(
                            label: Text(
                          'Tipo de Cliente',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black),
                          textAlign: TextAlign.center,
                        )),
                        DataColumn(
                          label: Text(
                            '${controller.anoAtual}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        DataColumn(
                            label: Text(
                          '%',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black),
                          textAlign: TextAlign.center,
                        )),
                      ],
                      rows: [
                        DataRow(cells: [
                           DataCell(Text('Tipo 1')),
                          DataCell(Text('9,50')),
                          DataCell(Text('4')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Tipo 2')),
                          DataCell(Text('9,50')),
                          DataCell(Text('4')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Tipo 3')),
                          DataCell(Text('50')),
                          DataCell(Text('45')),
                        ]),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 50,
                child: Visibility(
                  visible: visaoGrafico,
                  child: SizedBox(
                    height: 200.0,
                    child: charts.BarChart(
                      series,
                      animate: true,
                      vertical: false,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
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
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    onPressed: () {
                       Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Sample ordinal data type.
class Dados {
  final String ano;
  final int valor;

  Dados(this.ano, this.valor);
}
