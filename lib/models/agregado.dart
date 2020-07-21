class Agregado {
  String codAgregado;
  String nome;
  String cpf;

  Agregado({this.codAgregado, this.nome, this.cpf});

  Agregado.fromJson(Map<String, dynamic> json) {
    codAgregado = json['CodAgregado'];
    nome = json['Nome'];
    cpf = json['Cpf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CodAgregado'] = this.codAgregado;
    data['Nome'] = this.nome;
    data['Cpf'] = this.cpf;
    return data;
  }
}
