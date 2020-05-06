class LoginModel {
  String login;
  String senha;

  LoginModel();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['Email'] = this.login;
    data['Senha'] = this.senha;

    return data;
  }
}
