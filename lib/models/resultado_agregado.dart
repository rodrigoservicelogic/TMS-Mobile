class ResultadoAgregado {
  int idResultadoAgregado;
  int idFilial;
  String data;
  String codAgregado;
  String nomeAgregado;
  String cnpjCpfAgregado;
  String placa;
  num receita;
  num despesa;
  num impostos;
  num freteTerceiros;
  num resultado;
  String ultimaAtualizacao;

  ResultadoAgregado(
      {this.idResultadoAgregado,
      this.idFilial,
      this.data,
      this.codAgregado,
      this.nomeAgregado,
      this.cnpjCpfAgregado,
      this.placa,
      this.receita,
      this.despesa,
      this.impostos,
      this.freteTerceiros,
      this.resultado,
      this.ultimaAtualizacao});

  num get percentualImpostos => this.impostos > 0 ? (this.despesa / this.impostos) * 100 : 0.0;
  num get percentualFrete => this.despesa > 0 ? (this.impostos / this.despesa) * 100 : 0.0;
  num get percentualResultado => this.receita > 0 ? (this.resultado / this.receita) * 100 : 0.0;

  ResultadoAgregado.fromJson(Map<String, dynamic> json) {
    idResultadoAgregado = json['IdResultadoAgregado'];
    idFilial = json['IdFilial'];
    data = json['Data'];
    codAgregado = json['CodAgregado'];
    nomeAgregado = json['NomeAgregado'];
    cnpjCpfAgregado = json['CnpjCpfAgregado'];
    placa = json['Placa'];
    receita = json['Receita'];
    despesa = json['Despesa'];
    impostos = json['Impostos'];
    freteTerceiros = json['FreteTerceiros'];
    resultado = json['Resultado'];
    ultimaAtualizacao = json['UltimaAtualizacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IdResultadoAgregado'] = this.idResultadoAgregado;
    data['IdFilial'] = this.idFilial;
    data['Data'] = this.data;
    data['CodAgregado'] = this.codAgregado;
    data['NomeAgregado'] = this.nomeAgregado;
    data['CnpjCpfAgregado'] = this.cnpjCpfAgregado;
    data['Placa'] = this.placa;
    data['Receita'] = this.receita;
    data['Despesa'] = this.despesa;
    data['Impostos'] = this.impostos;
    data['FreteTerceiros'] = this.freteTerceiros;
    data['Resultado'] = this.resultado;
    data['UltimaAtualizacao'] = this.ultimaAtualizacao;

    return data;
  }
}