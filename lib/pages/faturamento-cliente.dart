import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tms_mobile/global.dart';
import 'package:tms_mobile/widgets/dateTimePicker.dart';
import 'package:tms_mobile/widgets/drawer.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class FaturamentoCliente extends StatefulWidget {
  final PageController pageController;

  FaturamentoCliente(this.pageController);
  @override
  _FaturamentoCliente createState() => _FaturamentoCliente();
}

class _FaturamentoCliente extends State<FaturamentoCliente> {
  DateTime _dataInicial;
  List empresas;
  String empresaSelected;

  String dropdownValue = '';
  bool visaoTabela = true;
  bool visaoGrafico = false;
  Color corGrafico = Colors.black26;
  Color corTabela = Color(COR_PRIMARY);

  @override
  void initState() {
    super.initState();

    _dataInicial = DateTime.now();

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
                    "FATURAMENTO",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
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
            SizedBox(
              height: 60,
              width: double.infinity,
              child: Container(
                decoration: myBoxDecoration(),
                child: Center(
                  child: Text(
                    "R\$ 6.000,00",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color(COR_PRIMARY)),
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
                  child: Text(
                    "Mesmo período (Ano Anterior):",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "%",
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
                        "R\$ 6.000,00",
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
                          fontSize: 12,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    )),
                    DataColumn(
                      label: Text(
                        '2020(R\$)',
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
                      DataCell(Text('6,50')),
                      DataCell(Text('5')),
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
            Visibility(
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
                    onPressed: () {},
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

/// Sample ordinal data type.
class Dados {
  final String ano;
  final int valor;

  Dados(this.ano, this.valor);
}
