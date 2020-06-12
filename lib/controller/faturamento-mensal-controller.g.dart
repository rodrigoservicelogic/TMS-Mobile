// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faturamento-mensal-controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FaturamentoVisaoMensalController
    on _FaturamentoVisaoMensalControllerBase, Store {
  final _$seriesAtom =
      Atom(name: '_FaturamentoVisaoMensalControllerBase.series');

  @override
  List<charts.Series<FaturamentoVisaoMensalDataPoint, DateTime>> get series {
    _$seriesAtom.reportRead();
    return super.series;
  }

  @override
  set series(
      List<charts.Series<FaturamentoVisaoMensalDataPoint, DateTime>> value) {
    _$seriesAtom.reportWrite(value, super.series, () {
      super.series = value;
    });
  }

  final _$columnsAtom =
      Atom(name: '_FaturamentoVisaoMensalControllerBase.columns');

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

  final _$rowsAtom = Atom(name: '_FaturamentoVisaoMensalControllerBase.rows');

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

  @override
  String toString() {
    return '''
series: $series,
columns: $columns,
rows: $rows
    ''';
  }
}
