class ClienteFaturamento {
  String codCliente;
  String nomeCliente;
  String cnpjCpfCliente;

  ClienteFaturamento();

  ClienteFaturamento.fromJson(Map<String, dynamic> json) {
    codCliente = json['CodCliente'];
    nomeCliente = json['NomeCliente'];
    cnpjCpfCliente = json['CnpjCpfCliente'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CodCliente'] = this.codCliente;
    data['NomeCliente'] = this.nomeCliente;
    data['CnpjCpfCliente'] = this.cnpjCpfCliente;
    return data;
  }
}
