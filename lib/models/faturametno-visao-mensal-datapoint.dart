class FaturamentoVisaoMensalDataPoint {
  double faturamentoPeriodo;
  double faturamentoAnterior;
  double variacao;
  int mes;
  int ano;
  int sequencia;
  num peso;

  // FaturamentoVisaoMensalDataPoint();
  FaturamentoVisaoMensalDataPoint(
      this.faturamentoPeriodo,
      this.faturamentoAnterior,
      this.variacao,
      this.mes,
      this.ano,
      this.sequencia,
      this.peso);

  FaturamentoVisaoMensalDataPoint.fromMap(Map<String, dynamic> map) {
    faturamentoPeriodo = map["FaturamentoPeriodo"];
    faturamentoAnterior = map["FaturamentoAnterior"];
    variacao = map["Variacao"];
    mes = map["Mes"];
    ano = map["Ano"];
    sequencia = map["OrderInSet"];
    peso = map["Peso"];
  }

  factory FaturamentoVisaoMensalDataPoint.fromJson(dynamic json) {
    return FaturamentoVisaoMensalDataPoint(
        json['FaturamentoPeriodo'] as double,
        json['FaturamentoAnterior'] as double,
        json['Variacao'] as double,
        json['Mes'] as int,
        json['Ano'] as int,
        json['OrderInSet'] as int,
        json['Peso'] as double);
  }

  int compareTo(FaturamentoVisaoMensalDataPoint other) {
    return this.sequencia.compareTo(other.sequencia);
  }
}
