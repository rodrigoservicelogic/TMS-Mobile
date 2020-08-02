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
  bool isLoad;

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

  @action
  Future<String> getListaFilial() async {
    try {
      isLoad = true;
      filiais = [];
      tiposFrete = [];
      clientes = [];

      SharedPreferences prefs = await SharedPreferences.getInstance();
      int idEmpresa = int.parse(prefs.getString("Empresa"));

      Http _http = Http();

      Response response =
          await _http.get(API_URL + "empresa/unidade-negocio/$idEmpresa");

      if (response.data != null) {
        Filial filial = Filial();
        filial.idFilial = 0;
        filial.nomeFantasia = "Todos";

        filiais.add(filial);
        
        for (Map map in response.data) {
          filiais.add(Filial.fromJson(map));
        }

        selectedUnidade = 0;
      }

      Response responseTipoFrete =
          await _http.get(API_URL + "faturamento/tipo-transporte");

      if (responseTipoFrete.data != null) {
        tiposFrete.add("Todos");
        for (String map in responseTipoFrete.data) {
          tiposFrete.add(map);
        }

        selectedFrete = "Todos";
      }

      Response responseClientes =
          await _http.get(API_URL + "faturamento/clientes");

      if (responseClientes.data != null) {
        ClienteFaturamento cliente = ClienteFaturamento();
        cliente.codCliente = "0";
        cliente.nomeCliente = "Todos";

        clientes.add(cliente);
        
        for (Map map in responseClientes.data) {
          clientes.add(ClienteFaturamento.fromJson(map));
        }

        selectedCliente = "0";
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
