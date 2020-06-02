// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faturamento-un-controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FaturamentoUnController on FaturamentoUnControllerBase, Store {
  final _$idUsuarioAtom = Atom(name: 'FaturamentoUnControllerBase.idUsuario');

  @override
  int get idUsuario {
    _$idUsuarioAtom.reportRead();
    return super.idUsuario;
  }

  @override
  set idUsuario(int value) {
    _$idUsuarioAtom.reportWrite(value, super.idUsuario, () {
      super.idUsuario = value;
    });
  }

  final _$isLoadAtom = Atom(name: 'FaturamentoUnControllerBase.isLoad');

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

  final _$seriesAtom = Atom(name: 'FaturamentoUnControllerBase.series');

  @override
  List<charts.Series<FaturamentoUn, String>> get series {
    _$seriesAtom.reportRead();
    return super.series;
  }

  @override
  set series(List<charts.Series<FaturamentoUn, String>> value) {
    _$seriesAtom.reportWrite(value, super.series, () {
      super.series = value;
    });
  }

  final _$columnsAtom = Atom(name: 'FaturamentoUnControllerBase.columns');

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

  final _$rowsAtom = Atom(name: 'FaturamentoUnControllerBase.rows');

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

  final _$getFaturamentoAsyncAction =
      AsyncAction('FaturamentoUnControllerBase.getFaturamento');

  @override
  Future<bool> getFaturamento(ModelFiltroFaturamento filtroFaturamento) {
    return _$getFaturamentoAsyncAction
        .run(() => super.getFaturamento(filtroFaturamento));
  }

  @override
  String toString() {
    return '''
idUsuario: ${idUsuario},
isLoad: ${isLoad},
series: ${series},
columns: ${columns},
rows: ${rows}
    ''';
  }
}
