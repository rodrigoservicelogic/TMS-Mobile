import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tms_mobile/models/agregado.dart';
import 'package:tms_mobile/models/filtro_agregado_model.dart';
import 'package:tms_mobile/models/resultado_agregado.dart';
import 'package:tms_mobile/util/http_helper.dart';

import '../../global.dart';
part 'agregado-controller.g.dart';

class AgregadoController = AgregadoControllerBase with _$AgregadoController;

abstract class AgregadoControllerBase with Store {
  @observable
  bool isLoad = false;
  @observable
  List<Agregado> agregados = List();
  @observable
  List<String> placas = List();
  @observable
  Agregado agregadoSelected;
  @observable
  String placaSelected;
  @observable
  DateTime dataInicial;
  @observable
  DateTime dataFinal;
  @observable
  List<ResultadoAgregado> listaAgregado = List();

  @action
  changeAgregado(Agregado value) => agregadoSelected = value;

  @action
  changePlaca(String value) => placaSelected = value;

  @action
  changeDataInicial(DateTime value) => dataInicial = value;

  @action
  changeDataFinal(DateTime value) => dataFinal = value;

  @action
  Future getListaAgregado() async {
    try {
      isLoad = true;

      Http _http = Http();

      Response response = await _http.get(API_URL + 'resultado-agregado/agregados');

      if (response.data != null) {
        for (Map m in response.data) {
          agregados.add(Agregado.fromJson(m));
        }
      }

      isLoad = false;
    } catch (e) {
      isLoad = false;
      print(e.toString());
    }
  }

  @action
  Future getListaPlacas() async {
    try {
      isLoad = true;

      Http _http = Http();

      Response response = await _http.get(API_URL + 'resultado-agregado/placas');

      if (response.data != null) {
        for (String m in response.data) {
          placas.add(m);
        }
      }

      isLoad = false;
    } catch (e) {
      isLoad = false;
      print(e.toString());
    }
  }

  @action
  Future filtrar(ModelFiltroAgregado filtro) async {
    try {
      isLoad = true;
      listaAgregado = [];

      Http _http = Http();
      SharedPreferences prefs = await SharedPreferences.getInstance();

      filtro.idFilial = int.parse(prefs.getString("Empresa"));

      Response response = await _http.post(API_URL + 'resultado-agregado/filtrar', filtro.toMap());

      if(response.data != null) {
        for (Map map in response.data) {
          listaAgregado.add(ResultadoAgregado.fromJson(map));
        }
      }

      isLoad = false;
    } catch (e) {
      isLoad = false;
      print(e.toString());
    }
  }

}