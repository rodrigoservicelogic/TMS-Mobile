import 'package:mobx/mobx.dart';
part 'frota-propria-controller.g.dart';

class FrotaPropriaController = _FrotaPropriaControllerBase
    with _$FrotaPropriaController;

abstract class _FrotaPropriaControllerBase with Store {
  @observable
  List<String> motorista = List();
  @observable
  List<String> placas = List();
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
  popularListaMotorista() {
    motorista.add('Motorista 1');
    motorista.add('Motorista 2');
    motorista.add('Motorista 3');
    motorista.add('Motorista 4');
  }

  @action
  popularListaPlacas() {
    placas.add('Placa 1');
    placas.add('Placa 2');
    placas.add('Placa 3');
    placas.add('Placa 4');
  }
}
