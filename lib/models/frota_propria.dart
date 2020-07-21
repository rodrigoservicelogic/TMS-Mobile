class FrotaPropria {
  int idFrotaPropria;
  int idFilial;
  String data;
  String codMotorista;
  String nomeMotorista;
  String cnpjCpfMotorista;
  String placa;
  num receita;
  num despesa;
  num impostos;
  num custosFixos;
  num custosVariaveis;
  num resultado;
  String ultimaAtualizacao;

  FrotaPropria(
      {this.idFrotaPropria,
      this.idFilial,
      this.data,
      this.codMotorista,
      this.nomeMotorista,
      this.cnpjCpfMotorista,
      this.placa,
      this.receita,
      this.despesa,
      this.impostos,
      this.custosFixos,
      this.custosVariaveis,
      this.resultado,
      this.ultimaAtualizacao});

  num get percentualImpostos => this.impostos > 0 ? (this.despesa / this.impostos) * 100 : 0.0;
  num get percentualCustoFixo => this.impostos > 0 ? (this.despesa / this.impostos) * 100 : 0.0;
  num get percentualCustoVariavel => this.impostos > 0 ? (this.despesa / this.impostos) * 100 : 0.0;
  num get percentualResultado => this.receita > 0 ? (this.resultado / this.receita) * 100 : 0.0;

  FrotaPropria.fromJson(Map<String, dynamic> json) {
    idFrotaPropria = json['IdFrotaPropria'];
    idFilial = json['IdFilial'];
    data = json['Data'];
    codMotorista = json['CodMotorista'];
    nomeMotorista = json['NomeMotorista'];
    cnpjCpfMotorista = json['CnpjCpfMotorista'];
    placa = json['Placa'];
    receita = json['Receita'] ?? 0;
    despesa = json['Despesa'] ?? 0;
    impostos = json['Impostos'] ?? 0;
    custosFixos = json['CustosFixos'] ?? 0;
    custosVariaveis = json['CustosVariaveis'] ?? 0;
    resultado = json['Resultado'] ?? 0;
    ultimaAtualizacao = json['UltimaAtualizacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IdFrotaPropria'] = this.idFrotaPropria;
    data['IdFilial'] = this.idFilial;
    data['Data'] = this.data;
    data['CodMotorista'] = this.codMotorista;
    data['NomeMotorista'] = this.nomeMotorista;
    data['CnpjCpfMotorista'] = this.cnpjCpfMotorista;
    data['Placa'] = this.placa;
    data['Receita'] = this.receita;
    data['Despesa'] = this.despesa;
    data['Impostos'] = this.impostos;
    data['CustosFixos'] = this.custosFixos;
    data['CustosVariaveis'] = this.custosVariaveis;
    data['Resultado'] = this.resultado;
    data['UltimaAtualizacao'] = this.ultimaAtualizacao;
    return data;
  }
}
