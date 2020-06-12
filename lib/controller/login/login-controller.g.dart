// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login-controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: '_LoginControllerBase.isValid'))
      .value;

  final _$isLoadAtom = Atom(name: '_LoginControllerBase.isLoad');

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

  final _$usuarioAtom = Atom(name: '_LoginControllerBase.usuario');

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

  final _$empresasAtom = Atom(name: '_LoginControllerBase.empresas');

  @override
  List<Empresa> get empresas {
    _$empresasAtom.reportRead();
    return super.empresas;
  }

  @override
  set empresas(List<Empresa> value) {
    _$empresasAtom.reportWrite(value, super.empresas, () {
      super.empresas = value;
    });
  }

  @override
  String toString() {
    return '''
isLoad: $isLoad,
usuario: $usuario,
empresas: $empresas,
isValid: $isValid
    ''';
  }
}
