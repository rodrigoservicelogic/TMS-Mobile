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
  void initState() {
    super.initState();

    //Outras inicializações
    controller.getVisaoMensal(1, widget.filtro);
  }

  @override
  Widget build(BuildContext context) {
    //Declaração de variáveis para scafolding

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
                    "VISÃO MENSAL (ANO X ANO)",
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
          ),
          Visibility(
            visible: visaoTabela,
            child: SingleChildScrollView(
              child: DataTable(
                columns: controller.columns,
                rows: controller.rows,
              ),
            ),
          ),
          Visibility(
            visible: !visaoTabela,
            child: SizedBox(
              height: 200.0,
              child: charts.BarChart(
                controller.series,
                animate: true,
                vertical: true,
                barGroupingType: charts.BarGroupingType.grouped,
                behaviors: [
                  charts.SeriesLegend(
                    position: charts.BehaviorPosition.bottom,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
