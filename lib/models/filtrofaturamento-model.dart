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
    return 'DataDe=${this.dataDe.toString()}&DataAte=${this.dataAte.toString()}&IdUnidadeNegocio=${this.idUnidadeNegocio}&TipoFrete=${this.tipoFrete}&CodigoCliente=${this.codigoCliente}';
  }
}