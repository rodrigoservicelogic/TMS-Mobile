class ModelFiltroResultadoEmpresa {
  int idFilial;
  DateTime dataInicial;
  DateTime dataFinal;
  String regime;

  ModelFiltroResultadoEmpresa({this.dataFinal, this.dataInicial, this.idFilial, this.regime});

  Map toMap() {
    Map<String, dynamic> map = {
      'IdFiliai': this.idFilial,
      'DataInicial': this.dataInicial.toIso8601String(),
      'DataFinal': this.dataFinal.toIso8601String(),
      'Regime': this.regime
    };

    return map;
  }

  String asQueryParams() {
    var queryParams = 'idFilial=${this.idFilial.toString()}';

    if(this.dataInicial != null && this.dataFinal != null)
      queryParams += 'dataInicial=${this.dataInicial.toString()}&dataFinal=${this.dataFinal.toString()}';

    if(this.regime != null)
      queryParams += 'regime=${this.regime}';

    return queryParams;
  }
}