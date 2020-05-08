import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tms_mobile/controller/faturamento/faturamento-un-controller.dart';
import 'package:tms_mobile/global.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class FaturamentoVisaoUn extends StatefulWidget {
  @override
  _FaturamentoVisaoUnState createState() => _FaturamentoVisaoUnState();
}

class _FaturamentoVisaoUnState extends State<FaturamentoVisaoUn> {
  final controllerFaturamento = GetIt.I.get<FaturamentoUnController>();
  bool visaoGrafico = false;
  bool visaoTabela = true;
  Color corGrafico = Colors.black26;
  Color corTabela = Color(COR_PRIMARY);
  List<charts.Series<Task, String>> _seriesPieData;
  List<Widget> listWidget = List();

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
    controllerFaturamento.getFaturamento();

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
    return Container(
      height: 400,
      width: double.infinity,
      child: ListView(
        children: <Widget>[
          Container(
            height: 50,
            width: double.infinity,
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
              height: 320,
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
              height: 320,
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
        ],
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
