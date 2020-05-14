import 'dart:collection';
import 'dart:io';

import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tms_mobile/global.dart';
import 'package:tms_mobile/models/faturametno-visao-mensal-datapoint.dart';
import 'package:tms_mobile/models/filtrofaturamento-model.dart';
import 'package:tms_mobile/pages/faturamento-mensal.dart';
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

  Future getVisaoMensal(
      int idEmpresa, ModelFiltroFaturamento filtroFaturamento) async {
    try {
      Response response = await _http.get(API_URL +
          'faturamentomensal/$idEmpresa?${filtroFaturamento.asQueryParams()}');

      if (response != null) {
        Iterable list = json.decode(response.data);
        List<FaturamentoVisaoMensalDataPoint> data =
            list.map((model) => FaturamentoVisaoMensalDataPoint.fromMap(model));
        data.sort((a,b) => b.ano.compareTo(a.ano));

        var tableHeaderStyle = TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
          color: Colors.black,
        );

        columns.clear();
        columns.add(
          DataColumn(
            label: Text(
              "MÊS",
              style: tableHeaderStyle,
              textAlign: TextAlign.center,
            ),
          ),
        );

        HashMap<int, DataRow> dataRows = HashMap();
        HashMap<int, List<FaturamentoVisaoMensalDataPoint>> dataGroups =
            HashMap();
        for (FaturamentoVisaoMensalDataPoint point in data) {
          if (!dataGroups.containsKey(point.ano)) {
            dataGroups[point.ano] = List();
          }

          if (!dataRows.containsKey(point.mes)) {
            dataRows[point.mes] = new DataRow(cells: []);
            dataRows[point.mes].cells.add(
                  new DataCell(
                    Text(
                      point.mes.toString(),
                    ),
                  ),
                );
          }

          dataGroups[point.ano].add(point);
          dataRows[point.mes].cells.add(
                new DataCell(
                  Text("${point.faturamento != null ? point.faturamento.toString(): '-'}"),
                ),
              );
        }

        List<int> sortedAnos = dataGroups.keys;
        sortedAnos.sort((a, b) => b.compareTo(a));
        series.clear();
        for (int ano in sortedAnos) {
          columns.add(
            DataColumn(
              label: Text(
                "$ano(R\$)",
                style: tableHeaderStyle,
                textAlign: TextAlign.center,
              ),
            ),
          );
          series.add(
            new charts.Series(
                id: ano.toString(),
                data: dataGroups[ano],
                domainFn: (FaturamentoVisaoMensalDataPoint p, _) =>
                    p.mes.toString(),
                measureFn: (FaturamentoVisaoMensalDataPoint p, _) =>
                    p.faturamento),
          );
        }
        rows = dataRows.values;
      }
    } on DioError catch (e) {
      print(e.message);
    }
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
