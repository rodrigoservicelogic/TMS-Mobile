import 'package:mobx/mobx.dart';
import 'package:tms_mobile/models/usuario.dart';
part 'login-controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  bool isLoad = false;

  @observable
  Usuario usuario = Usuario();

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

  Future<void> login(String login, String senha) async {
    isLoad = true;

    if (login == "admin" && senha == "123") {
      usuario.nomeApresentacao = "Daniel Brito";
      usuario.cargo = "Analista de Sistemas";
      usuario.avatar = null;
    }

    isLoad = false;
  }
}
