import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tms_mobile/models/cliente-faturamento.dart';
import 'package:tms_mobile/models/filial-model.dart';
import 'package:tms_mobile/pages/faturamento/faturamento-cliente.dart';
import 'package:tms_mobile/util/http_helper.dart';

import '../../global.dart';
part 'faturamento-cliente-controller.g.dart';

class FaturamentoClienteController = _FaturamentoClienteControllerBase
    with _$FaturamentoClienteController;

abstract class _FaturamentoClienteControllerBase with Store {
  @observable
  List<String> tipoCliente = List();

  @observable
  List<String> valorReal = List();

  @observable
  List<String> valorPercent = List();

  @observable
  String valor = "50.000,00";

  @observable
  String valorPerc = "30.000,00";

  @observable
  String anoAtual = "2020(R\$)";

  @observable
  List<Dados> listaAnos = List();

  @observable
  bool isLoad = false;

  @observable
  List<Filial> filiais = List();

  @observable
  List<String> tiposFrete = List();

  @observable
  List<ClienteFaturamento> clientes = List();

  @observable
  int selectedUnidade;

  @observable
  String selectedFrete;

  @observable
  String selectedCliente;

  @action
  popularListaAnos() {
    listaAnos.add(Dados('2016', 12));
    listaAnos.add(Dados('2017', 15));
    listaAnos.add(Dados('2020', 10));
  }

  @action
  popularListaTipoCliente() {
    tipoCliente.add('Tipo 1');
    tipoCliente.add('Tipo 2');
    tipoCliente.add('Tipo 3');
  }

  @action
  popularListaValorReal() {
    valorPercent.add('55,00');
    valorPercent.add('55,00');
    valorPercent.add('12,00');
  }

  @action
  popularListaValorPercent() {
    valorPercent.add('10%');
    valorPercent.add('15%');
    valorPercent.add('25%');
  }

  @action
  changeUnidadeNegocio(int value) {
    selectedUnidade = value;
    selectedUnidade = selectedUnidade;
  }

  @action
  clearSelectedUnidadeNegocio() {
    selectedUnidade = null;
    selectedUnidade = selectedUnidade;
  }

  @action
  changeTipoFrete(String value) {
    selectedFrete = value;
    selectedFrete = selectedFrete;
  }

  @action
  clearSelectedTipoFrete() {
    selectedFrete = null;
    selectedFrete = selectedFrete;
  }

  @action
  changeCliente(String value) {
    selectedCliente = value;
    selectedCliente = selectedCliente;
  }

  @action
  clearSelectedCliente() {
    selectedCliente = null;
    selectedCliente = selectedCliente;
  }

  Future getListaFilial() async {
    try {
      isLoad = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int idEmpresa = int.parse(prefs.getString("Empresa"));

      Http _http = Http();

      Response response =
          await _http.get(API_URL + "empresa/unidade-negocio/$idEmpresa");

      if (response.data != null) {
        for (Map map in response.data) {
          filiais.add(Filial.fromJson(map));
        }
      }

      Response responseTipoFrete =
          await _http.get(API_URL + "faturamento/tipo-frete");

      if (responseTipoFrete.data != null) {
        for (String map in responseTipoFrete.data) {
          tiposFrete.add(map);
        }
      }

      Response responseClientes =
          await _http.get(API_URL + "faturamento/clientes");

      if (responseClientes.data != null) {
        for (Map map in responseClientes.data) {
          clientes.add(ClienteFaturamento.fromJson(map));
        }
      }

      isLoad = false;

      return "OK";
    } catch (e) {
      isLoad = false;
      print(e);

      return "Ocorreu um erro ao obter as listas!";
    }
  }
}
