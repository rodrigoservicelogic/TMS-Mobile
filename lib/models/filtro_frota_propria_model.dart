class ModelFiltroFrotaPropria {
  int idFilial;
  DateTime dataInicial;
  DateTime dataFinal;
  String codMotorista;
  String placa;

  ModelFiltroFrotaPropria({this.codMotorista, this.dataFinal, this.dataInicial, this.idFilial, this.placa});

  Map toMap() {
    Map<String, dynamic> map = {
      'IdFiliai': this.idFilial,
      'DataInicial': this.dataInicial.toIso8601String(),
      'DataFinal': this.dataFinal.toIso8601String(),
      'CodMotorista': this.codMotorista,
      'Placa': this.placa
    };

    return map;
  }

  String asQueryParams() {
    var queryParams = 'idFilial=${this.idFilial.toString()}';

    if(this.dataInicial != null && this.dataFinal != null)
      queryParams += 'dataInicial=${this.dataInicial.toString()}&dataFinal=${this.dataFinal.toString()}';

    if(this.codMotorista != null)
      queryParams += 'codMotorista=${this.codMotorista}';

    if(this.placa != null)
      queryParams += 'placa=${this.placa}';

    return queryParams;
  }
}