import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tms_mobile/global.dart';
import 'package:tms_mobile/models/usuario.dart';
import 'package:tms_mobile/util/http_helper.dart';
part 'usuario-controller.g.dart';

class UsuarioController = _UsuarioControllerBase with _$UsuarioController;

abstract class _UsuarioControllerBase with Store {
  @observable
  Usuario usuario = Usuario();

  @observable
  bool isLoad = false;

  @observable
  TextEditingController nomeCtrl = TextEditingController();

  @observable
  TextEditingController emailCtrl = TextEditingController();

  @observable
  TextEditingController cpfCtrl = TextEditingController();

  @observable
  TextEditingController senhaCtrl = TextEditingController();

  Future<String> getUsuario() async {
    try {
      isLoad = true;

      Http _http = Http();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String email = prefs.getString("Email");

      Response response = await _http.get(API_URL + "usuario/getByEmail?email=$email");

      if(response.data != null){
        usuario = Usuario.fromMap(response.data);

        nomeCtrl.text = usuario.nomeApresentacao;
        emailCtrl.text = usuario.login;
        cpfCtrl.text = usuario.cpf;
        senhaCtrl.text = usuario.senha;
      }

      isLoad = false;

    } catch(e) {
      isLoad = false;
      return "Ocorreu um erro ao obter os dados do usuário.";
    }
  }
}