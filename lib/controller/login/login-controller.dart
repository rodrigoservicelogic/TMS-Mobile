import 'package:mobx/mobx.dart';
import 'package:tms_mobile/models/usuario.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tms_mobile/global.dart';
import 'package:tms_mobile/models/empresa.dart';
import 'package:tms_mobile/util/http_helper.dart';
part 'login-controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  Http _http = Http();

  @observable
  bool isLoad = false;

  @observable
  Usuario usuario = Usuario();

  @observable
  List<Empresa> empresas = List();

  @computed
  bool get isValid {
    return usuario.login != null && usuario.senha != null;
  }

  changedLogin(String value) {
    usuario.login = value;
    usuario = usuario;
  }

  changeSenha(String value) {
    usuario.senha = value;
    usuario = usuario;
  }

  Future login() async {
    try {
      isLoad = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();

      // Response response = await _http
      //     .post(API_URL + "Home/Login", { "Email": usuario.login, "Password": usuario.senha });
      Response response = await _http
          .get(API_URL + "login?email=${usuario.login}&senha=${usuario.senha}");

      if (response.data != null) {
        usuario = Usuario.fromMap(response.data);
        prefs.setInt("Usuario", this.usuario.id);
      }

      isLoad = false;
    } on DioError catch (e) {
      isLoad = false;
      print(e.message);
    }
  }

  Future getEmpresas(int idUsuario) async {
    try {
      isLoad = true;

      Response response =
          await _http.get(API_URL + 'empresa?idUsuario=$idUsuario');

      if (response.data != null) {
        for (Map data in response.data) {
          empresas.add(Empresa.fromJson(data));
        }
      }

      isLoad = false;

      return "OK";
    } catch (e) {
      isLoad = false;
    }
  }
}
