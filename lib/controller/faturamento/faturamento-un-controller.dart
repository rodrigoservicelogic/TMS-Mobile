import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
  List<charts.Series<FaturamentoUn, String>> series = List();

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
}
