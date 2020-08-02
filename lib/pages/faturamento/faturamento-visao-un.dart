import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tms_mobile/controller/faturamento/faturamento-un-controller.dart';
import 'package:tms_mobile/global.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:tms_mobile/models/filtrofaturamento-model.dart';

class FaturamentoVisaoUn extends StatefulWidget {
  final ModelFiltroFaturamento filtro;

  FaturamentoVisaoUn(this.filtro);

  @override
  _FaturamentoVisaoUnState createState() => _FaturamentoVisaoUnState();
}

class _FaturamentoVisaoUnState extends State<FaturamentoVisaoUn> {
  final controllerFaturamentoUn = GetIt.I.get<FaturamentoUnController>();

  bool visaoGrafico = false;
  bool visaoTabela = true;
  Color corGrafico = Colors.black26;
  Color corTabela = Color(COR_PRIMARY);

  @override
  void initState() {
    super.initState();
    controllerFaturamentoUn.buildTableUn();
    controllerFaturamentoUn.buildChartsUn();
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(width: 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    "UND. DE NEGÓCIO",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xFF606062)),
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    icon: Icon(Icons.grid_on, color: corTabela),
                    iconSize: 22,
                    tooltip: "Tabela",
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
                    iconSize: 22,
                    tooltip: "Gráfico",
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
              child: SingleChildScrollView(
                  child: DataTable(
                columns: controllerFaturamentoUn.columnsUn,
                rows: controllerFaturamentoUn.rowsUn,
              )),
            ),
          ),
          Visibility(
            visible: visaoGrafico,
            child: SizedBox(
              height: 320,
              child: charts.PieChart(
                controllerFaturamentoUn.seriesUn,
                animate: true,
                animationDuration: Duration(seconds: 1),
                behaviors: [
                  new charts.DatumLegend(
                      position: charts.BehaviorPosition.bottom,
                      outsideJustification: charts.OutsideJustification.start,
                      horizontalFirst: false,
                      desiredMaxRows: 4,
                      cellPadding: new EdgeInsets.all(0.3),
                      entryTextStyle: charts.TextStyleSpec(
                          color: charts.MaterialPalette.black,
                          fontFamily: 'Georgia',
                          fontSize: 7))
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
