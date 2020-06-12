class Motorista {
  String codMotorista;
  String nome;
  String cpf;

  Motorista({this.codMotorista, this.nome, this.cpf});

  Motorista.fromJson(Map<String, dynamic> json) {
    codMotorista = json['CodMotorista'];
    nome = json['Nome'];
    cpf = json['Cpf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CodMotorista'] = this.codMotorista;
    data['Nome'] = this.nome;
    data['Cpf'] = this.cpf;
    return data;
  }
}
