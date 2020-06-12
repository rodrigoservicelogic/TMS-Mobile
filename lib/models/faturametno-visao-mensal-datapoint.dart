class FaturamentoVisaoMensalDataPoint {
  double faturamentoPeriodo;
  double faturamentoAnterior;
  double variacao;
  int mes;
  int ano;
  int sequencia;

  // FaturamentoVisaoMensalDataPoint();
  FaturamentoVisaoMensalDataPoint(
      this.faturamentoPeriodo,
      this.faturamentoAnterior,
      this.variacao,
      this.mes,
      this.ano,
      this.sequencia);

  FaturamentoVisaoMensalDataPoint.fromMap(Map<String, dynamic> map) {
    faturamentoPeriodo = map["FaturamentoPeriodo"];
    faturamentoAnterior = map["FaturamentoAnterior"];
    variacao = map["Variacao"];
    mes = map["Mes"];
    ano = map["Ano"];
    sequencia = map["OrderInSet"];
  }

  factory FaturamentoVisaoMensalDataPoint.fromJson(dynamic json) {
    return FaturamentoVisaoMensalDataPoint(
        json['FaturamentoPeriodo'] as double,
        json['FaturamentoAnterior'] as double,
        json['Variacao'] as double,
        json['Mes'] as int,
        json['Ano'] as int,
        json['OrderInSet'] as int);
  }

  int compareTo(FaturamentoVisaoMensalDataPoint other) {
    return this.sequencia.compareTo(other.sequencia);
  }
}
