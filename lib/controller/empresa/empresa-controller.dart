import 'package:mobx/mobx.dart';
part 'empresa-controller.g.dart';

class EmpresaController = EmpresaControllerBase with _$EmpresaController;

abstract class EmpresaControllerBase with Store {
  @observable
  List<String> regimes = List();
  @observable
  List empresas = List();
  @observable
  List<String> competencias = List();
  @observable
  String receita = "5.000.000,00";
  @observable
  String despesa = "4.500.000,00";
  @observable
  String impostoVal = "10.000,00";
  @observable
  String impostoPerc = "33%";
  @observable
  String freteTerVal = "2.500.000,00";
  @observable
  String freteTerPerc = "50%";
  @observable
  String freteFrotaVal = "1.250.000,00";
  @observable
  String freteFrotaPerc = "25%";
  @observable
  String freteAgregadosVal = "1.250.000,00";
  @observable
  String freteAgregadosPerc = "25%";
  @observable
  String despesasAdmVal = "1.250.000,00";
  @observable
  String despesasAdmPerc = "25%";
  @observable
  String despesasOperVal = "1.250.000,00";
  @observable
  String despesasOperPerc = "25%";
  @observable
  String investimentosVal = "2.500.000,00";
  @observable
  String investimentosPerc = "50%";
  @observable
  String resultadoVal = "500.000,00";
  @observable
  String resultadoPerc = "10,00";

  @action
  popularListaRegimes() {
    regimes.add('Regime 1');
    regimes.add('Regime 2');
    regimes.add('Regime 3');
    regimes.add('Regime 4');
  }

  @action
  popularListaCompetencias() {
    competencias.add('2019/01');
    competencias.add('2020/01');
    competencias.add('2020/02');
    competencias.add('2020/03');
  }
}
