import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tms_mobile/global.dart';
import 'package:tms_mobile/models/filtro_frota_propria_model.dart';
import 'package:tms_mobile/models/frota_propria.dart';
import 'package:tms_mobile/models/motorista.dart';
import 'package:tms_mobile/util/http_helper.dart';
part 'frota-propria-controller.g.dart';

class FrotaPropriaController = _FrotaPropriaControllerBase
    with _$FrotaPropriaController;

abstract class _FrotaPropriaControllerBase with Store {
  @observable
  String motoristaSelected;
  @observable
  String placaSelected;
  @observable
  DateTime dataInicial;
  @observable
  DateTime dataFinal;
  @observable
  List<Motorista> motorista = List();
  @observable
  List<String> placas = List();
  @observable
  List<FrotaPropria> listaFrotaPropria = List();
  @observable
  bool isLoad = false;
  @observable
  String receita = "50.000,00";
  @observable
  String despesa = "30.000,00";
  @observable
  String impostoVal = "10.000,00";
  @observable
  String impostoPerc = "33%";
  @observable
  String custoFixoVal = "15.000,00";
  @observable
  String custoFixoPerc = "50%";
  @observable
  String custoVariavelVal = "15.000,00";
  @observable
  String custoVariavelPerc = "16%";
  @observable
  String resultadoVal = "20.000,00";
  @observable
  String resultadoPerc = "40,00";

  @action
  void changeMotorista(String value) => motoristaSelected = value;

  @action
  void changePlaca(String value) => placaSelected = value;

  @action
  void changeDataInicial(DateTime value) => dataInicial = value;

  @action
  void changeDataFinal(DateTime value) => dataFinal = value;

  @action
  clearSelectedMotorista() {
    motoristaSelected = null;
  }

  @action
  clearSelectedPlaca() {
    placaSelected = null;
  }

  @action
  Future getListaMotorista() async {
    try {
      isLoad = true;
      motorista = [];

      Http _http = Http();

      Response response = await _http.get(API_URL + 'frota-propria/motoristas');

      if (response.data != null) {
        for (Map m in response.data) {
          motorista.add(Motorista.fromJson(m));
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
      placas = [];

      Http _http = Http();

      Response response = await _http.get(API_URL + 'frota-propria/placas');

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
  Future filtrar(ModelFiltroFrotaPropria filtro) async {
    try {
      isLoad = true;
      listaFrotaPropria = [];

      Http _http = Http();
      SharedPreferences prefs = await SharedPreferences.getInstance();

      filtro.idFilial = int.parse(prefs.getString("Empresa"));

      Response response = await _http.post(API_URL + 'frota-propria/filtrar', filtro.toMap());

      if(response.data != null) {
        for (Map map in response.data) {
          listaFrotaPropria.add(FrotaPropria.fromJson(map));
        }
      }

      isLoad = false;
    } catch (e) {
      isLoad = false;
      print(e.toString());
    }
  }
}
