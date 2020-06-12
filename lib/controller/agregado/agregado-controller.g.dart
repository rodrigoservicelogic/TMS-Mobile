// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agregado-controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AgregadoController on AgregadoControllerBase, Store {
  final _$agregadosAtom = Atom(name: 'AgregadoControllerBase.agregados');

  @override
  List<String> get agregados {
    _$agregadosAtom.reportRead();
    return super.agregados;
  }

  @override
  set agregados(List<String> value) {
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

  final _$receitaAtom = Atom(name: 'AgregadoControllerBase.receita');

  @override
  String get receita {
    _$receitaAtom.reportRead();
    return super.receita;
  }

  @override
  set receita(String value) {
    _$receitaAtom.reportWrite(value, super.receita, () {
      super.receita = value;
    });
  }

  final _$despesaAtom = Atom(name: 'AgregadoControllerBase.despesa');

  @override
  String get despesa {
    _$despesaAtom.reportRead();
    return super.despesa;
  }

  @override
  set despesa(String value) {
    _$despesaAtom.reportWrite(value, super.despesa, () {
      super.despesa = value;
    });
  }

  final _$impostoValAtom = Atom(name: 'AgregadoControllerBase.impostoVal');

  @override
  String get impostoVal {
    _$impostoValAtom.reportRead();
    return super.impostoVal;
  }

  @override
  set impostoVal(String value) {
    _$impostoValAtom.reportWrite(value, super.impostoVal, () {
      super.impostoVal = value;
    });
  }

  final _$impostoPercAtom = Atom(name: 'AgregadoControllerBase.impostoPerc');

  @override
  String get impostoPerc {
    _$impostoPercAtom.reportRead();
    return super.impostoPerc;
  }

  @override
  set impostoPerc(String value) {
    _$impostoPercAtom.reportWrite(value, super.impostoPerc, () {
      super.impostoPerc = value;
    });
  }

  final _$ferePagoTerValAtom =
      Atom(name: 'AgregadoControllerBase.ferePagoTerVal');

  @override
  String get ferePagoTerVal {
    _$ferePagoTerValAtom.reportRead();
    return super.ferePagoTerVal;
  }

  @override
  set ferePagoTerVal(String value) {
    _$ferePagoTerValAtom.reportWrite(value, super.ferePagoTerVal, () {
      super.ferePagoTerVal = value;
    });
  }

  final _$ferePagoTerPercAtom =
      Atom(name: 'AgregadoControllerBase.ferePagoTerPerc');

  @override
  String get ferePagoTerPerc {
    _$ferePagoTerPercAtom.reportRead();
    return super.ferePagoTerPerc;
  }

  @override
  set ferePagoTerPerc(String value) {
    _$ferePagoTerPercAtom.reportWrite(value, super.ferePagoTerPerc, () {
      super.ferePagoTerPerc = value;
    });
  }

  final _$resultadoValAtom = Atom(name: 'AgregadoControllerBase.resultadoVal');

  @override
  String get resultadoVal {
    _$resultadoValAtom.reportRead();
    return super.resultadoVal;
  }

  @override
  set resultadoVal(String value) {
    _$resultadoValAtom.reportWrite(value, super.resultadoVal, () {
      super.resultadoVal = value;
    });
  }

  final _$resultadoPercAtom =
      Atom(name: 'AgregadoControllerBase.resultadoPerc');

  @override
  String get resultadoPerc {
    _$resultadoPercAtom.reportRead();
    return super.resultadoPerc;
  }

  @override
  set resultadoPerc(String value) {
    _$resultadoPercAtom.reportWrite(value, super.resultadoPerc, () {
      super.resultadoPerc = value;
    });
  }

  final _$AgregadoControllerBaseActionController =
      ActionController(name: 'AgregadoControllerBase');

  @override
  dynamic popularListaAgregados() {
    final _$actionInfo = _$AgregadoControllerBaseActionController.startAction(
        name: 'AgregadoControllerBase.popularListaAgregados');
    try {
      return super.popularListaAgregados();
    } finally {
      _$AgregadoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic popularListaPlacas() {
    final _$actionInfo = _$AgregadoControllerBaseActionController.startAction(
        name: 'AgregadoControllerBase.popularListaPlacas');
    try {
      return super.popularListaPlacas();
    } finally {
      _$AgregadoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
agregados: $agregados,
placas: $placas,
receita: $receita,
despesa: $despesa,
impostoVal: $impostoVal,
impostoPerc: $impostoPerc,
ferePagoTerVal: $ferePagoTerVal,
ferePagoTerPerc: $ferePagoTerPerc,
resultadoVal: $resultadoVal,
resultadoPerc: $resultadoPerc
    ''';
  }
}
