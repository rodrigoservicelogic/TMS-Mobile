import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:tms_mobile/controller/faturamento/faturamento-grupo-cliente-controller.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:tms_mobile/global.dart';
import 'package:tms_mobile/models/filtrofaturamento-model.dart';

class FaturamentoVisaoGrupoCliente extends StatefulWidget {
  final ModelFiltroFaturamento filtro;

  FaturamentoVisaoGrupoCliente(this.filtro);

  @override
  _FaturamentoVisaoGrupoClienteState createState() =>
      _FaturamentoVisaoGrupoClienteState();
}

class _FaturamentoVisaoGrupoClienteState
    extends State<FaturamentoVisaoGrupoCliente> {
  final controller = GetIt.I.get<FaturamentoGrupoClienteController>();

  bool visaoGrafico = false;
  bool visaoTabela = true;
  Color corGrafico = Colors.black26;
  Color corTabela = Color(COR_PRIMARY);

  @override
  void initState() {
    super.initState();

    // controller.buildTable();
    // controller.buildChart();
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
                    "GRUPO DE CLIENTE",
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
          FutureBuilder(
            future: controller.getVisaoGrupoCliente(widget.filtro),
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
                            columnSpacing: 10,
                            columns: controller.columns,
                            rows: controller.rows,
                          );
                        },
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: 200.0,
                      child: charts.BarChart(
                        controller.series,
                        animationDuration: Duration(seconds: 1),
                        animate: true,
                        vertical: false,
                        barRendererDecorator:
                            new charts.BarLabelDecorator<String>(),
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
