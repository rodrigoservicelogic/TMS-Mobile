import 'package:mobx/mobx.dart';
part 'agregado-controller.g.dart';

class AgregadoController = AgregadoControllerBase with _$AgregadoController;

abstract class AgregadoControllerBase with Store {
  @observable
  List<String> unidades = List();
  // List<String> unidades = ['Unidade 1', 'Unidade 2', 'Unidade 3', 'Unidade 4'];

  @action
  popularListaUnidade() {
    unidades.add('Unidade 1');
    unidades.add('Unidade 2');
    unidades.add('Unidade 3');
    unidades.add('Unidade 4');
  }

}