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

  Http _http = Http();
  List<FaturamentoVisaoMensalDataPoint> _data = List();

  Future<bool> getVisaoMensal(ModelFiltroFaturamento filtroFaturamento) async {
    try {
      if (this._data == null || this._data.isEmpty) {
        int idEmpresa = 0;

        SharedPreferences prefs = await SharedPreferences.getInstance();
        idEmpresa = int.parse(prefs.getString("Empresa"));

        Response response = await _http.get(API_URL +
            'faturamentomensal/$idEmpresa?${filtroFaturamento.asQueryParams()}');

        if (response != null) {
          List<FaturamentoVisaoMensalDataPoint> data = response.data
              .map<FaturamentoVisaoMensalDataPoint>(
                  (json) => FaturamentoVisaoMensalDataPoint.fromJson(json))
              .toList();
          data.sort((a, b) => a.compareTo(b));

          buildSeries(
              data, filtroFaturamento.dataDe, filtroFaturamento.dataAte);
          buildTable(data, filtroFaturamento.dataDe, filtroFaturamento.dataAte);
          this._data = data;
        }
        return true;
      }

      return false;
    } on DioError catch (e) {
      print(e.message);
      return false;
    }
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

    series.add(new charts.Series<FaturamentoVisaoMensalDataPoint, DateTime>(
        id: "Ano anterior",
        seriesColor: charts.Color(a: 255, r: 41, g: 76, b: 140),
        data: data,
        domainFn: (FaturamentoVisaoMensalDataPoint ponto, _) =>
            DateTime(ponto.ano, ponto.mes),
        measureFn: (FaturamentoVisaoMensalDataPoint ponto, _) =>
            ponto.faturamentoAnterior));
  }

  void buildTable(List<FaturamentoVisaoMensalDataPoint> data, DateTime dateFrom,
      DateTime dateTo) {
    var formatoMoeda =
        new NumberFormat.compactCurrency(locale: "pt_BR", symbol: "");

    var formatoPercentual = new NumberFormat.decimalPattern("pt_BR");

    var dateFormat = DateFormat.MMM('pt_BR');

    List<int> years = buildTableColumns(dateTo, dateFrom);

    for (FaturamentoVisaoMensalDataPoint ponto in data) {
      DataRow newRow = DataRow(cells: []);

      newRow.cells.add(
        DataCell(
          Center(
            child: FittedBox(
              child: Text(
                "${ponto.sequencia + 1}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      );

      newRow.cells.add(
        DataCell(
          Center(
            child: FittedBox(
              child: Text(
                "${dateFormat.format(new DateTime(ponto.ano, ponto.mes)).toUpperCase()}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      );

      newRow.cells.add(
        DataCell(
          Center(
            child: FittedBox(
              child: Text(
                "${ponto.faturamentoPeriodo < 0 ? '-' : formatoMoeda.format(ponto.faturamentoPeriodo)}",
              ),
            ),
          ),
        ),
      );

      newRow.cells.add(
        DataCell(
          Center(
            child: FittedBox(
              child: Text(
                "${ponto.faturamentoAnterior < 0 ? '-' : formatoMoeda.format(ponto.faturamentoAnterior)}",
              ),
            ),
          ),
        ),
      );

      if (years.length > 2 && ponto.ano != dateTo.year) {
        newRow.cells.add(
          DataCell(
            Center(
              child: FittedBox(
                child: Text(
                  "-",
                ),
              ),
            ),
          ),
        );
      }

      if (years.length > 2 && ponto.ano == dateTo.year) {
        newRow.cells.add(
          DataCell(
            Center(
              child: FittedBox(
                child: Text(
                  "-",
                ),
              ),
            ),
          ),
        );
      }

      newRow.cells.add(
        DataCell(
          Center(
            child: FittedBox(
              child: Text(
                "${ponto.variacao == 1 || ponto.variacao == -1 ? '-' : (ponto.variacao < 0 ? formatoPercentual.format(-ponto.variacao) : formatoPercentual.format(ponto.variacao))}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ponto.variacao == 1 || ponto.variacao == -1
                        ? Colors.black
                        : (ponto.variacao < 0 ? Colors.red : Colors.green)),
              ),
            ),
          ),
        ),
      );

      rows.add(newRow);
    }
  }

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
        label: Center(
          child: FittedBox(
            child: Text(
              "#",
              style: tableHeaderStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        numeric: true,
      ),
    );

    columns.add(
      DataColumn(
        label: Center(
          child: FittedBox(
            child: Text(
              "MÊS",
              style: tableHeaderStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );

    columns.add(
      DataColumn(
        label: Center(
          child: FittedBox(
            child: Text(
              "${dateFrom.year - 1}(R\$)",
              style: tableHeaderStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
    years.add(dateFrom.year - 1);

    if (dateFrom.year != dateTo.year) {
      columns.add(
        DataColumn(
          label: Center(
            child: FittedBox(
              child: Text(
                "${dateFrom.year}(R\$)",
                style: tableHeaderStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      );
      years.add(dateFrom.year);
    }

    columns.add(
      DataColumn(
        label: Center(
          child: FittedBox(
            child: Text(
              "${dateTo.year}(R\$)",
              style: tableHeaderStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
    years.add(dateTo.year);

    columns.add(
      DataColumn(
        label: Center(
          child: FittedBox(
            child: Text(
              "%",
              style: tableHeaderStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
    return years;
  }
}
