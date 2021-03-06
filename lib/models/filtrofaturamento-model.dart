class ModelFiltroFaturamento{
  DateTime dataDe;
  DateTime dataAte;
  int idUnidadeNegocio;
  String tipoFrete;
  String codigoCliente;
  int idGrupoCliente;

  ModelFiltroFaturamento(this.dataDe, this.dataAte, {this.idUnidadeNegocio = 0, this.tipoFrete = "", this.codigoCliente = "", this.idGrupoCliente = 0});

  Map toMap(){
    Map<String, dynamic> map = {
      'DataDe' : this.dataDe.toString(),
      'DataAte' : this.dataAte.toString(),
      'IdUnidadeNegocio' : this.idUnidadeNegocio,
      'TipoFrete' : this.tipoFrete,
      'CodigoCliente' : this.codigoCliente, 
      "IdGrupoCliente": this.idGrupoCliente
    };
    
    return map;
  }

  String asQueryParams(){
    var queryParams = 'DataDe=${this.dataDe.toString()}&DataAte=${this.dataAte.toString()}';
    if (this.idUnidadeNegocio != null && this.idUnidadeNegocio > 0){
      queryParams += '&IdUnidadeNegocio=${this.idUnidadeNegocio}';
    }
    if (this.tipoFrete != null && this.tipoFrete.isNotEmpty && this.tipoFrete != "Todos"){
      queryParams += '&TipoFrete=${this.tipoFrete}';
    }
    if (this.codigoCliente != null && this.codigoCliente.isNotEmpty && this.codigoCliente != "0"){
      queryParams += '&CodigoCliente=${this.codigoCliente}';
    }
    if(this.idGrupoCliente != null && this.idGrupoCliente > 0) {
      queryParams += '&IdGrupoCliente=${this.idGrupoCliente}';
    }
    return queryParams;
  }
}