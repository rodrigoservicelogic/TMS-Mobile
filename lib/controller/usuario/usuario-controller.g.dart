// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario-controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UsuarioController on _UsuarioControllerBase, Store {
  final _$usuarioAtom = Atom(name: '_UsuarioControllerBase.usuario');

  @override
  Usuario get usuario {
    _$usuarioAtom.reportRead();
    return super.usuario;
  }

  @override
  set usuario(Usuario value) {
    _$usuarioAtom.reportWrite(value, super.usuario, () {
      super.usuario = value;
    });
  }

  final _$isLoadAtom = Atom(name: '_UsuarioControllerBase.isLoad');

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

  final _$nomeCtrlAtom = Atom(name: '_UsuarioControllerBase.nomeCtrl');

  @override
  TextEditingController get nomeCtrl {
    _$nomeCtrlAtom.reportRead();
    return super.nomeCtrl;
  }

  @override
  set nomeCtrl(TextEditingController value) {
    _$nomeCtrlAtom.reportWrite(value, super.nomeCtrl, () {
      super.nomeCtrl = value;
    });
  }

  final _$emailCtrlAtom = Atom(name: '_UsuarioControllerBase.emailCtrl');

  @override
  TextEditingController get emailCtrl {
    _$emailCtrlAtom.reportRead();
    return super.emailCtrl;
  }

  @override
  set emailCtrl(TextEditingController value) {
    _$emailCtrlAtom.reportWrite(value, super.emailCtrl, () {
      super.emailCtrl = value;
    });
  }

  final _$cpfCtrlAtom = Atom(name: '_UsuarioControllerBase.cpfCtrl');

  @override
  TextEditingController get cpfCtrl {
    _$cpfCtrlAtom.reportRead();
    return super.cpfCtrl;
  }

  @override
  set cpfCtrl(TextEditingController value) {
    _$cpfCtrlAtom.reportWrite(value, super.cpfCtrl, () {
      super.cpfCtrl = value;
    });
  }

  final _$senhaCtrlAtom = Atom(name: '_UsuarioControllerBase.senhaCtrl');

  @override
  TextEditingController get senhaCtrl {
    _$senhaCtrlAtom.reportRead();
    return super.senhaCtrl;
  }

  @override
  set senhaCtrl(TextEditingController value) {
    _$senhaCtrlAtom.reportWrite(value, super.senhaCtrl, () {
      super.senhaCtrl = value;
    });
  }

  @override
  String toString() {
    return '''
usuario: ${usuario},
isLoad: ${isLoad},
nomeCtrl: ${nomeCtrl},
emailCtrl: ${emailCtrl},
cpfCtrl: ${cpfCtrl},
senhaCtrl: ${senhaCtrl}
    ''';
  }
}
