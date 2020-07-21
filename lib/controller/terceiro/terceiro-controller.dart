import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tms_mobile/global.dart';
import 'package:tms_mobile/models/filtro_terceiro_model.dart';
import 'package:tms_mobile/models/resultado_terceiro.dart';
import 'package:tms_mobile/models/terceiro.dart';
import 'package:tms_mobile/util/http_helper.dart';
part 'terceiro-controller.g.dart';

class TerceiroController = TerceiroControllerBase with _$TerceiroController;

abstract class TerceiroControllerBase with Store {
  @observable
  bool isLoad;
  @observable
  List<Terceiro> terceiros = List();
  @observable
  List<String> placas = List();
  @observable
  List<ResultadoTerceiro> resultadoterceiro = List();
  @observable
  String placaSelected;
  @observable
  Terceiro terceiroSelected;
  @observable
  DateTime dataInicial;
  @observable
  DateTime dataFinal;

  @action
  changePlaca(String value) => placaSelected = value;

  @action
  changeTerceiro(Terceiro value) => terceiroSelected = value;

  @action
  changeDataInicial(DateTime value) => dataInicial = value;

  @action
  changeDataFinal(DateTime value) => dataFinal = value;

  @action
  Future getListaTerceiros() async {
    try {
      isLoad = true;

      Http _http = Http();

      Response response = await _http.get(API_URL + 'terceiros/terceiros');

      if (response.data != null) {
        for (Map m in response.data) {
          terceiros.add(Terceiro.fromJson(m));
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

      Response response = await _http.get(API_URL + 'terceiros/placas');

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
  Future filtrar(ModelFiltroTerceiro filtro) async {
    try {
      isLoad = true;
      resultadoterceiro = [];

      Http _http = Http();
      SharedPreferences prefs = await SharedPreferences.getInstance();

      filtro.idFilial = int.parse(prefs.getString("Empresa"));

      Response response = await _http.post(API_URL + 'terceiros/filtrar', filtro.toMap());

      if(response.data != null) {
        for (Map map in response.data) {
          resultadoterceiro.add(ResultadoTerceiro.fromJson(map));
        }
      }

      if(resultadoterceiro.length > 1) {
        num totalReceita = 0;
        num totalDespesa = 0;
        num totalImpostos = 0;
        num totalFrete = 0;
        num totalResultado = 0;
        ResultadoTerceiro resultado = ResultadoTerceiro();

        for (ResultadoTerceiro terceiro in resultadoterceiro) {
          totalReceita += terceiro.receita;
          totalDespesa += terceiro.despesa;
          totalImpostos += terceiro.impostos;
          totalFrete += terceiro.freteTerceiros;
          totalResultado += terceiro.resultado;
        }

        resultado.receita = totalReceita;
        resultado.despesa = totalDespesa;
        resultado.impostos = totalImpostos;
        resultado.freteTerceiros = totalFrete;
        resultado.resultado = totalResultado;

        resultadoterceiro = [];
        resultadoterceiro.add(resultado);
      }

      isLoad = false;
    } catch (e) {
      isLoad = false;
      print(e.toString());
    }
  }

}