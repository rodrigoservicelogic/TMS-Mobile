import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:tms_mobile/models/faturamento.dart';
import 'package:tms_mobile/util/http_helper.dart';

import '../../global.dart';
part 'faturamento-un-controller.g.dart';

class FaturamentoUnController = FaturamentoUnControllerBase
    with _$FaturamentoUnController;

abstract class FaturamentoUnControllerBase with Store {
  Http _http = Http();

  @observable
  List<Faturamento> faturamentos = List();

  Future getFaturamento() async {
    try {
      Response response = await _http.get(API_URL +
          'faturamento?idUsuario=1&idfilial=1&tipoFrete=SUBCONTRATAÇÃO&codCliente=254&dataDe=2014-11-21T00:00:00&dataAte=2014-11-21T00:00:00');
      if (response.data != null) {
        for (Map data in response.data) {
          faturamentos.add(Faturamento.fromJson(data));
        }
      }
      return "OK";
    } catch (e) {}
  }
}
