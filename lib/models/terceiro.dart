class Terceiro {
  int idTerceiros;
  int idFilial;
  String data;
  String tipoFrete;
  String codTerceiro;
  String nomeTerceiro;
  String cnpjCpfTerceiro;
  String placa;
  num valor;
  String ultimaAtualizacao;

  Terceiro(
      {this.idTerceiros,
      this.idFilial,
      this.data,
      this.tipoFrete,
      this.codTerceiro,
      this.nomeTerceiro,
      this.cnpjCpfTerceiro,
      this.placa,
      this.valor,
      this.ultimaAtualizacao});

  Terceiro.fromJson(Map<String, dynamic> json) {
    idTerceiros = json['IdTerceiros'];
    idFilial = json['IdFilial'];
    data = json['Data'];
    tipoFrete = json['TipoFrete'];
    codTerceiro = json['CodTerceiro'];
    nomeTerceiro = json['NomeTerceiro'];
    cnpjCpfTerceiro = json['CnpjCpfTerceiro'];
    placa = json['Placa'];
    valor = json['Valor'];
    ultimaAtualizacao = json['UltimaAtualizacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IdTerceiros'] = this.idTerceiros;
    data['IdFilial'] = this.idFilial;
    data['Data'] = this.data;
    data['TipoFrete'] = this.tipoFrete;
    data['CodTerceiro'] = this.codTerceiro;
    data['NomeTerceiro'] = this.nomeTerceiro;
    data['CnpjCpfTerceiro'] = this.cnpjCpfTerceiro;
    data['Placa'] = this.placa;
    data['Valor'] = this.valor;
    data['UltimaAtualizacao'] = this.ultimaAtualizacao;
    return data;
  }
}