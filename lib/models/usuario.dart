class Usuario {
  int id;
  String codigo;
  String cpf;
  String login;
  String senha;
  String nomeApresentacao;
  String cargo;
  String empresaApresentacao;
  String avatar;
  int desativado;

  Usuario();

  String get nomeUsuario {
    var nome = nomeApresentacao.split(' ');
    
    return nome[0] + " " + nome[nome.length - 1];
  }

  Usuario.fromMap(Map<String, dynamic> map) {
    id = map["IdUsuario"];
    login = map["Email"];
    senha = map["Senha"];
    nomeApresentacao = map["Usuario"];
    cargo = map["Cargo"];
    cpf = map["Cpf"];
    codigo = map["Codigo"];
    desativado = map["Desativado"];
  }

  Usuario.fromPrefs(Map<String, dynamic> map) {
    id = map["IdUsuario"];
    login = map["Email"];
    senha = map["Senha"];
    nomeApresentacao = map["Nome"];
    cargo = map["Cargo"];
    cpf = map["Cpf"];
    codigo = map["Codigo"];
    desativado = map["Desativado"];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      "IdUsuario": id,
      "Email": login,
      "Senha": senha,
      "Nome": nomeApresentacao,
      "Cargo": cargo,
      "Codigo": codigo,
      "Cpf": cpf,
      "Desativado": desativado
    };

    return map;
  }
}
