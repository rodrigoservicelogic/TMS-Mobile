import 'package:tms_mobile/controller/faturamento-mensal-controller.dart';

class FaturamentoVisaoMensalDataPoint{
  double faturamento;
  int mes;
  int ano;

  // FaturamentoVisaoMensalDataPoint();
  FaturamentoVisaoMensalDataPoint(this.faturamento, this.mes, this.ano);

  FaturamentoVisaoMensalDataPoint.fromMap(Map<String, dynamic> map){
    faturamento = map["Faturamento"];
    mes = map["Mes"];
    ano = map["Ano"];
  }

  factory FaturamentoVisaoMensalDataPoint.fromJson(dynamic json){
    return FaturamentoVisaoMensalDataPoint(json['Faturamento'] as double, json['Mes'] as int, json['Ano'] as int);
  }
}