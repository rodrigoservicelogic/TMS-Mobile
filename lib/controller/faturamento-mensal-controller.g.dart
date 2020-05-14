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
  List<charts.Series<FaturamentoVisaoMensalDataPoint, String>> get series {
    _$seriesAtom.context.enforceReadPolicy(_$seriesAtom);
    _$seriesAtom.reportObserved();
    return super.series;
  }

  @override
  set series(
      List<charts.Series<FaturamentoVisaoMensalDataPoint, String>> value) {
    _$seriesAtom.context.conditionallyRunInAction(() {
      super.series = value;
      _$seriesAtom.reportChanged();
    }, _$seriesAtom, name: '${_$seriesAtom.name}_set');
  }

  final _$columnsAtom =
      Atom(name: '_FaturamentoVisaoMensalControllerBase.columns');

  @override
  List<DataColumn> get columns {
    _$columnsAtom.context.enforceReadPolicy(_$columnsAtom);
    _$columnsAtom.reportObserved();
    return super.columns;
  }

  @override
  set columns(List<DataColumn> value) {
    _$columnsAtom.context.conditionallyRunInAction(() {
      super.columns = value;
      _$columnsAtom.reportChanged();
    }, _$columnsAtom, name: '${_$columnsAtom.name}_set');
  }

  final _$rowsAtom = Atom(name: '_FaturamentoVisaoMensalControllerBase.rows');

  @override
  List<DataRow> get rows {
    _$rowsAtom.context.enforceReadPolicy(_$rowsAtom);
    _$rowsAtom.reportObserved();
    return super.rows;
  }

  @override
  set rows(List<DataRow> value) {
    _$rowsAtom.context.conditionallyRunInAction(() {
      super.rows = value;
      _$rowsAtom.reportChanged();
    }, _$rowsAtom, name: '${_$rowsAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'series: ${series.toString()},columns: ${columns.toString()},rows: ${rows.toString()}';
    return '{$string}';
  }
}
