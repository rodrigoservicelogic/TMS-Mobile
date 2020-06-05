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
    _$tipoClienteAtom.reportRead();
    return super.tipoCliente;
  }

  @override
  set tipoCliente(List<String> value) {
    _$tipoClienteAtom.reportWrite(value, super.tipoCliente, () {
      super.tipoCliente = value;
    });
  }

  final _$valorRealAtom =
      Atom(name: '_FaturamentoClienteControllerBase.valorReal');

  @override
  List<String> get valorReal {
    _$valorRealAtom.reportRead();
    return super.valorReal;
  }

  @override
  set valorReal(List<String> value) {
    _$valorRealAtom.reportWrite(value, super.valorReal, () {
      super.valorReal = value;
    });
  }

  final _$valorPercentAtom =
      Atom(name: '_FaturamentoClienteControllerBase.valorPercent');

  @override
  List<String> get valorPercent {
    _$valorPercentAtom.reportRead();
    return super.valorPercent;
  }

  @override
  set valorPercent(List<String> value) {
    _$valorPercentAtom.reportWrite(value, super.valorPercent, () {
      super.valorPercent = value;
    });
  }

  final _$valorAtom = Atom(name: '_FaturamentoClienteControllerBase.valor');

  @override
  String get valor {
    _$valorAtom.reportRead();
    return super.valor;
  }

  @override
  set valor(String value) {
    _$valorAtom.reportWrite(value, super.valor, () {
      super.valor = value;
    });
  }

  final _$valorPercAtom =
      Atom(name: '_FaturamentoClienteControllerBase.valorPerc');

  @override
  String get valorPerc {
    _$valorPercAtom.reportRead();
    return super.valorPerc;
  }

  @override
  set valorPerc(String value) {
    _$valorPercAtom.reportWrite(value, super.valorPerc, () {
      super.valorPerc = value;
    });
  }

  final _$anoAtualAtom =
      Atom(name: '_FaturamentoClienteControllerBase.anoAtual');

  @override
  String get anoAtual {
    _$anoAtualAtom.reportRead();
    return super.anoAtual;
  }

  @override
  set anoAtual(String value) {
    _$anoAtualAtom.reportWrite(value, super.anoAtual, () {
      super.anoAtual = value;
    });
  }

  final _$listaAnosAtom =
      Atom(name: '_FaturamentoClienteControllerBase.listaAnos');

  @override
  List<Dados> get listaAnos {
    _$listaAnosAtom.reportRead();
    return super.listaAnos;
  }

  @override
  set listaAnos(List<Dados> value) {
    _$listaAnosAtom.reportWrite(value, super.listaAnos, () {
      super.listaAnos = value;
    });
  }

  final _$isLoadAtom = Atom(name: '_FaturamentoClienteControllerBase.isLoad');

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

  final _$filiaisAtom = Atom(name: '_FaturamentoClienteControllerBase.filiais');

  @override
  List<Filial> get filiais {
    _$filiaisAtom.reportRead();
    return super.filiais;
  }

  @override
  set filiais(List<Filial> value) {
    _$filiaisAtom.reportWrite(value, super.filiais, () {
      super.filiais = value;
    });
  }

  final _$tiposFreteAtom =
      Atom(name: '_FaturamentoClienteControllerBase.tiposFrete');

  @override
  List<String> get tiposFrete {
    _$tiposFreteAtom.reportRead();
    return super.tiposFrete;
  }

  @override
  set tiposFrete(List<String> value) {
    _$tiposFreteAtom.reportWrite(value, super.tiposFrete, () {
      super.tiposFrete = value;
    });
  }

  final _$clientesAtom =
      Atom(name: '_FaturamentoClienteControllerBase.clientes');

  @override
  List<ClienteFaturamento> get clientes {
    _$clientesAtom.reportRead();
    return super.clientes;
  }

  @override
  set clientes(List<ClienteFaturamento> value) {
    _$clientesAtom.reportWrite(value, super.clientes, () {
      super.clientes = value;
    });
  }

  final _$selectedUnidadeAtom =
      Atom(name: '_FaturamentoClienteControllerBase.selectedUnidade');

  @override
  int get selectedUnidade {
    _$selectedUnidadeAtom.reportRead();
    return super.selectedUnidade;
  }

  @override
  set selectedUnidade(int value) {
    _$selectedUnidadeAtom.reportWrite(value, super.selectedUnidade, () {
      super.selectedUnidade = value;
    });
  }

  final _$selectedFreteAtom =
      Atom(name: '_FaturamentoClienteControllerBase.selectedFrete');

  @override
  String get selectedFrete {
    _$selectedFreteAtom.reportRead();
    return super.selectedFrete;
  }

  @override
  set selectedFrete(String value) {
    _$selectedFreteAtom.reportWrite(value, super.selectedFrete, () {
      super.selectedFrete = value;
    });
  }

  final _$selectedClienteAtom =
      Atom(name: '_FaturamentoClienteControllerBase.selectedCliente');

  @override
  String get selectedCliente {
    _$selectedClienteAtom.reportRead();
    return super.selectedCliente;
  }

  @override
  set selectedCliente(String value) {
    _$selectedClienteAtom.reportWrite(value, super.selectedCliente, () {
      super.selectedCliente = value;
    });
  }

  final _$_FaturamentoClienteControllerBaseActionController =
      ActionController(name: '_FaturamentoClienteControllerBase');

  @override
  dynamic popularListaAnos() {
    final _$actionInfo =
        _$_FaturamentoClienteControllerBaseActionController.startAction(
            name: '_FaturamentoClienteControllerBase.popularListaAnos');
    try {
      return super.popularListaAnos();
    } finally {
      _$_FaturamentoClienteControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic popularListaTipoCliente() {
    final _$actionInfo =
        _$_FaturamentoClienteControllerBaseActionController.startAction(
            name: '_FaturamentoClienteControllerBase.popularListaTipoCliente');
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
        _$_FaturamentoClienteControllerBaseActionController.startAction(
            name: '_FaturamentoClienteControllerBase.popularListaValorReal');
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
        _$_FaturamentoClienteControllerBaseActionController.startAction(
            name: '_FaturamentoClienteControllerBase.popularListaValorPercent');
    try {
      return super.popularListaValorPercent();
    } finally {
      _$_FaturamentoClienteControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeUnidadeNegocio(int value) {
    final _$actionInfo =
        _$_FaturamentoClienteControllerBaseActionController.startAction(
            name: '_FaturamentoClienteControllerBase.changeUnidadeNegocio');
    try {
      return super.changeUnidadeNegocio(value);
    } finally {
      _$_FaturamentoClienteControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearSelectedUnidadeNegocio() {
    final _$actionInfo =
        _$_FaturamentoClienteControllerBaseActionController.startAction(
            name:
                '_FaturamentoClienteControllerBase.clearSelectedUnidadeNegocio');
    try {
      return super.clearSelectedUnidadeNegocio();
    } finally {
      _$_FaturamentoClienteControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeTipoFrete(String value) {
    final _$actionInfo = _$_FaturamentoClienteControllerBaseActionController
        .startAction(name: '_FaturamentoClienteControllerBase.changeTipoFrete');
    try {
      return super.changeTipoFrete(value);
    } finally {
      _$_FaturamentoClienteControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearSelectedTipoFrete() {
    final _$actionInfo =
        _$_FaturamentoClienteControllerBaseActionController.startAction(
            name: '_FaturamentoClienteControllerBase.clearSelectedTipoFrete');
    try {
      return super.clearSelectedTipoFrete();
    } finally {
      _$_FaturamentoClienteControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCliente(String value) {
    final _$actionInfo = _$_FaturamentoClienteControllerBaseActionController
        .startAction(name: '_FaturamentoClienteControllerBase.changeCliente');
    try {
      return super.changeCliente(value);
    } finally {
      _$_FaturamentoClienteControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearSelectedCliente() {
    final _$actionInfo =
        _$_FaturamentoClienteControllerBaseActionController.startAction(
            name: '_FaturamentoClienteControllerBase.clearSelectedCliente');
    try {
      return super.clearSelectedCliente();
    } finally {
      _$_FaturamentoClienteControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tipoCliente: ${tipoCliente},
valorReal: ${valorReal},
valorPercent: ${valorPercent},
valor: ${valor},
valorPerc: ${valorPerc},
anoAtual: ${anoAtual},
listaAnos: ${listaAnos},
isLoad: ${isLoad},
filiais: ${filiais},
tiposFrete: ${tiposFrete},
clientes: ${clientes},
selectedUnidade: ${selectedUnidade},
selectedFrete: ${selectedFrete},
selectedCliente: ${selectedCliente}
    ''';
  }
}
