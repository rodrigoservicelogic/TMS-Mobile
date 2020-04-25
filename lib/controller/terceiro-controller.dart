import 'package:mobx/mobx.dart';
part 'terceiro-controller.g.dart';

class TerceiroController = AgregadoControllerBase with _$TerceiroController;

abstract class AgregadoControllerBase with Store {
  @observable
  List<String> terceiros = List();
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
  String ferePagoTerVal = "20.000,00";
  @observable
  String ferePagoTerPerc = "66%";
  @observable
  String resultadoVal = "20.000,00";
  @observable
  String resultadoPerc = "40,00";


  @action
  popularListaTerceiros() {
    terceiros.add('Terceiro 1');
    terceiros.add('Terceiro 2');
    terceiros.add('Terceiro 3');
    terceiros.add('Terceiro 4');
  }

  @action
  popularListaPlacas() {
    placas.add('Placa 1');
    placas.add('Placa 2');
    placas.add('Placa 3');
    placas.add('Placa 4');
  }

}