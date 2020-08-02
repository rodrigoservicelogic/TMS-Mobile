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

  final _$seriesUnAtom = Atom(name: 'FaturamentoUnControllerBase.seriesUn');

  @override
  List<charts.Series<ListaFiliais, String>> get seriesUn {
    _$seriesUnAtom.reportRead();
    return super.seriesUn;
  }

  @override
  set seriesUn(List<charts.Series<ListaFiliais, String>> value) {
    _$seriesUnAtom.reportWrite(value, super.seriesUn, () {
      super.seriesUn = value;
    });
  }

  final _$columnsUnAtom = Atom(name: 'FaturamentoUnControllerBase.columnsUn');

  @override
  List<DataColumn> get columnsUn {
    _$columnsUnAtom.reportRead();
    return super.columnsUn;
  }

  @override
  set columnsUn(List<DataColumn> value) {
    _$columnsUnAtom.reportWrite(value, super.columnsUn, () {
      super.columnsUn = value;
    });
  }

  final _$rowsUnAtom = Atom(name: 'FaturamentoUnControllerBase.rowsUn');

  @override
  List<DataRow> get rowsUn {
    _$rowsUnAtom.reportRead();
    return super.rowsUn;
  }

  @override
  set rowsUn(List<DataRow> value) {
    _$rowsUnAtom.reportWrite(value, super.rowsUn, () {
      super.rowsUn = value;
    });
  }

  final _$seriesTipoTranspAtom =
      Atom(name: 'FaturamentoUnControllerBase.seriesTipoTransp');

  @override
  List<charts.Series<ListaTipoTransporte, String>> get seriesTipoTransp {
    _$seriesTipoTranspAtom.reportRead();
    return super.seriesTipoTransp;
  }

  @override
  set seriesTipoTransp(List<charts.Series<ListaTipoTransporte, String>> value) {
    _$seriesTipoTranspAtom.reportWrite(value, super.seriesTipoTransp, () {
      super.seriesTipoTransp = value;
    });
  }

  final _$columnsTipoTranspAtom =
      Atom(name: 'FaturamentoUnControllerBase.columnsTipoTransp');

  @override
  List<DataColumn> get columnsTipoTransp {
    _$columnsTipoTranspAtom.reportRead();
    return super.columnsTipoTransp;
  }

  @override
  set columnsTipoTransp(List<DataColumn> value) {
    _$columnsTipoTranspAtom.reportWrite(value, super.columnsTipoTransp, () {
      super.columnsTipoTransp = value;
    });
  }

  final _$rowsTipoTranspAtom =
      Atom(name: 'FaturamentoUnControllerBase.rowsTipoTransp');

  @override
  List<DataRow> get rowsTipoTransp {
    _$rowsTipoTranspAtom.reportRead();
    return super.rowsTipoTransp;
  }

  @override
  set rowsTipoTransp(List<DataRow> value) {
    _$rowsTipoTranspAtom.reportWrite(value, super.rowsTipoTransp, () {
      super.rowsTipoTransp = value;
    });
  }

  final _$seriesCliAtom = Atom(name: 'FaturamentoUnControllerBase.seriesCli');

  @override
  List<charts.Series<ListaClientes, String>> get seriesCli {
    _$seriesCliAtom.reportRead();
    return super.seriesCli;
  }

  @override
  set seriesCli(List<charts.Series<ListaClientes, String>> value) {
    _$seriesCliAtom.reportWrite(value, super.seriesCli, () {
      super.seriesCli = value;
    });
  }

  final _$columnsCliAtom = Atom(name: 'FaturamentoUnControllerBase.columnsCli');

  @override
  List<DataColumn> get columnsCli {
    _$columnsCliAtom.reportRead();
    return super.columnsCli;
  }

  @override
  set columnsCli(List<DataColumn> value) {
    _$columnsCliAtom.reportWrite(value, super.columnsCli, () {
      super.columnsCli = value;
    });
  }

  final _$rowsCliAtom = Atom(name: 'FaturamentoUnControllerBase.rowsCli');

  @override
  List<DataRow> get rowsCli {
    _$rowsCliAtom.reportRead();
    return super.rowsCli;
  }

  @override
  set rowsCli(List<DataRow> value) {
    _$rowsCliAtom.reportWrite(value, super.rowsCli, () {
      super.rowsCli = value;
    });
  }

  final _$faturamentoAtom =
      Atom(name: 'FaturamentoUnControllerBase.faturamento');

  @override
  FaturamentoUn get faturamento {
    _$faturamentoAtom.reportRead();
    return super.faturamento;
  }

  @override
  set faturamento(FaturamentoUn value) {
    _$faturamentoAtom.reportWrite(value, super.faturamento, () {
      super.faturamento = value;
    });
  }

  final _$getFaturamentoAsyncAction =
      AsyncAction('FaturamentoUnControllerBase.getFaturamento');

  @override
  Future<String> getFaturamento(ModelFiltroFaturamento filtroFaturamento) {
    return _$getFaturamentoAsyncAction
        .run(() => super.getFaturamento(filtroFaturamento));
  }

  @override
  String toString() {
    return '''
idUsuario: ${idUsuario},
isLoad: ${isLoad},
seriesUn: ${seriesUn},
columnsUn: ${columnsUn},
rowsUn: ${rowsUn},
seriesTipoTransp: ${seriesTipoTransp},
columnsTipoTransp: ${columnsTipoTransp},
rowsTipoTransp: ${rowsTipoTransp},
seriesCli: ${seriesCli},
columnsCli: ${columnsCli},
rowsCli: ${rowsCli},
faturamento: ${faturamento}
    ''';
  }
}
