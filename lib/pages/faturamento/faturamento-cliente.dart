import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tms_mobile/controller/faturamento/faturamento-cliente-controller.dart';
import 'package:tms_mobile/controller/faturamento/faturamento-un-controller.dart';
import 'package:tms_mobile/global.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class FaturamentoCliente extends StatefulWidget {
  @override
  _FaturamentoCliente createState() => _FaturamentoCliente();
}

class _FaturamentoCliente extends State<FaturamentoCliente> {
  String empresaSelected;

  final controllerFaturamentoUn = GetIt.I.get<FaturamentoUnController>();

  String dropdownValue = '';
  bool visaoTabela = true;
  bool visaoGrafico = false;
  Color corGrafico = Colors.black26;
  Color corTabela = Color(COR_PRIMARY);

  @override
  void initState() {
    super.initState();
    controllerFaturamentoUn.buildTableCli();
    controllerFaturamentoUn.buildChartsCli();
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
                    "VISÃO POR CLIENTE",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xFF606062)),
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
            child: SingleChildScrollView(
              child: DataTable(
                  columns: controllerFaturamentoUn.columnsCli,
                  rows: controllerFaturamentoUn.rowsCli),
            ),
          ),
          Visibility(
            visible: visaoGrafico,
            child: SizedBox(
              height: 200.0,
              child: charts.BarChart(
                controllerFaturamentoUn.seriesCli,
                animationDuration: Duration(seconds: 1),
                animate: true,
                vertical: false,
                barRendererDecorator: new charts.BarLabelDecorator<String>(),
              ),
            ),
          ),
        ],
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
