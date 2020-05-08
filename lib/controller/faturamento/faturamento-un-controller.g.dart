// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faturamento-un-controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FaturamentoUnController on FaturamentoUnControllerBase, Store {
  final _$faturamentosAtom =
      Atom(name: 'FaturamentoUnControllerBase.faturamentos');

  @override
  List<Faturamento> get faturamentos {
    _$faturamentosAtom.context.enforceReadPolicy(_$faturamentosAtom);
    _$faturamentosAtom.reportObserved();
    return super.faturamentos;
  }

  @override
  set faturamentos(List<Faturamento> value) {
    _$faturamentosAtom.context.conditionallyRunInAction(() {
      super.faturamentos = value;
      _$faturamentosAtom.reportChanged();
    }, _$faturamentosAtom, name: '${_$faturamentosAtom.name}_set');
  }

  @override
  String toString() {
    final string = 'faturamentos: ${faturamentos.toString()}';
    return '{$string}';
  }
}
