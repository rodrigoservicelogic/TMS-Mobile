import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tms_mobile/models/FaturamentoUn.dart';
import 'package:tms_mobile/models/filtrofaturamento-model.dart';
import 'package:tms_mobile/util/http_helper.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../../global.dart';
part 'faturamento-un-controller.g.dart';

class FaturamentoUnController = FaturamentoUnControllerBase
    with _$FaturamentoUnController;

abstract class FaturamentoUnControllerBase with Store {
  @observable
  int idUsuario;

  @observable
  bool isLoad = false;

  @observable
  List<charts.Series<ListaFiliais, String>> seriesUn = List();

  @observable
  List<DataColumn> columnsUn = List();

  @observable
  List<DataRow> rowsUn = List();

  @observable
  List<charts.Series<ListaClientes, String>> seriesCli = List();

  @observable
  List<DataColumn> columnsCli = List();

  @observable
  List<DataRow> rowsCli = List();

  @observable
  FaturamentoUn faturamento = FaturamentoUn();

  Http _http = Http();

  @action
  Future<String> getFaturamento(
      ModelFiltroFaturamento filtroFaturamento) async {
    try {
      isLoad = true;
      faturamento = new FaturamentoUn();

      SharedPreferences prefs = await SharedPreferences.getInstance();
      idUsuario = prefs.getInt("Usuario");

      Response response = await _http.get(API_URL +
          'faturamento/un/$idUsuario?${filtroFaturamento.asQueryParams()}');

      if (response.data != null) {
        faturamento = FaturamentoUn.fromJson(response.data);
      }

      isLoad = false;

      return Future.value('ok');
    } on DioError catch (e) {
      isLoad = false;
      Map response = e.response.data;
      return Future.value(response["Message"]);
    }
  }

  void buildTableUn() {
    var formatoMoeda =
        new NumberFormat.compactCurrency(locale: "pt_BR", symbol: "");
    var formatoPercentual = new NumberFormat.decimalPattern("pt_BR");
    columnsUn.clear();
    rowsUn.clear();

    buildTableColumnsUn();

    if (this.faturamento != null) {
      this.faturamento.listaFiliais.forEach((element) {
        rowsUn.add(DataRow(cells: <DataCell>[
          DataCell(Text("${element.nomeFilial}")),
          DataCell(Container(
              width: 50,
              child: Text(
                  '${element.valorTotal < 0 ? '-' : formatoMoeda.format(element.valorTotal)}'))),
          DataCell(
            Text(
              "${element.perCresValor < 0 ? '-' : formatoPercentual.format(element.perCresValor)}",
              textAlign: TextAlign.center,
            ),
          )
        ]));
      });
    } else {
      rowsUn.add(DataRow(cells: <DataCell>[]));
    }
  }

  void buildTableColumnsUn() {
    columnsUn.clear();

    var tableHeaderStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: Colors.black,
    );

    columnsUn.add(
      DataColumn(
        label: Text(
          "Filial",
          style: tableHeaderStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );

    columnsUn.add(
      DataColumn(
        label: Text(
          "R\$",
          style: tableHeaderStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );

    columnsUn.add(
      DataColumn(
        label: Text(
          "%",
          style: tableHeaderStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void buildChartsUn() {
    var formatoMoeda =
        new NumberFormat.compactCurrency(locale: "pt_BR", symbol: "");

    seriesUn.clear();
    if (this.faturamento != null) {
      seriesUn.add(charts.Series(
        data: this.faturamento.listaFiliais,
        domainFn: (ListaFiliais task, _) => task.nomeFilial,
        measureFn: (ListaFiliais task, _) => task.perCresValor,
        id: 'Faturamento Und',
        labelAccessorFn: (ListaFiliais row, _) =>
            '${formatoMoeda.format(row.valorTotal)}',
      ));
    } else {
      seriesUn.add(charts.Series(
          data: <ListaFiliais>[],
          domainFn: (ListaFiliais task, _) {
            return null;
          },
          id: null,
          measureFn: (ListaFiliais task, _) {
            return null;
          }));
    }
  }

  void buildTableCli() {
    var formatoMoeda =
        new NumberFormat.compactCurrency(locale: "pt_BR", symbol: "");
    var formatoPercentual = new NumberFormat.decimalPattern("pt_BR");
    columnsCli.clear();
    rowsCli.clear();

    buildTableColumnsCli();

    if (this.faturamento != null) {
      this.faturamento.listaClientes.forEach((element) {
        rowsCli.add(DataRow(cells: <DataCell>[
          DataCell(Container(width: 90, child: Text("${element.nomeCliente}"))),
          DataCell(Container(
              width: 50,
              child: Text(
                  '${element.valorTotal < 0 ? '-' : formatoMoeda.format(element.valorTotal)}'))),
          DataCell(
            Text(
              "${element.perCresValor < 0 ? '-' : formatoPercentual.format(element.perCresValor)}",
              textAlign: TextAlign.center,
            ),
          )
        ]));
      });
    } else {
      rowsCli.add(DataRow(cells: <DataCell>[]));
    }
  }

  void buildTableColumnsCli() {
    columnsCli.clear();

    var tableHeaderStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: Colors.black,
    );

    columnsCli.add(
      DataColumn(
        label: Text(
          "Cliente",
          style: tableHeaderStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );

    columnsCli.add(
      DataColumn(
        label: Text(
          "R\$",
          style: tableHeaderStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );

    columnsCli.add(
      DataColumn(
        label: Text(
          "%",
          style: tableHeaderStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void buildChartsCli() {
    seriesCli.clear();
    if (this.faturamento != null) {
      var formatoMoeda =
          new NumberFormat.compactCurrency(locale: "pt_BR", symbol: "");

      seriesCli.add(charts.Series(
        data: this.faturamento.listaClientes,
        domainFn: (ListaClientes task, _) => task.nomeCliente.substring(0,9),
        measureFn: (ListaClientes task, _) => task.perCresValor,
        id: 'Faturamento Cli',
        labelAccessorFn: (ListaClientes row, _) =>
            '${formatoMoeda.format(row.valorTotal)}',
      ));
    } else {
      seriesCli.add(charts.Series(
          data: <ListaClientes>[],
          domainFn: (ListaClientes task, _) {
            return null;
          },
          id: null,
          measureFn: (ListaClientes task, _) {
            return null;
          }));
    }
  }  
}
