class Faturamento {
  int idEmpresa;
  int idFilial;
  String tipoFrete;
  String codCliente;
  String nomeCliente;
  String cnpjCpfCliente;
  double valor;

  Faturamento({this.idEmpresa, this.idFilial, this.tipoFrete, this.codCliente, this.nomeCliente, this.cnpjCpfCliente, this.valor});

  Faturamento.fromJson(Map<String, dynamic> json) {
    idEmpresa = json['IdEmpresa'];
    idFilial = json['IdFilial'];
    tipoFrete = json['TipoFrete'];
    codCliente = json['CodCliente'];
    nomeCliente = json['NomeCliente'];
    cnpjCpfCliente = json['CnpjCpfCliente'];
    valor = json['Valor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IdEmpresa'] = this.idEmpresa;
    data['IdFilial'] = this.idFilial;
    data['TipoFrete'] = this.tipoFrete;
    data['CodCliente'] = this.codCliente;
    data['NomeCliente'] = this.nomeCliente;
    data['CnpjCpfCliente'] = this.cnpjCpfCliente;
    data['Valor'] = this.valor;
    return data;
  }
}
