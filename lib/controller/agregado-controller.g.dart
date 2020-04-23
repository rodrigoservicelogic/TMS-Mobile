// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agregado-controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AgregadoController on AgregadoControllerBase, Store {
  final _$unidadesAtom = Atom(name: 'AgregadoControllerBase.unidades');

  @override
  List<String> get unidades {
    _$unidadesAtom.context.enforceReadPolicy(_$unidadesAtom);
    _$unidadesAtom.reportObserved();
    return super.unidades;
  }

  @override
  set unidades(List<String> value) {
    _$unidadesAtom.context.conditionallyRunInAction(() {
      super.unidades = value;
      _$unidadesAtom.reportChanged();
    }, _$unidadesAtom, name: '${_$unidadesAtom.name}_set');
  }

  final _$AgregadoControllerBaseActionController =
      ActionController(name: 'AgregadoControllerBase');

  @override
  dynamic popularListaUnidade() {
    final _$actionInfo = _$AgregadoControllerBaseActionController.startAction();
    try {
      return super.popularListaUnidade();
    } finally {
      _$AgregadoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'unidades: ${unidades.toString()}';
    return '{$string}';
  }
}
