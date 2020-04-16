// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login-controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid =>
      (_$isValidComputed ??= Computed<bool>(() => super.isValid)).value;

  final _$isLoadAtom = Atom(name: '_LoginControllerBase.isLoad');

  @override
  bool get isLoad {
    _$isLoadAtom.context.enforceReadPolicy(_$isLoadAtom);
    _$isLoadAtom.reportObserved();
    return super.isLoad;
  }

  @override
  set isLoad(bool value) {
    _$isLoadAtom.context.conditionallyRunInAction(() {
      super.isLoad = value;
      _$isLoadAtom.reportChanged();
    }, _$isLoadAtom, name: '${_$isLoadAtom.name}_set');
  }

  final _$usuarioAtom = Atom(name: '_LoginControllerBase.usuario');

  @override
  Usuario get usuario {
    _$usuarioAtom.context.enforceReadPolicy(_$usuarioAtom);
    _$usuarioAtom.reportObserved();
    return super.usuario;
  }

  @override
  set usuario(Usuario value) {
    _$usuarioAtom.context.conditionallyRunInAction(() {
      super.usuario = value;
      _$usuarioAtom.reportChanged();
    }, _$usuarioAtom, name: '${_$usuarioAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'isLoad: ${isLoad.toString()},usuario: ${usuario.toString()},isValid: ${isValid.toString()}';
    return '{$string}';
  }
}
