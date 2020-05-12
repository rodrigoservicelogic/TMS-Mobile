class FaturamentoVisaoMensalDataPoint{
  double faturamento;
  int mes;
  int ano;

  FaturamentoVisaoMensalDataPoint();

  FaturamentoVisaoMensalDataPoint.fromMap(Map<String, dynamic> map){
    faturamento = map["Faturamento"];
    mes = map["Mes"];
    ano = map["Ano"];
  }
}