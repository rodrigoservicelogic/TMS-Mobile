import 'package:charts_flutter/flutter.dart' as charts;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tms_mobile/global.dart';
import 'package:tms_mobile/models/faturametno-visao-mensal-datapoint.dart';
import 'package:tms_mobile/models/filtrofaturamento-model.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:tms_mobile/util/http_helper.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
part 'faturamento-mensal-controller.g.dart';

class FaturamentoVisaoMensalController = _FaturamentoVisaoMensalControllerBase
    with _$FaturamentoVisaoMensalController;

abstract class _FaturamentoVisaoMensalControllerBase with Store {
  @observable
  List<charts.Series<FaturamentoVisaoMensalDataPoint, DateTime>> series =
      List();

  @observable
  List<DataColumn> columns = List();

  @observable
  List<DataRow> rows = List();

  @observable
  num totalPeriodo = 0;

  @observable
  bool sortAscMes = true;

  Http _http = Http();
  List<FaturamentoVisaoMensalDataPoint> _data = List();

  Future<bool> getVisaoMensal(ModelFiltroFaturamento filtroFaturamento) async {
    try {
      //if (this._data == null || this._data.isEmpty) {
      int idEmpresa = 0;
      this._data = [];

      SharedPreferences prefs = await SharedPreferences.getInstance();
      idEmpresa = prefs.getInt("Empresa");

      Response response = await _http.get(API_URL +
          'faturamentomensal/$idEmpresa?${filtroFaturamento.asQueryParams()}');

      if (response != null) {
        List<FaturamentoVisaoMensalDataPoint> data = response.data
            .map<FaturamentoVisaoMensalDataPoint>(
                (json) => FaturamentoVisaoMensalDataPoint.fromJson(json))
            .toList();
        data.sort((a, b) => a.mes.compareTo(b.mes));

        buildSeries(data, filtroFaturamento.dataDe, filtroFaturamento.dataAte);
        buildTable(data, filtroFaturamento.dataDe, filtroFaturamento.dataAte);
        this._data = data;
      }
      return true;
      //}

      //return false;
    } on DioError catch (e) {
      print(e.message);
      return false;
    }
  }

  num calculaPercentual(num valor) {
    num percentual = 0;

    percentual = (valor * 100) / totalPeriodo;

    return percentual;
  }

  void buildSeries(List<FaturamentoVisaoMensalDataPoint> data,
      DateTime dateFrom, DateTime dateTo) {
    series.clear();

    series.add(new charts.Series<FaturamentoVisaoMensalDataPoint, DateTime>(
        id: "Faturamento mensal",
        seriesColor: charts.Color(a: 255, r: 245, g: 134, b: 51),
        data: data,
        domainFn: (FaturamentoVisaoMensalDataPoint ponto, _) =>
            DateTime(ponto.ano, ponto.mes),
        measureFn: (FaturamentoVisaoMensalDataPoint ponto, _) =>
            ponto.faturamentoPeriodo));

    // series.add(new charts.Series<FaturamentoVisaoMensalDataPoint, DateTime>(
    //     id: "Peso (T)",
    //     seriesColor: charts.Color(a: 255, r: 41, g: 76, b: 140),
    //     data: data,
    //     domainFn: (FaturamentoVisaoMensalDataPoint ponto, _) =>
    //         DateTime(ponto.ano, ponto.mes),
    //     measureFn: (FaturamentoVisaoMensalDataPoint ponto, _) =>
    //         ponto.peso));
  }

  @action
  void buildTable(List<FaturamentoVisaoMensalDataPoint> data, DateTime dateFrom,
      DateTime dateTo) {
    rows = [];
    var formatoMoeda =
        new NumberFormat.compactCurrency(locale: "pt_BR", symbol: "");
    var formatoValor = NumberFormat.currency(locale: "pt_BR", symbol: "");

    var formatoPercentual = new NumberFormat.decimalPattern("pt_BR");

    var dateFormat = DateFormat.MMM('pt_BR');

    List<int> years = buildTableColumns(dateTo, dateFrom);
    num total = 0;

    for (FaturamentoVisaoMensalDataPoint ponto in data) {
      total += ponto.faturamentoPeriodo;
    }

    totalPeriodo = total;

    for (FaturamentoVisaoMensalDataPoint ponto in data) {
      DataRow newRow = DataRow(cells: []);
      num pesoTon = ponto.peso / 1000;

      //MES
      newRow.cells.add(
        DataCell(
          Container(
            child: Text(
              "${dateFormat.format(new DateTime(ponto.ano, ponto.mes)).toUpperCase()}/${ponto.ano}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );

      //PESO
      newRow.cells.add(
        DataCell(
          Text(
            "${formatoValor.format(pesoTon)}",
          ),
        ),
      );

      //VALOR
      newRow.cells.add(
        DataCell(
          Text(
            "${ponto.faturamentoPeriodo < 0 ? '-' : toCurrencyString(ponto.faturamentoPeriodo.toStringAsFixed(2), thousandSeparator: ThousandSeparator.Period, shorteningPolicy: ShorteningPolicy.RoundToThousands)}",
          ),
        ),
      );

      rows.add(newRow);
    }

    rows = rows;
  }

  @action
  List<int> buildTableColumns(DateTime dateTo, DateTime dateFrom) {
    columns.clear();
    List<int> years = List();

    var tableHeaderStyle = TextStyle(
      fontWeight: FontWeight.bold,
      // fontSize: 12,
      color: Colors.black,
    );

    columns.add(
      DataColumn(
          label: Container(
            child: Text(
                "MÊS/ANO",
                style: tableHeaderStyle,
              ),
          ),
          onSort: (columnIndex, sortAscending) {
            sortAscMes = !sortAscMes;

            List<FaturamentoVisaoMensalDataPoint> faturamento = List();
            faturamento = List.from(_data);

            if (sortAscMes) {
              faturamento.sort((a, b) => b.mes.compareTo(a.mes));
            } else {
              faturamento.sort((a, b) => a.mes.compareTo(b.mes));
            }

            _data = faturamento;

            buildTable(_data, dateFrom, dateTo);
          }),
    );

    columns.add(
      DataColumn(
        label: Center(
          child: FittedBox(
            child: Text(
              "Peso (T)",
              style: tableHeaderStyle,
            ),
          ),
        ),
        numeric: true,
        onSort: (columnIndex, sortAscending) {
            sortAscMes = !sortAscMes;

            List<FaturamentoVisaoMensalDataPoint> faturamento = List();
            faturamento = List.from(_data);

            if (sortAscMes) {
              faturamento.sort((a, b) => b.peso.compareTo(a.peso));
            } else {
              faturamento.sort((a, b) => a.peso.compareTo(b.peso));
            }

            _data = faturamento;

            buildTable(_data, dateFrom, dateTo);
          }
      ),
    );

    columns.add(
      DataColumn(
          label: Center(
            child: FittedBox(
              child: Text(
                "R\$",
                style: tableHeaderStyle,
              ),
            ),
          ),
          numeric: true,
          onSort: (columnIndex, sortAscending) {
            sortAscMes = !sortAscMes;

            List<FaturamentoVisaoMensalDataPoint> faturamento = List();
            faturamento = List.from(_data);

            if (sortAscMes) {
              faturamento.sort((a, b) => b.faturamentoPeriodo.compareTo(a.faturamentoPeriodo));
            } else {
              faturamento.sort((a, b) => a.faturamentoPeriodo.compareTo(b.faturamentoPeriodo));
            }

            _data = faturamento;

            buildTable(_data, dateFrom, dateTo);
          }),
    );
    years.add(dateTo.year);

    return years;
  }
}
