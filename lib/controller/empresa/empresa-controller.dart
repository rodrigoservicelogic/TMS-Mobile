import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tms_mobile/models/filtro_resultado_empresa.dart';
import 'package:tms_mobile/models/resultado_empresa.dart';
import 'package:tms_mobile/util/http_helper.dart';

import '../../global.dart';
part 'empresa-controller.g.dart';

class EmpresaController = EmpresaControllerBase with _$EmpresaController;

abstract class EmpresaControllerBase with Store {
  @observable
  bool isLoad;
  @observable
  List<String> regimes = List();
  @observable
  List empresas = List();
  @observable
  List<ResultadoEmpresa> resultadoEmpresa = List();
  @observable
  String regimeSelected;
  @observable
  DateTime dataInicial;
  @observable
  DateTime dataFinal;

  @action
  changeRegime(String value) => regimeSelected = value;

  @action
  changeDataInicial(DateTime value) => dataInicial = value;

  @action
  changeDataFinal(DateTime value) => dataFinal = value;

  @action
  Future getListaRegimes() async {
    try {
      isLoad = true;
      regimes = [];

      Http _http = Http();

      Response response = await _http.get(API_URL + 'resultado-empresa/regimes');

      if (response.data != null) {
        regimes.add("Todos");

        for (String m in response.data) {
          regimes.add(m);
        }

        regimeSelected = "Todos";
      }

      isLoad = false;
    } catch (e) {
      isLoad = false;
      print(e.toString());
    }
  }

  @action
  Future filtrar(ModelFiltroResultadoEmpresa filtro) async {
    try {
      isLoad = true;
      resultadoEmpresa = [];

      Http _http = Http();
      SharedPreferences prefs = await SharedPreferences.getInstance();

      filtro.idFilial = int.parse(prefs.getString("Empresa"));
      filtro.regime = filtro.regime != null && filtro.regime != "" ? filtro.regime : "Por Competência";

      Response response = await _http.post(API_URL + 'resultado-empresa/filtrar', filtro.toMap());

      if(response.data != null) {
        for (Map map in response.data) {
          resultadoEmpresa.add(ResultadoEmpresa.fromJson(map));
        }
      }

      isLoad = false;
    } catch (e) {
      isLoad = false;
      print(e.toString());
    }
  }
}
