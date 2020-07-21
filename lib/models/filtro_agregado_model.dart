import 'package:tms_mobile/models/agregado.dart';

class ModelFiltroAgregado {
  int idFilial;
  DateTime dataInicial;
  DateTime dataFinal;
  Agregado agregado;
  String placa;

  ModelFiltroAgregado({this.agregado, this.dataFinal, this.dataInicial, this.idFilial, this.placa});

  Map toMap() {
    Map<String, dynamic> map = {
      'IdFiliai': this.idFilial,
      'DataInicial': this.dataInicial.toIso8601String(),
      'DataFinal': this.dataFinal.toIso8601String(),
      'CodAgregado': this.agregado != null ? this.agregado.codAgregado : null,
      'Placa': this.placa
    };

    return map;
  }

  String asQueryParams() {
    var queryParams = 'idFilial=${this.idFilial.toString()}';

    if(this.dataInicial != null && this.dataFinal != null)
      queryParams += 'dataInicial=${this.dataInicial.toString()}&dataFinal=${this.dataFinal.toString()}';

    if(this.agregado.codAgregado != null)
      queryParams += 'codAgregado=${this.agregado.codAgregado}';

    if(this.placa != null)
      queryParams += 'placa=${this.placa}';

    return queryParams;
  }
}