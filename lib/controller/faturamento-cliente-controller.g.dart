// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faturamento-cliente-controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FaturamentoClienteController
    on _FaturamentoClienteControllerBase, Store {
  final _$tipoClienteAtom =
      Atom(name: '_FaturamentoClienteControllerBase.tipoCliente');

  @override
  List<String> get tipoCliente {
    _$tipoClienteAtom.context.enforceReadPolicy(_$tipoClienteAtom);
    _$tipoClienteAtom.reportObserved();
    return super.tipoCliente;
  }

  @override
  set tipoCliente(List<String> value) {
    _$tipoClienteAtom.context.conditionallyRunInAction(() {
      super.tipoCliente = value;
      _$tipoClienteAtom.reportChanged();
    }, _$tipoClienteAtom, name: '${_$tipoClienteAtom.name}_set');
  }

  final _$valorRealAtom =
      Atom(name: '_FaturamentoClienteControllerBase.valorReal');

  @override
  List<String> get valorReal {
    _$valorRealAtom.context.enforceReadPolicy(_$valorRealAtom);
    _$valorRealAtom.reportObserved();
    return super.valorReal;
  }

  @override
  set valorReal(List<String> value) {
    _$valorRealAtom.context.conditionallyRunInAction(() {
      super.valorReal = value;
      _$valorRealAtom.reportChanged();
    }, _$valorRealAtom, name: '${_$valorRealAtom.name}_set');
  }

  final _$valorPercentAtom =
      Atom(name: '_FaturamentoClienteControllerBase.valorPercent');

  @override
  List<String> get valorPercent {
    _$valorPercentAtom.context.enforceReadPolicy(_$valorPercentAtom);
    _$valorPercentAtom.reportObserved();
    return super.valorPercent;
  }

  @override
  set valorPercent(List<String> value) {
    _$valorPercentAtom.context.conditionallyRunInAction(() {
      super.valorPercent = value;
      _$valorPercentAtom.reportChanged();
    }, _$valorPercentAtom, name: '${_$valorPercentAtom.name}_set');
  }

  final _$valorAtom = Atom(name: '_FaturamentoClienteControllerBase.valor');

  @override
  String get valor {
    _$valorAtom.context.enforceReadPolicy(_$valorAtom);
    _$valorAtom.reportObserved();
    return super.valor;
  }

  @override
  set valor(String value) {
    _$valorAtom.context.conditionallyRunInAction(() {
      super.valor = value;
      _$valorAtom.reportChanged();
    }, _$valorAtom, name: '${_$valorAtom.name}_set');
  }

  final _$valorPercAtom =
      Atom(name: '_FaturamentoClienteControllerBase.valorPerc');

  @override
  String get valorPerc {
    _$valorPercAtom.context.enforceReadPolicy(_$valorPercAtom);
    _$valorPercAtom.reportObserved();
    return super.valorPerc;
  }

  @override
  set valorPerc(String value) {
    _$valorPercAtom.context.conditionallyRunInAction(() {
      super.valorPerc = value;
      _$valorPercAtom.reportChanged();
    }, _$valorPercAtom, name: '${_$valorPercAtom.name}_set');
  }

  final _$anoAtualAtom =
      Atom(name: '_FaturamentoClienteControllerBase.anoAtual');

  @override
  String get anoAtual {
    _$anoAtualAtom.context.enforceReadPolicy(_$anoAtualAtom);
    _$anoAtualAtom.reportObserved();
    return super.anoAtual;
  }

  @override
  set anoAtual(String value) {
    _$anoAtualAtom.context.conditionallyRunInAction(() {
      super.anoAtual = value;
      _$anoAtualAtom.reportChanged();
    }, _$anoAtualAtom, name: '${_$anoAtualAtom.name}_set');
  }

  final _$_FaturamentoClienteControllerBaseActionController =
      ActionController(name: '_FaturamentoClienteControllerBase');

  @override
  dynamic popularListaTipoCliente() {
    final _$actionInfo =
        _$_FaturamentoClienteControllerBaseActionController.startAction();
    try {
      return super.popularListaTipoCliente();
    } finally {
      _$_FaturamentoClienteControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic popularListaValorReal() {
    final _$actionInfo =
        _$_FaturamentoClienteControllerBaseActionController.startAction();
    try {
      return super.popularListaValorReal();
    } finally {
      _$_FaturamentoClienteControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic popularListaValorPercent() {
    final _$actionInfo =
        _$_FaturamentoClienteControllerBaseActionController.startAction();
    try {
      return super.popularListaValorPercent();
    } finally {
      _$_FaturamentoClienteControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'tipoCliente: ${tipoCliente.toString()},valorReal: ${valorReal.toString()},valorPercent: ${valorPercent.toString()},valor: ${valor.toString()},valorPerc: ${valorPerc.toString()},anoAtual: ${anoAtual.toString()}';
    return '{$string}';
  }
}
