import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_multi_formatter/formatters/money_input_formatter.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tms_mobile/global.dart';
import 'package:tms_mobile/models/filtrofaturamento-model.dart';
import 'package:tms_mobile/models/grupo-cliente-faturamento.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:tms_mobile/util/http_helper.dart';
part 'faturamento-grupo-cliente-controller.g.dart';

class FaturamentoGrupoClienteController = _FaturamentoGrupoClienteControllerBase
    with _$FaturamentoGrupoClienteController;

abstract class _FaturamentoGrupoClienteControllerBase with Store {
  @observable
  List<GrupoClienteFaturamento> grupoCliente = List();

  @observable
  List<charts.Series<GrupoClienteFaturamento, String>> series = List();

  @observable
  List<DataColumn> columns = List();

  @observable
  List<DataRow> rows = List();

  @observable
  bool sortAsc = true;

  Http _http = Http();

  @action
  Future<String> getVisaoGrupoCliente(
      ModelFiltroFaturamento filtroFaturamento) async {
    try {
      grupoCliente = List();

      SharedPreferences prefs = await SharedPreferences.getInstance();
      int idEmpresa = prefs.getInt("Empresa");

      Response response = await _http.get(API_URL +
          'faturamento/grupo-cliente/$idEmpresa?${filtroFaturamento.asQueryParams()}');

      if (response.data != null) {
        for(Map map in response.data) {
          grupoCliente.add(GrupoClienteFaturamento.fromJson(map));
        }
      }

      buildTable();
      buildChart();

      return Future.value('ok');
    } on DioError catch (e) {
      Map response = e.response.data;
      return Future.value(response["Message"]);
    }
  }

  @action
  buildTable() {
    var formatoMoeda =
        new NumberFormat.compactCurrency(locale: "pt_BR", symbol: "");
    var formatoPercentual = new NumberFormat.decimalPattern("pt_BR");
    num total = 0;

    columns.clear();
    rows.clear();

    buildTableColumn();

    for (GrupoClienteFaturamento grupo in grupoCliente) {
      total += grupo.valor;
    }

    if (grupoCliente != null) {
      grupoCliente.forEach((element) {
        rows.add(DataRow(cells: <DataCell>[
          DataCell(Container(
            width: 80,
              child: Text('${element.nomeGrupoCliente}'))),
          DataCell(Container(
              child: Text(
                  '${element.totalPeso < 0 ? '-' : (element.totalPeso / 1000).toStringAsFixed(2)}',
                  textAlign: TextAlign.end,))),
          DataCell(Container(
              child: Text(
                  '${element.valor < 0 ? '-' : toCurrencyString(element.valor.toStringAsFixed(2), thousandSeparator: ThousandSeparator.Period, shorteningPolicy: ShorteningPolicy.RoundToThousands)}',
                  textAlign: TextAlign.end,))),
          DataCell(
            Container(
              child: Text(
                "${calculaPercentual(element.valor, total) < 0 ? '-' : formatoPercentual.format(calculaPercentual(element.valor, total))}",
                textAlign: TextAlign.end,
              ),
            ),
          )
        ]));
      });

      rows = rows;
    }
  }

  @action
  buildTableColumn() {
    columns.clear();

    var tableHeaderStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: Colors.black,
    );

    columns.add(
      DataColumn(
          label: Text(
            "Grupo Cliente",
            style: tableHeaderStyle,
            textAlign: TextAlign.center,
          ),
          onSort: (columnIndex, sortAscending) {
            sortAsc = !sortAsc;

            List<GrupoClienteFaturamento> lista = List();
            lista = List.from(grupoCliente);

            if (sortAsc) {
              lista.sort(
                  (a, b) => b.nomeGrupoCliente.compareTo(a.nomeGrupoCliente));
            } else {
              lista.sort(
                  (a, b) => a.nomeGrupoCliente.compareTo(b.nomeGrupoCliente));
            }

            grupoCliente = lista;

            buildTable();
          }),
    );

    columns.add(
      DataColumn(
          label: Text(
            "Peso (T)",
            style: tableHeaderStyle,
            textAlign: TextAlign.center,
          ),
          numeric: true,
          onSort: (columnIndex, sortAscending) {
            sortAsc = !sortAsc;

            List<GrupoClienteFaturamento> lista = List();
            lista = List.from(grupoCliente);

            if (sortAsc) {
              lista.sort((a, b) => b.totalPeso.compareTo(a.totalPeso));
            } else {
              lista.sort((a, b) => a.totalPeso.compareTo(b.totalPeso));
            }

            grupoCliente = lista;

            buildTable();
          }),
    );

    columns.add(
      DataColumn(
          label: Text(
            "R\$",
            style: tableHeaderStyle,
            textAlign: TextAlign.center,
          ),
          numeric: true,
          onSort: (columnIndex, sortAscending) {
            sortAsc = !sortAsc;

            List<GrupoClienteFaturamento> lista = List();
            lista = List.from(grupoCliente);

            if (sortAsc) {
              lista.sort((a, b) => b.valor.compareTo(a.valor));
            } else {
              lista.sort((a, b) => a.valor.compareTo(b.valor));
            }

            grupoCliente = lista;

            buildTable();
          }),
    );

    columns.add(
      DataColumn(
        label: Text(
          "%",
          style: tableHeaderStyle,
          textAlign: TextAlign.center,
        ),
        numeric: true
      ),
    );
  }

  @action
  buildChart() {
    series.clear();
    if (grupoCliente != null) {
      var formatoMoeda =
          new NumberFormat.compactCurrency(locale: "pt_BR", symbol: "");

      series.add(charts.Series(
        data: grupoCliente,
        domainFn: (GrupoClienteFaturamento task, _) => task.nomeGrupoCliente,
        measureFn: (GrupoClienteFaturamento task, _) => task.valor,
        id: 'Faturamento Und',
        labelAccessorFn: (GrupoClienteFaturamento row, _) =>
            '${toCurrencyString(row.valor.toStringAsFixed(2), thousandSeparator: ThousandSeparator.Period, shorteningPolicy: ShorteningPolicy.RoundToThousands)}',
      ));
    } else {
      series.add(charts.Series(
          data: <GrupoClienteFaturamento>[],
          domainFn: (GrupoClienteFaturamento task, _) {
            return null;
          },
          id: null,
          measureFn: (GrupoClienteFaturamento task, _) {
            return null;
          }));
    }
  }

  num calculaPercentual(num valor, num total) {
    num percentual = 0;

    percentual = (valor * 100) / total;

    return percentual;
  }
}
