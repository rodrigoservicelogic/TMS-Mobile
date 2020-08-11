import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:tms_mobile/controller/faturamento/faturamento-un-controller.dart';
import 'package:tms_mobile/models/filtrofaturamento-model.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../../global.dart';

class FaturamentoVisaoTipoTransporte extends StatefulWidget {
  final ModelFiltroFaturamento filtro;

  FaturamentoVisaoTipoTransporte(this.filtro);

  @override
  _FaturamentoVisaoTipoTransporteState createState() =>
      _FaturamentoVisaoTipoTransporteState();
}

class _FaturamentoVisaoTipoTransporteState
    extends State<FaturamentoVisaoTipoTransporte> {
  final controller = GetIt.I.get<FaturamentoUnController>();

  bool visaoGrafico = false;
  bool visaoTabela = true;
  Color corGrafico = Colors.black26;
  Color corTabela = Color(COR_PRIMARY);

  @override
  void initState() {
    super.initState();

    controller.buildTableTipoTransporte();
    controller.buildChartTipoTransporte();
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
                    "TIPO TRANSPORTE",
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
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(child: Observer(
                builder: (context) {
                  return DataTable(
                    columnSpacing: 20,
                    columns: controller.columnsTipoTransp,
                    rows: controller.rowsTipoTransp,
                  );
                },
              )),
            ),
          ),
          Visibility(
            visible: visaoGrafico,
            child: SizedBox(
              height: 320,
              child: charts.PieChart(
                controller.seriesTipoTransp,
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
