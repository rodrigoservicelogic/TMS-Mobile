// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terceiro-controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TerceiroController on TerceiroControllerBase, Store {
  final _$terceirosAtom = Atom(name: 'TerceiroControllerBase.terceiros');

  @override
  List<String> get terceiros {
    _$terceirosAtom.reportRead();
    return super.terceiros;
  }

  @override
  set terceiros(List<String> value) {
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

  final _$receitaAtom = Atom(name: 'TerceiroControllerBase.receita');

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

  final _$despesaAtom = Atom(name: 'TerceiroControllerBase.despesa');

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

  final _$impostoValAtom = Atom(name: 'TerceiroControllerBase.impostoVal');

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

  final _$impostoPercAtom = Atom(name: 'TerceiroControllerBase.impostoPerc');

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

  final _$fretePagoTerValAtom =
      Atom(name: 'TerceiroControllerBase.fretePagoTerVal');

  @override
  String get fretePagoTerVal {
    _$fretePagoTerValAtom.reportRead();
    return super.fretePagoTerVal;
  }

  @override
  set fretePagoTerVal(String value) {
    _$fretePagoTerValAtom.reportWrite(value, super.fretePagoTerVal, () {
      super.fretePagoTerVal = value;
    });
  }

  final _$fretePagoTerPercAtom =
      Atom(name: 'TerceiroControllerBase.fretePagoTerPerc');

  @override
  String get fretePagoTerPerc {
    _$fretePagoTerPercAtom.reportRead();
    return super.fretePagoTerPerc;
  }

  @override
  set fretePagoTerPerc(String value) {
    _$fretePagoTerPercAtom.reportWrite(value, super.fretePagoTerPerc, () {
      super.fretePagoTerPerc = value;
    });
  }

  final _$resultadoValAtom = Atom(name: 'TerceiroControllerBase.resultadoVal');

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
      Atom(name: 'TerceiroControllerBase.resultadoPerc');

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

  final _$TerceiroControllerBaseActionController =
      ActionController(name: 'TerceiroControllerBase');

  @override
  dynamic popularListaTerceiros() {
    final _$actionInfo = _$TerceiroControllerBaseActionController.startAction(
        name: 'TerceiroControllerBase.popularListaTerceiros');
    try {
      return super.popularListaTerceiros();
    } finally {
      _$TerceiroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic popularListaPlacas() {
    final _$actionInfo = _$TerceiroControllerBaseActionController.startAction(
        name: 'TerceiroControllerBase.popularListaPlacas');
    try {
      return super.popularListaPlacas();
    } finally {
      _$TerceiroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
terceiros: ${terceiros},
placas: ${placas},
receita: ${receita},
despesa: ${despesa},
impostoVal: ${impostoVal},
impostoPerc: ${impostoPerc},
fretePagoTerVal: ${fretePagoTerVal},
fretePagoTerPerc: ${fretePagoTerPerc},
resultadoVal: ${resultadoVal},
resultadoPerc: ${resultadoPerc}
    ''';
  }
}
