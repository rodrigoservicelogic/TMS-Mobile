// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agregado-controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AgregadoController on AgregadoControllerBase, Store {
  final _$isLoadAtom = Atom(name: 'AgregadoControllerBase.isLoad');

  @override
  bool get isLoad {
    _$isLoadAtom.reportRead();
    return super.isLoad;
  }

  @override
  set isLoad(bool value) {
    _$isLoadAtom.reportWrite(value, super.isLoad, () {
      super.isLoad = value;
    });
  }

  final _$agregadosAtom = Atom(name: 'AgregadoControllerBase.agregados');

  @override
  List<Agregado> get agregados {
    _$agregadosAtom.reportRead();
    return super.agregados;
  }

  @override
  set agregados(List<Agregado> value) {
    _$agregadosAtom.reportWrite(value, super.agregados, () {
      super.agregados = value;
    });
  }

  final _$placasAtom = Atom(name: 'AgregadoControllerBase.placas');

  @override
  List<String> get placas {
    _$placasAtom.reportRead();
    return super.placas;
  }

  @override
  set placas(List<String> value) {
    _$placasAtom.reportWrite(value, super.placas, () {
      super.placas = value;
    });
  }

  final _$agregadoSelectedAtom =
      Atom(name: 'AgregadoControllerBase.agregadoSelected');

  @override
  Agregado get agregadoSelected {
    _$agregadoSelectedAtom.reportRead();
    return super.agregadoSelected;
  }

  @override
  set agregadoSelected(Agregado value) {
    _$agregadoSelectedAtom.reportWrite(value, super.agregadoSelected, () {
      super.agregadoSelected = value;
    });
  }

  final _$placaSelectedAtom =
      Atom(name: 'AgregadoControllerBase.placaSelected');

  @override
  String get placaSelected {
    _$placaSelectedAtom.reportRead();
    return super.placaSelected;
  }

  @override
  set placaSelected(String value) {
    _$placaSelectedAtom.reportWrite(value, super.placaSelected, () {
      super.placaSelected = value;
    });
  }

  final _$dataInicialAtom = Atom(name: 'AgregadoControllerBase.dataInicial');

  @override
  DateTime get dataInicial {
    _$dataInicialAtom.reportRead();
    return super.dataInicial;
  }

  @override
  set dataInicial(DateTime value) {
    _$dataInicialAtom.reportWrite(value, super.dataInicial, () {
      super.dataInicial = value;
    });
  }

  final _$dataFinalAtom = Atom(name: 'AgregadoControllerBase.dataFinal');

  @override
  DateTime get dataFinal {
    _$dataFinalAtom.reportRead();
    return super.dataFinal;
  }

  @override
  set dataFinal(DateTime value) {
    _$dataFinalAtom.reportWrite(value, super.dataFinal, () {
      super.dataFinal = value;
    });
  }

  final _$listaAgregadoAtom =
      Atom(name: 'AgregadoControllerBase.listaAgregado');

  @override
  List<ResultadoAgregado> get listaAgregado {
    _$listaAgregadoAtom.reportRead();
    return super.listaAgregado;
  }

  @override
  set listaAgregado(List<ResultadoAgregado> value) {
    _$listaAgregadoAtom.reportWrite(value, super.listaAgregado, () {
      super.listaAgregado = value;
    });
  }

  final _$getListaAgregadoAsyncAction =
      AsyncAction('AgregadoControllerBase.getListaAgregado');

  @override
  Future<dynamic> getListaAgregado() {
    return _$getListaAgregadoAsyncAction.run(() => super.getListaAgregado());
  }

  final _$getListaPlacasAsyncAction =
      AsyncAction('AgregadoControllerBase.getListaPlacas');

  @override
  Future<dynamic> getListaPlacas() {
    return _$getListaPlacasAsyncAction.run(() => super.getListaPlacas());
  }

  final _$filtrarAsyncAction = AsyncAction('AgregadoControllerBase.filtrar');

  @override
  Future<dynamic> filtrar(ModelFiltroAgregado filtro) {
    return _$filtrarAsyncAction.run(() => super.filtrar(filtro));
  }

  final _$AgregadoControllerBaseActionController =
      ActionController(name: 'AgregadoControllerBase');

  @override
  dynamic changeAgregado(Agregado value) {
    final _$actionInfo = _$AgregadoControllerBaseActionController.startAction(
        name: 'AgregadoControllerBase.changeAgregado');
    try {
      return super.changeAgregado(value);
    } finally {
      _$AgregadoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePlaca(String value) {
    final _$actionInfo = _$AgregadoControllerBaseActionController.startAction(
        name: 'AgregadoControllerBase.changePlaca');
    try {
      return super.changePlaca(value);
    } finally {
      _$AgregadoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDataInicial(DateTime value) {
    final _$actionInfo = _$AgregadoControllerBaseActionController.startAction(
        name: 'AgregadoControllerBase.changeDataInicial');
    try {
      return super.changeDataInicial(value);
    } finally {
      _$AgregadoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDataFinal(DateTime value) {
    final _$actionInfo = _$AgregadoControllerBaseActionController.startAction(
        name: 'AgregadoControllerBase.changeDataFinal');
    try {
      return super.changeDataFinal(value);
    } finally {
      _$AgregadoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoad: ${isLoad},
agregados: ${agregados},
placas: ${placas},
agregadoSelected: ${agregadoSelected},
placaSelected: ${placaSelected},
dataInicial: ${dataInicial},
dataFinal: ${dataFinal},
listaAgregado: ${listaAgregado}
    ''';
  }
}
