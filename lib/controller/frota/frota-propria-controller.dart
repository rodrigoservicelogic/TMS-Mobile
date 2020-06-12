import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:tms_mobile/global.dart';
import 'package:tms_mobile/models/motorista.dart';
import 'package:tms_mobile/util/http_helper.dart';
part 'frota-propria-controller.g.dart';

class FrotaPropriaController = _FrotaPropriaControllerBase
    with _$FrotaPropriaController;

abstract class _FrotaPropriaControllerBase with Store {
  @observable
  List<Motorista> motorista = List();
  @observable
  List<String> placas = List();
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
  Future getListaMotorista() async {
    try {
      isLoad = true;

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
}
