// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terceiro-controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TerceiroController on TerceiroControllerBase, Store {
  final _$isLoadAtom = Atom(name: 'TerceiroControllerBase.isLoad');

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

  final _$terceirosAtom = Atom(name: 'TerceiroControllerBase.terceiros');

  @override
  List<Terceiro> get terceiros {
    _$terceirosAtom.reportRead();
    return super.terceiros;
  }

  @override
  set terceiros(List<Terceiro> value) {
    _$terceirosAtom.reportWrite(value, super.terceiros, () {
      super.terceiros = value;
    });
  }

  final _$placasAtom = Atom(name: 'TerceiroControllerBase.placas');

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

  final _$resultadoterceiroAtom =
      Atom(name: 'TerceiroControllerBase.resultadoterceiro');

  @override
  List<ResultadoTerceiro> get resultadoterceiro {
    _$resultadoterceiroAtom.reportRead();
    return super.resultadoterceiro;
  }

  @override
  set resultadoterceiro(List<ResultadoTerceiro> value) {
    _$resultadoterceiroAtom.reportWrite(value, super.resultadoterceiro, () {
      super.resultadoterceiro = value;
    });
  }

  final _$placaSelectedAtom =
      Atom(name: 'TerceiroControllerBase.placaSelected');

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

  final _$terceiroSelectedAtom =
      Atom(name: 'TerceiroControllerBase.terceiroSelected');

  @override
  Terceiro get terceiroSelected {
    _$terceiroSelectedAtom.reportRead();
    return super.terceiroSelected;
  }

  @override
  set terceiroSelected(Terceiro value) {
    _$terceiroSelectedAtom.reportWrite(value, super.terceiroSelected, () {
      super.terceiroSelected = value;
    });
  }

  final _$dataInicialAtom = Atom(name: 'TerceiroControllerBase.dataInicial');

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

  final _$dataFinalAtom = Atom(name: 'TerceiroControllerBase.dataFinal');

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

  final _$getListaTerceirosAsyncAction =
      AsyncAction('TerceiroControllerBase.getListaTerceiros');

  @override
  Future<dynamic> getListaTerceiros() {
    return _$getListaTerceirosAsyncAction.run(() => super.getListaTerceiros());
  }

  final _$getListaPlacasAsyncAction =
      AsyncAction('TerceiroControllerBase.getListaPlacas');

  @override
  Future<dynamic> getListaPlacas() {
    return _$getListaPlacasAsyncAction.run(() => super.getListaPlacas());
  }

  final _$filtrarAsyncAction = AsyncAction('TerceiroControllerBase.filtrar');

  @override
  Future<dynamic> filtrar(ModelFiltroTerceiro filtro) {
    return _$filtrarAsyncAction.run(() => super.filtrar(filtro));
  }

  final _$TerceiroControllerBaseActionController =
      ActionController(name: 'TerceiroControllerBase');

  @override
  dynamic changePlaca(String value) {
    final _$actionInfo = _$TerceiroControllerBaseActionController.startAction(
        name: 'TerceiroControllerBase.changePlaca');
    try {
      return super.changePlaca(value);
    } finally {
      _$TerceiroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeTerceiro(Terceiro value) {
    final _$actionInfo = _$TerceiroControllerBaseActionController.startAction(
        name: 'TerceiroControllerBase.changeTerceiro');
    try {
      return super.changeTerceiro(value);
    } finally {
      _$TerceiroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDataInicial(DateTime value) {
    final _$actionInfo = _$TerceiroControllerBaseActionController.startAction(
        name: 'TerceiroControllerBase.changeDataInicial');
    try {
      return super.changeDataInicial(value);
    } finally {
      _$TerceiroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDataFinal(DateTime value) {
    final _$actionInfo = _$TerceiroControllerBaseActionController.startAction(
        name: 'TerceiroControllerBase.changeDataFinal');
    try {
      return super.changeDataFinal(value);
    } finally {
      _$TerceiroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoad: ${isLoad},
terceiros: ${terceiros},
placas: ${placas},
resultadoterceiro: ${resultadoterceiro},
placaSelected: ${placaSelected},
terceiroSelected: ${terceiroSelected},
dataInicial: ${dataInicial},
dataFinal: ${dataFinal}
    ''';
  }
}
