// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empresa-controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EmpresaController on EmpresaControllerBase, Store {
  final _$isLoadAtom = Atom(name: 'EmpresaControllerBase.isLoad');

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

  final _$regimesAtom = Atom(name: 'EmpresaControllerBase.regimes');

  @override
  List<String> get regimes {
    _$regimesAtom.reportRead();
    return super.regimes;
  }

  @override
  set regimes(List<String> value) {
    _$regimesAtom.reportWrite(value, super.regimes, () {
      super.regimes = value;
    });
  }

  final _$empresasAtom = Atom(name: 'EmpresaControllerBase.empresas');

  @override
  List<dynamic> get empresas {
    _$empresasAtom.reportRead();
    return super.empresas;
  }

  @override
  set empresas(List<dynamic> value) {
    _$empresasAtom.reportWrite(value, super.empresas, () {
      super.empresas = value;
    });
  }

  final _$resultadoEmpresaAtom =
      Atom(name: 'EmpresaControllerBase.resultadoEmpresa');

  @override
  List<ResultadoEmpresa> get resultadoEmpresa {
    _$resultadoEmpresaAtom.reportRead();
    return super.resultadoEmpresa;
  }

  @override
  set resultadoEmpresa(List<ResultadoEmpresa> value) {
    _$resultadoEmpresaAtom.reportWrite(value, super.resultadoEmpresa, () {
      super.resultadoEmpresa = value;
    });
  }

  final _$regimeSelectedAtom =
      Atom(name: 'EmpresaControllerBase.regimeSelected');

  @override
  String get regimeSelected {
    _$regimeSelectedAtom.reportRead();
    return super.regimeSelected;
  }

  @override
  set regimeSelected(String value) {
    _$regimeSelectedAtom.reportWrite(value, super.regimeSelected, () {
      super.regimeSelected = value;
    });
  }

  final _$dataInicialAtom = Atom(name: 'EmpresaControllerBase.dataInicial');

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

  final _$dataFinalAtom = Atom(name: 'EmpresaControllerBase.dataFinal');

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

  final _$getListaRegimesAsyncAction =
      AsyncAction('EmpresaControllerBase.getListaRegimes');

  @override
  Future<dynamic> getListaRegimes() {
    return _$getListaRegimesAsyncAction.run(() => super.getListaRegimes());
  }

  final _$filtrarAsyncAction = AsyncAction('EmpresaControllerBase.filtrar');

  @override
  Future<dynamic> filtrar(ModelFiltroResultadoEmpresa filtro) {
    return _$filtrarAsyncAction.run(() => super.filtrar(filtro));
  }

  final _$EmpresaControllerBaseActionController =
      ActionController(name: 'EmpresaControllerBase');

  @override
  dynamic changeRegime(String value) {
    final _$actionInfo = _$EmpresaControllerBaseActionController.startAction(
        name: 'EmpresaControllerBase.changeRegime');
    try {
      return super.changeRegime(value);
    } finally {
      _$EmpresaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDataInicial(DateTime value) {
    final _$actionInfo = _$EmpresaControllerBaseActionController.startAction(
        name: 'EmpresaControllerBase.changeDataInicial');
    try {
      return super.changeDataInicial(value);
    } finally {
      _$EmpresaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDataFinal(DateTime value) {
    final _$actionInfo = _$EmpresaControllerBaseActionController.startAction(
        name: 'EmpresaControllerBase.changeDataFinal');
    try {
      return super.changeDataFinal(value);
    } finally {
      _$EmpresaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoad: ${isLoad},
regimes: ${regimes},
empresas: ${empresas},
resultadoEmpresa: ${resultadoEmpresa},
regimeSelected: ${regimeSelected},
dataInicial: ${dataInicial},
dataFinal: ${dataFinal}
    ''';
  }
}
