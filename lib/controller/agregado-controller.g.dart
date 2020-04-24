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
    _$agregadosAtom.context.enforceReadPolicy(_$agregadosAtom);
    _$agregadosAtom.reportObserved();
    return super.agregados;
  }

  @override
  set agregados(List<String> value) {
    _$agregadosAtom.context.conditionallyRunInAction(() {
      super.agregados = value;
      _$agregadosAtom.reportChanged();
    }, _$agregadosAtom, name: '${_$agregadosAtom.name}_set');
  }

  final _$placasAtom = Atom(name: 'AgregadoControllerBase.placas');

  @override
  List<String> get placas {
    _$placasAtom.context.enforceReadPolicy(_$placasAtom);
    _$placasAtom.reportObserved();
    return super.placas;
  }

  @override
  set placas(List<String> value) {
    _$placasAtom.context.conditionallyRunInAction(() {
      super.placas = value;
      _$placasAtom.reportChanged();
    }, _$placasAtom, name: '${_$placasAtom.name}_set');
  }

  final _$AgregadoControllerBaseActionController =
      ActionController(name: 'AgregadoControllerBase');

  @override
  dynamic popularListaAgregados() {
    final _$actionInfo = _$AgregadoControllerBaseActionController.startAction();
    try {
      return super.popularListaAgregados();
    } finally {
      _$AgregadoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic popularListaPlacas() {
    final _$actionInfo = _$AgregadoControllerBaseActionController.startAction();
    try {
      return super.popularListaPlacas();
    } finally {
      _$AgregadoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'agregados: ${agregados.toString()},placas: ${placas.toString()}';
    return '{$string}';
  }
}
