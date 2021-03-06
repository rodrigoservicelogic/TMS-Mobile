import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_multi_formatter/formatters/money_input_enums.dart';
import 'package:flutter_multi_formatter/formatters/money_input_formatter.dart';
import 'package:get_it/get_it.dart';
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

  final controller = GetIt.I.get<FaturamentoVisaoMensalController>();

  @override
  void initState() {
    super.initState();

    if (widget.filtro == null) {
      widget.filtro.dataDe = DateTime.now();
      widget.filtro.dataAte = DateTime.now();
    }
  }

  @override
  Widget build(BuildContext context) {
    //Declaração de variáveis para scafolding

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.50,
      child: ListView(
        children: <Widget>[
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.black12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  "MENSAL",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color(0xFF606062),
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 10,
                ),
                IconButton(
                  icon: Icon(Icons.grid_on),
                  color: visaoTabela ? corSelecionado : corNaoSelecionado,
                  iconSize: 22,
                  tooltip: "Tabela",
                  onPressed: () {
                    setState(() {
                      visaoTabela = true;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.pie_chart),
                  iconSize: 22,
                  tooltip: "Gráfico",
                  color: visaoTabela ? corNaoSelecionado : corSelecionado,
                  onPressed: () {
                    setState(() {
                      visaoTabela = false;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: controller.getVisaoMensal(widget.filtro),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox(
                  height: 200.0,
                  child: Center(child: CircularProgressIndicator()),
                );
              } else {
                if (snapshot.hasError) {
                  return Center(
                      child: Text("Falha em obter dados - ${snapshot.error}"));
                } else {
                  if (visaoTabela) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      child: Observer(
                        builder: (context) {
                          return DataTable(
                            columnSpacing: 40,
                            columns: controller.columns,
                            rows: controller.rows,
                          );
                        },
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: 200.0,
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
                              showMeasures: true,
                              entryTextStyle:
                                  charts.TextStyleSpec(fontWeight: "bold"),
                              secondaryMeasureFormatter: (value) {
                                return toCurrencyString(
                                    value.toStringAsFixed(2),
                                    thousandSeparator: ThousandSeparator.Period,
                                    shorteningPolicy:
                                        ShorteningPolicy.RoundToThousands);
                              },
                              measureFormatter: (value) {
                                return toCurrencyString(
                                    value.toStringAsFixed(2),
                                    thousandSeparator: ThousandSeparator.Period,
                                    shorteningPolicy:
                                        ShorteningPolicy.RoundToThousands);
                              }),
                          charts.LinePointHighlighter(
                            drawFollowLinesAcrossChart: true,
                            showHorizontalFollowLine:
                                charts.LinePointHighlighterFollowLineType.all,
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
  }
}
