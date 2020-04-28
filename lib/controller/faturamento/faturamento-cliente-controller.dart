import 'package:mobx/mobx.dart';
import 'package:tms_mobile/pages/faturamento/faturamento-cliente.dart';
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
}
