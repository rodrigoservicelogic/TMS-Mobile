import 'dart:collection';
import 'dart:ffi';
import 'dart:io';

import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tms_mobile/global.dart';
import 'package:tms_mobile/models/faturametno-visao-mensal-datapoint.dart';
import 'package:tms_mobile/models/filtrofaturamento-model.dart';
import 'package:tms_mobile/pages/faturamento-mensal.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:tms_mobile/util/http_helper.dart';
part 'faturamento-mensal-controller.g.dart';

class FaturamentoVisaoMensalController = _FaturamentoVisaoMensalControllerBase
    with _$FaturamentoVisaoMensalController;

abstract class _FaturamentoVisaoMensalControllerBase with Store {
  @observable
  List<charts.Series<FaturamentoVisaoMensalDataPoint, String>> series = List();

  @observable
  List<DataColumn> columns = List();

  @observable
  List<DataRow> rows = List();

  Http _http = Http();
  List<FaturamentoVisaoMensalDataPoint> data = List();

  Future<bool> getVisaoMensal(ModelFiltroFaturamento filtroFaturamento) async {
    try {
      if (this.data == null || this.data.isEmpty) {
        int idEmpresa = 0;

        SharedPreferences prefs = await SharedPreferences.getInstance();
        idEmpresa = int.parse(prefs.getString("Empresa"));

        Response response = await _http.get(API_URL +
            'faturamentomensal/$idEmpresa?${filtroFaturamento.asQueryParams()}');

        print(API_URL +
            'faturamentomensal/$idEmpresa?${filtroFaturamento.asQueryParams()}');

        if (response != null) {
          // Iterable list = json.decode(response.data) as List;
          List<FaturamentoVisaoMensalDataPoint> data = response.data
              .map<FaturamentoVisaoMensalDataPoint>(
                  (json) => FaturamentoVisaoMensalDataPoint.fromJson(json))
              .toList();
          data.sort((a, b) => b.compareTo(a));

          buildSeries(data);
          buildTable(data, filtroFaturamento.dataDe, filtroFaturamento.dataAte);
          this.data = data;
        }
        return Future.value(true);
      }
    } on DioError catch (e) {
      print(e.message);
      return Future.value(false);
    }
  }

  void buildSeries(List<FaturamentoVisaoMensalDataPoint> data) {
    series.clear();
    HashMap<int, List<FaturamentoVisaoMensalDataPoint>> dataGroups = HashMap();

    for (var point in data) {
      if (point.ano > 0) {
        if (!dataGroups.containsKey(point.ano)) {
          dataGroups[point.ano] = List();
        }
        if (point.faturamento >= 0) {
          dataGroups[point.ano].add(point);
        }
      }
    }

    for (int ano in dataGroups.keys) {
      series.add(
        new charts.Series(
            id: ano.toString(),
            data: dataGroups[ano],
            domainFn: (FaturamentoVisaoMensalDataPoint p, _) =>
                p.mes.toString(),
            measureFn: (FaturamentoVisaoMensalDataPoint p, _) => p.faturamento),
      );
    }
  }

  void buildTable(List<FaturamentoVisaoMensalDataPoint> data, DateTime dateFrom,
      DateTime dateTo) {
    var formatoMoeda = new NumberFormat.currency(locale: "pt_BR", symbol: "");

    List<int> years = buildTable_Columns(dateTo, dateFrom);
    HashMap<int, DataRow> months = buildTable_Rows(dateFrom, dateTo);

    for (int y in years) {
      for (int m in months.keys) {
        var point = data.firstWhere((p) => p.ano == y && p.mes == m,
            orElse: () => null);
        if (point != null) {
          months[m].cells.add(
                new DataCell(
                  Text(
                    "${point.faturamento < 0 ? '-' : formatoMoeda.format(point.faturamento)}",
                  ),
                ),
              );
        }
      }
    }

    for (int m in months.keys) {
      var point =
          data.firstWhere((p) => p.ano == 0 && p.mes == m, orElse: () => null);
      if (point != null) {
        months[m].cells.add(
              new DataCell(
                Text(
                  "${point.faturamento < 0 ? '-' : formatoMoeda.format(point.faturamento)}",
                ),
              ),
            );
      }
    }

    rows = months.values.toList();
  }

  HashMap<int, DataRow> buildTable_Rows(DateTime dateFrom, DateTime dateTo) {
    HashMap<int, DataRow> months = HashMap();

    rows.clear();
    DateTime current = dateFrom;
    while (current.isBefore(dateTo)) {
      if (!months.containsKey(current.month)) {
        months[current.month] = DataRow(cells: []);
        months[current.month].cells.add(
              new DataCell(
                Text(
                  current.month.toString(),
                ),
              ),
            );
      }
      current = current.add(Duration(days: 15));
    }
    return months;
  }

  List<int> buildTable_Columns(DateTime dateTo, DateTime dateFrom) {
    columns.clear();
    List<int> years = List();

    var tableHeaderStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: Colors.black,
    );

    columns.add(
      DataColumn(
        label: Text(
          "MÊS",
          style: tableHeaderStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );

    columns.add(
      DataColumn(
        label: Text(
          "${dateTo.year}(R\$)",
          style: tableHeaderStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
    years.add(dateTo.year);

    if (dateFrom.year != dateTo.year) {
      columns.add(
        DataColumn(
          label: Text(
            "${dateFrom.year}(R\$)",
            style: tableHeaderStyle,
            textAlign: TextAlign.center,
          ),
        ),
      );
      years.add(dateFrom.year);
    }

    columns.add(
      DataColumn(
        label: Text(
          "${dateFrom.year - 1}(R\$)",
          style: tableHeaderStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
    years.add(dateFrom.year - 1);

    columns.add(
      DataColumn(
        label: Text(
          "%",
          style: tableHeaderStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
    return years;
  }

  // @action
  // getSeries() {
  //   var lista2019 = List<Dados>();
  //   lista2019.add(Dados('01', 6000000.00));
  //   lista2019.add(Dados('02', 6000000.00));
  //   lista2019.add(Dados('03', 6000000.00));

  //   var lista2020 = List<Dados>();
  //   lista2020.add(Dados('01', 4000000.00));
  //   lista2020.add(Dados('02', 4000000.00));
  //   lista2020.add(Dados('03', 4000000.00));

  //   var dummy2019 = charts.Series(
  //     id: '2019',
  //     domainFn: (Dados d, _) => d.mes,
  //     measureFn: (Dados d, _) => d.valor,
  //     data: lista2019,
  //   );

  //   var dummy2020 = charts.Series(
  //     id: '2019',
  //     domainFn: (Dados d, _) => d.mes,
  //     measureFn: (Dados d, _) => d.valor,
  //     data: lista2020,
  //   );

  //   series.clear();
  //   series.add(dummy2019);
  //   series.add(dummy2020);
  //   return series;
  // }
}

class Dados {
  final String mes;
  final double valor;

  Dados(this.mes, this.valor);
}
