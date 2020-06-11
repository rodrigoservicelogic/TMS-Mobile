import 'package:flutter/material.dart';
import 'package:tms_mobile/global.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:tms_mobile/controller/faturamento-mensal-controller.dart';
import 'package:tms_mobile/models/filtrofaturamento-model.dart';

class FaturamentoVisaoMensal extends StatefulWidget {
  final ModelFiltroFaturamento filtro;

  FaturamentoVisaoMensal(this.filtro);

  @override
  _FaturamentoVisaoMensalState createState() => _FaturamentoVisaoMensalState();
}

class _FaturamentoVisaoMensalState extends State<FaturamentoVisaoMensal> {
  bool visaoTabela = true;
  Color corNaoSelecionado = Colors.black26;
  Color corSelecionado = Color(COR_PRIMARY);

  final controller = FaturamentoVisaoMensalController();

  @override
  Widget build(BuildContext context) {
    //Declaração de variáveis para scafolding

    return LayoutBuilder(builder: (_, constraints) {
      return Container(
        width: constraints.maxWidth,
        child: ListView(
          children: <Widget>[
            Container(
              height: constraints.maxHeight * 0.20,
              width: constraints.maxWidth,
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              color: Colors.black12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    width: constraints.maxWidth * 0.55,
                    child: FittedBox(
                      child: Text(
                        "VISÃO MENSAL (ANO X ANO)",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF606062),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.all(0.0),
                    icon: Icon(Icons.grid_on),
                    color: visaoTabela ? corSelecionado : corNaoSelecionado,
                    iconSize: constraints.maxHeight * 0.08,
                    tooltip: "Tabela",
                    onPressed: () {
                      setState(() {
                        visaoTabela = true;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.pie_chart),
                    padding: EdgeInsets.all(0.0),
                    iconSize: constraints.maxHeight * 0.08,
                    tooltip: "Gráfico",
                    color: visaoTabela ? corNaoSelecionado : corSelecionado,
                    onPressed: () {
                      setState(() {
                        visaoTabela = false;
                      });
                    },
                  ),
                ],
              ),
            ),
            FutureBuilder(
              future: controller.getVisaoMensal(widget.filtro),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    height: constraints.maxHeight * 0.80,
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  if (snapshot.hasError) {
                    return Center(
                        child:
                            Text("Falha em obter dados - ${snapshot.error}"));
                  } else {
                    if (visaoTabela) {
                      return SingleChildScrollView(
                        padding: EdgeInsets.all(0.0),
                        child: FittedBox(
                                                  child: DataTable(
                            columnSpacing: 0.0,
                            columns: controller.columns,
                            rows: controller.rows,
                          ),
                        ),
                      );
                    } else {
                      return SizedBox(
                        height: constraints.maxHeight * 0.80,
                        child: charts.TimeSeriesChart(
                          controller.series,
                          animate: true,
                          defaultRenderer: new charts.LineRendererConfig(
                            includePoints: true,
                            includeArea: true,
                          ),
                          behaviors: [
                            charts.SeriesLegend(
                              position: charts.BehaviorPosition.bottom,
                            ),
                          ],
                        ),
                      );
                    }
                  }
                }
              },
            ),
          ],
        ),
      );
    });
  }
}
