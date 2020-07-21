class ResultadoEmpresa {
  int idResultadoEmpresa;
  int idFilial;
  String data;
  String regime;
  num receita;
  num freteFrota;
  num freteAgregados;
  num freteTerceiros;
  num despesa;
  num despesaAdm;
  num despesaOperacional;
  num investimentos;
  num resultado;
  String ultimaAtualizacao;

  ResultadoEmpresa(
      {this.idResultadoEmpresa,
      this.idFilial,
      this.data,
      this.regime,
      this.receita,
      this.freteFrota,
      this.freteAgregados,
      this.freteTerceiros,
      this.despesa,
      this.despesaAdm,
      this.despesaOperacional,
      this.investimentos,
      this.resultado,
      this.ultimaAtualizacao});

  num get percentualResultado => this.receita > 0 ? (this.resultado / this.receita) * 100 : 0.0;
  num get despesasAdmPerc => this.despesa > 0 ? (this.despesaAdm / this.despesa) * 100 : 0.0;
  num get despesasOperPerc => this.despesa > 0 ? (this.despesaOperacional / this.despesa) * 100 : 0.0;
  num get freteFrotaPerc => this.receita > 0 ? (this.freteFrota / this.receita) * 100 : 0.0;
  num get freteAgregadosPerc => this.receita > 0 ? (this.freteAgregados / this.receita) * 100 : 0.0;
  num get freteTerPerc => this.receita > 0 ? (this.freteTerceiros / this.receita) * 100 : 0.0;
  num get investimentosPerc => this.despesa > 0 ? (this.investimentos / this.despesa) * 100 : 0.0;
  
  ResultadoEmpresa.fromJson(Map<String, dynamic> json) {
    idResultadoEmpresa = json['IdResultadoEmpresa'];
    idFilial = json['IdFilial'];
    data = json['Data'];
    regime = json['Regime'];
    receita = json['Receita'];
    freteFrota = json['FreteFrota'];
    freteAgregados = json['FreteAgregados'];
    freteTerceiros = json['FreteTerceiros'];
    despesa = json['Despesa'];
    despesaAdm = json['DespesaAdm'];
    despesaOperacional = json['DespesaOperacional'];
    investimentos = json['Investimentos'];
    resultado = json['Resultado'];
    ultimaAtualizacao = json['UltimaAtualizacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IdResultadoEmpresa'] = this.idResultadoEmpresa;
    data['IdFilial'] = this.idFilial;
    data['Data'] = this.data;
    data['Regime'] = this.regime;
    data['Receita'] = this.receita;
    data['FreteFrota'] = this.freteFrota;
    data['FreteAgregados'] = this.freteAgregados;
    data['FreteTerceiros'] = this.freteTerceiros;
    data['Despesa'] = this.despesa;
    data['DespesaAdm'] = this.despesaAdm;
    data['DespesaOperacional'] = this.despesaOperacional;
    data['Investimentos'] = this.investimentos;
    data['Resultado'] = this.resultado;
    data['UltimaAtualizacao'] = this.ultimaAtualizacao;

    return data;
  }
}