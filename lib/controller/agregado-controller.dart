import 'package:mobx/mobx.dart';
part 'agregado-controller.g.dart';

class AgregadoController = AgregadoControllerBase with _$AgregadoController;

abstract class AgregadoControllerBase with Store {
  @observable
  List<String> agregados = List();
  @observable
  List<String> placas = List();

  @action
  popularListaAgregados() {
    agregados.add('Agregado 1');
    agregados.add('Agregado 2');
    agregados.add('Agregado 3');
    agregados.add('Agregado 4');
  }

  @action
  popularListaPlacas() {
    placas.add('Placa 1');
    placas.add('Placa 2');
    placas.add('Placa 3');
    placas.add('Placa 4');
  }

}