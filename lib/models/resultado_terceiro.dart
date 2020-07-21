class ResultadoTerceiro {
  int idResultadoTerceiro;
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

  ResultadoTerceiro(
      {this.idResultadoTerceiro,
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

  num get impostoPerc => this.despesa > 0 ? (this.impostos / this.despesa) * 100 : 0.0;
  num get fretePagoTerPerc => this.despesa > 0 ? (this.freteTerceiros / this.despesa) * 100 : 0.0;
  num get resultadoPerc => this.receita > 0 ? (this.resultado / this.receita) * 100 : 0.0;

  ResultadoTerceiro.fromJson(Map<String, dynamic> json) {
    idResultadoTerceiro = json['IdResultadoTerceiro'];
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
    data['IdResultadoTerceiro'] = this.idResultadoTerceiro;
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