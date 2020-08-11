// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faturamento-grupo-cliente-controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FaturamentoGrupoClienteController
    on _FaturamentoGrupoClienteControllerBase, Store {
  final _$grupoClienteAtom =
      Atom(name: '_FaturamentoGrupoClienteControllerBase.grupoCliente');

  @override
  List<GrupoClienteFaturamento> get grupoCliente {
    _$grupoClienteAtom.reportRead();
    return super.grupoCliente;
  }

  @override
  set grupoCliente(List<GrupoClienteFaturamento> value) {
    _$grupoClienteAtom.reportWrite(value, super.grupoCliente, () {
      super.grupoCliente = value;
    });
  }

  final _$seriesAtom =
      Atom(name: '_FaturamentoGrupoClienteControllerBase.series');

  @override
  List<charts.Series<GrupoClienteFaturamento, String>> get series {
    _$seriesAtom.reportRead();
    return super.series;
  }

  @override
  set series(List<charts.Series<GrupoClienteFaturamento, String>> value) {
    _$seriesAtom.reportWrite(value, super.series, () {
      super.series = value;
    });
  }

  final _$columnsAtom =
      Atom(name: '_FaturamentoGrupoClienteControllerBase.columns');

  @override
  List<DataColumn> get columns {
    _$columnsAtom.reportRead();
    return super.columns;
  }

  @override
  set columns(List<DataColumn> value) {
    _$columnsAtom.reportWrite(value, super.columns, () {
      super.columns = value;
    });
  }

  final _$rowsAtom = Atom(name: '_FaturamentoGrupoClienteControllerBase.rows');

  @override
  List<DataRow> get rows {
    _$rowsAtom.reportRead();
    return super.rows;
  }

  @override
  set rows(List<DataRow> value) {
    _$rowsAtom.reportWrite(value, super.rows, () {
      super.rows = value;
    });
  }

  final _$sortAscAtom =
      Atom(name: '_FaturamentoGrupoClienteControllerBase.sortAsc');

  @override
  bool get sortAsc {
    _$sortAscAtom.reportRead();
    return super.sortAsc;
  }

  @override
  set sortAsc(bool value) {
    _$sortAscAtom.reportWrite(value, super.sortAsc, () {
      super.sortAsc = value;
    });
  }

  final _$getVisaoGrupoClienteAsyncAction = AsyncAction(
      '_FaturamentoGrupoClienteControllerBase.getVisaoGrupoCliente');

  @override
  Future<String> getVisaoGrupoCliente(
      ModelFiltroFaturamento filtroFaturamento) {
    return _$getVisaoGrupoClienteAsyncAction
        .run(() => super.getVisaoGrupoCliente(filtroFaturamento));
  }

  final _$_FaturamentoGrupoClienteControllerBaseActionController =
      ActionController(name: '_FaturamentoGrupoClienteControllerBase');

  @override
  dynamic buildTable() {
    final _$actionInfo =
        _$_FaturamentoGrupoClienteControllerBaseActionController.startAction(
            name: '_FaturamentoGrupoClienteControllerBase.buildTable');
    try {
      return super.buildTable();
    } finally {
      _$_FaturamentoGrupoClienteControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic buildTableColumn() {
    final _$actionInfo =
        _$_FaturamentoGrupoClienteControllerBaseActionController.startAction(
            name: '_FaturamentoGrupoClienteControllerBase.buildTableColumn');
    try {
      return super.buildTableColumn();
    } finally {
      _$_FaturamentoGrupoClienteControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic buildChart() {
    final _$actionInfo =
        _$_FaturamentoGrupoClienteControllerBaseActionController.startAction(
            name: '_FaturamentoGrupoClienteControllerBase.buildChart');
    try {
      return super.buildChart();
    } finally {
      _$_FaturamentoGrupoClienteControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
grupoCliente: ${grupoCliente},
series: ${series},
columns: ${columns},
rows: ${rows},
sortAsc: ${sortAsc}
    ''';
  }
}
