class ModelFiltroFaturamento{
  DateTime dataDe;
  DateTime dataAte;
  int idUnidadeNegocio;
  String tipoFrete;
  String codigoCliente;

  ModelFiltroFaturamento(this.dataDe, this.dataAte, {this.idUnidadeNegocio = 0, this.tipoFrete = "", this.codigoCliente = ""});

  Map toMap(){
    Map<String, dynamic> map = {
      'DataDe' : this.dataDe.toString(),
      'DataAte' : this.dataAte.toString(),
      'IdUnidadeNegocio' : this.idUnidadeNegocio,
      'TipoFrete' : this.tipoFrete,
      'CodigoCliente' : this.codigoCliente, 
    };
    
    return map;
  }

  String asQueryParams(){
    var queryParams = 'DataDe=${this.dataDe.toString()}&DataAte=${this.dataAte.toString()}';
    if (this.idUnidadeNegocio != null && this.idUnidadeNegocio > 0){
      queryParams += '&IdUnidadeNegocio=${this.idUnidadeNegocio}';
    }
    if (this.tipoFrete != null && this.tipoFrete.isNotEmpty){
      queryParams += '&TipoFrete=${this.tipoFrete}';
    }
    if (this.codigoCliente != null && this.codigoCliente.isNotEmpty){
      queryParams += '&CodigoCliente=${this.codigoCliente}';
    }
    return queryParams;
  }
}