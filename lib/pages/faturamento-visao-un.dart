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
  bool visaoGrafico = false;
  bool visaoTabela = true;
  Color corGrafico = Colors.black26;
  Color corTabela = Color(COR_PRIMARY);
  List<charts.Series<Task, String>> _seriesPieData;

  _generateData() {
    var pieData = [
      new Task('Matriz', '2.000.000,00', 33.33, Color(0xffbee8d5)),
      new Task('Filial A', '1.000.000,00', 16.66, Color(0xffc8d1e1)),
      new Task('Filial B', '1.500.000,00', 25.00, Color(0xfffef1c9)),
      new Task('Filial C', '1.500.000,00', 25.00, Color(0xfffce0cb)),
    ];

    _seriesPieData.add(charts.Series(
      data: pieData,
      domainFn: (Task task, _) => task.task,
      measureFn: (Task task, _) => task.taskPercent,
      colorFn: (Task task, _) => charts.ColorUtil.fromDartColor(task.colorVal),
      id: 'Daily task',
      labelAccessorFn: (Task row, _) => '${row.taskValue}',
    ));
  }

  @override
  void initState() {
    super.initState();

    _dataInicial = DateTime.now();
    _dataFinal = DateTime.now();
    _seriesPieData = List<charts.Series<Task, String>>();
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                    flex: 4,
                    child: Text(
                      "Mesmo Período (Ano Anterior):",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF606062)),
                    )),
                Expanded(
                    flex: 1,
                    child: Text(
                      "%",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF606062)),
                    )),
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
                    )),
                SizedBox(
                  width: 13,
                ),
                Expanded(
                    flex: 2,
                    child: Container(
                      height: 50,
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
                    )),
              ],
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
                      icon: Icon(Icons.grid_on, color: corTabela),
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
                      icon: Icon(Icons.pie_chart, color: corGrafico),
                      onPressed: () {
                        setState(() {
                          visaoGrafico = true;
                          visaoTabela = false;
                          corTabela = Colors.black26;
                          corGrafico = Color(COR_PRIMARY);
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: visaoTabela,
              child: SizedBox(
                height: 340,
                child: DataTable(
                  columns: [
                    DataColumn(
                        label: Text(
                      'Und. Neg.',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    )),
                    DataColumn(
                        label: Text(
                      '2020 (R\$)',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    )),
                    DataColumn(
                        label: Text(
                      '%',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ))
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
            ),
            Visibility(
              visible: visaoGrafico,
              child: SizedBox(
                height: 340,
                child: charts.PieChart(
                  _seriesPieData,
                  animate: true,
                  animationDuration: Duration(seconds: 1),
                  behaviors: [
                    new charts.DatumLegend(
                        position: charts.BehaviorPosition.bottom,
                        outsideJustification:
                            charts.OutsideJustification.startDrawArea,
                        horizontalFirst: false,
                        desiredMaxRows: 1,
                        cellPadding: new EdgeInsets.all(4),
                        entryTextStyle: charts.TextStyleSpec(
                            color: charts.MaterialPalette.purple.shadeDefault,
                            fontFamily: 'Georgia',
                            fontSize: 11))
                  ],
                  defaultRenderer: new charts.ArcRendererConfig(
                      arcWidth: 100,
                      arcRendererDecorators: [
                        new charts.ArcLabelDecorator(
                            labelPosition: charts.ArcLabelPosition.inside,
                            insideLabelStyleSpec: charts.TextStyleSpec(
                              fontSize: 13,
                            ))
                      ]),
                ),
              ),
            ),
            SizedBox(
              height: 13,
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

class Task {
  String task;
  String taskValue;
  double taskPercent;
  Color colorVal;

  Task(this.task, this.taskValue, this.taskPercent, this.colorVal);
}
