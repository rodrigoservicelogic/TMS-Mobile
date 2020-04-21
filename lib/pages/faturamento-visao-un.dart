import 'package:flutter/material.dart';
import 'package:tms_mobile/global.dart';
import 'package:tms_mobile/widgets/dateTimePicker.dart';
import 'package:tms_mobile/widgets/drawer.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class FaturamentoVisaoUn extends StatefulWidget {
  final PageController pageController;

  FaturamentoVisaoUn(this.pageController);

  @override
  _FaturamentoVisaoUnState createState() => _FaturamentoVisaoUnState();
}

class _FaturamentoVisaoUnState extends State<FaturamentoVisaoUn> {
  DateTime _dataInicial, _dataFinal;

  _generateData() {
    var pieData = [
      new Task('Matriz', '2.000.000,00', colorVal)
    ]
  }

  @override
  void initState() {
    super.initState();

    _dataInicial = DateTime.now();
    _dataFinal = DateTime.now();
    _generateData();
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(width: 0),
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
                    "FATURAMENTO",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
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
              height: 50,
              width: double.infinity,
              child: Container(
                decoration: myBoxDecoration(),
                child: Center(
                  child: Text(
                    "R\$6.000.000,00",
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
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Mesmo Período (Ano Anterior):",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF606062)),
                  ),
                  SizedBox(
                    width: 1,
                    height: 1,
                  ),
                  Text(
                    "%",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF606062)),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 4,
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 260,
                    decoration: myBoxDecoration(),
                    child: Center(
                      child: Text(
                        "R\$4.000.000,00",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xFF606062)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 80,
                    decoration: myBoxDecoration(),
                    child: Center(
                      child: Text(
                        "33,33",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Color(0XFF00ab85)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Container(
              height: 50,
              color: Color(COLOR_SECONDARY),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "VISÃO POR UND. DE NEGÓCIO",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color(0xFF606062)),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    IconButton(
                      icon: Icon(Icons.grid_on, color: Color(COR_PRIMARY)),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.donut_large, color: Color(0xFFbdbfc1)),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            SizedBox(
              height: 150,
              child: DataTable(
                columns: [
                  DataColumn(
                      label: Text('Und. de Negócio',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 7,
                            color: Colors.black),
                        textAlign: TextAlign.center,)),
                  DataColumn(
                      label: Text('2020 (R\$)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black),
                        textAlign: TextAlign.center,)),
                  DataColumn(
                      label: Text('%',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black),
                        textAlign: TextAlign.center,))
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('Matriz')),
                    DataCell(Text('2.000.000,00')),
                    DataCell(Text('33,33')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Filial A')),
                    DataCell(Text('1.000.000,00')),
                    DataCell(Text('16,66')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Filial B')),
                    DataCell(Text('1.500.000,00')),
                    DataCell(Text('25,00')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Filial C')),
                    DataCell(Text('1.500.000,00')),
                    DataCell(Text('25,00')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Total',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                    DataCell(Text('6.000.000,00',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                    DataCell(Text('100,00',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                  ]),
                ],
              ),
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
                      "Voltar",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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

class Task{
  String task;
  String taskValue;
  double taskPercent;
  Color colorVal;

  Task(this.task, this.taskValue, this.taskPercent, this.colorVal);

}