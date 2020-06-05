import 'dart:collection';

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
  List<charts.Series<ListaFiliais, String>> series = List();

  @observable
  List<DataColumn> columns = List();

  @observable
  List<DataRow> rows = List();

  @observable
  FaturamentoUn faturamento = FaturamentoUn();

  Http _http = Http();

  @action
  Future<bool> getFaturamento(ModelFiltroFaturamento filtroFaturamento) async {
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

      return Future.value(true);
    } on DioError catch (e) {
      isLoad = false;
      print(e.message);
      return Future.value(false);
    }
  }

  void buildTable() {
    var formatoMoeda =
        new NumberFormat.compactCurrency(locale: "pt_BR", symbol: "");
    var formatoPercentual = new NumberFormat.decimalPattern("pt_BR");
    columns.clear();
    rows.clear();

    buildTableColumns();

    if (this.faturamento != null) {
      this.faturamento.listaFiliais.forEach((element) {
        rows.add(DataRow(cells: <DataCell>[
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
      rows.add(DataRow(cells: <DataCell>[]));
    }
  }

  void buildTableColumns() {
    columns.clear();

    var tableHeaderStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: Colors.black,
    );

    columns.add(
      DataColumn(
        label: Text(
          "Filial",
          style: tableHeaderStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );

    columns.add(
      DataColumn(
        label: Text(
          "R\$",
          style: tableHeaderStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );

    columns.add(
      DataColumn(
        label: Text(
          "%",
          style: tableHeaderStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void buildCharts() {
    var formatoMoeda =
        new NumberFormat.compactCurrency(locale: "pt_BR", symbol: "");

    series.clear();
    if (this.faturamento != null) {
      series.add(charts.Series(
        data: this.faturamento.listaFiliais,
        domainFn: (ListaFiliais task, _) => task.nomeFilial,
        measureFn: (ListaFiliais task, _) => task.perCresValor,
        id: 'Faturamento Und',
        labelAccessorFn: (ListaFiliais row, _) =>
            '${formatoMoeda.format(row.valorTotal)}',
      ));
    } else {
      series.add(charts.Series(
          data: <ListaFiliais>[],
          domainFn: (ListaFiliais task, _) {},
          id: null,
          measureFn: (ListaFiliais task, _) {}));
    }
  }
}
