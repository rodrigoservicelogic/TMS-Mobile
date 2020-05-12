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
  }

  @override
  Widget build(BuildContext context) {
    //Declaração de variáveis para scafolding
    var tableHeaderStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: Colors.black,
    );

    var series = controller.getSeries(widget.filtro);

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
                columns: [
                  DataColumn(
                    label: Text(
                      'Mês',
                      style: tableHeaderStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      '2019(R\$)',
                      style: tableHeaderStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      '2020(R\$)',
                      style: tableHeaderStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      '%',
                      style: tableHeaderStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(Text('01')),
                      DataCell(Text('6.000.000,00')),
                      DataCell(Text('4.000.000,00')),
                      DataCell(Text('10,00')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('02')),
                      DataCell(Text('6.000.000,00')),
                      DataCell(Text('4.000.000,00')),
                      DataCell(Text('12,00')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('03')),
                      DataCell(Text('6.000.000,00')),
                      DataCell(Text('4.000.000,00')),
                      DataCell(Text('15,00')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Total')),
                      DataCell(Text('15.000.000,00')),
                      DataCell(Text('12.000.000,00')),
                      DataCell(Text('20,00')),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: !visaoTabela,
            child: SizedBox(
              height: 200.0,
              child: charts.BarChart(
                series,
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
