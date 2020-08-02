class FaturamentoUn {
  List<ListaFiliais> listaFiliais;
  List<ListaClientes> listaClientes;
  List<ListaTipoTransporte> listaTipoTransporte;

  double valorTotal;
  double valorAnoAnterior;
  double perCresValor;

  FaturamentoUn(
      {this.listaFiliais,
      this.listaClientes,
      this.valorTotal,
      this.valorAnoAnterior,
      this.perCresValor,
      this.listaTipoTransporte});

  FaturamentoUn.fromJson(Map<String, dynamic> json) {
    if (json['ListaFiliais'] != null) {
      listaFiliais = new List<ListaFiliais>();
      json['ListaFiliais'].forEach((v) {
        listaFiliais.add(new ListaFiliais.fromJson(v));
      });
    }
    if (json['ListaClientes'] != null) {
      listaClientes = new List<ListaClientes>();
      json['ListaClientes'].forEach((v) {
        listaClientes.add(new ListaClientes.fromJson(v));
      });
    }
    if (json['ListaTipoTransporte'] != null) {
      listaTipoTransporte = new List<ListaTipoTransporte>();
      json['ListaTipoTransporte'].forEach((v) {
        listaTipoTransporte.add(new ListaTipoTransporte.fromJson(v));
      });
    }
    valorTotal = json['ValorTotal'];
    valorAnoAnterior = json['ValorAnoAnterior'];
    perCresValor = json['PerCresValor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.listaFiliais != null) {
      data['ListaFiliais'] = this.listaFiliais.map((v) => v.toJson()).toList();
    }
    if (this.listaClientes != null) {
      data['ListaClientes'] =
          this.listaClientes.map((v) => v.toJson()).toList();
    }
    if (this.listaTipoTransporte != null) {
      data['ListaTipoTransporte'] =
          this.listaTipoTransporte.map((v) => v.toJson()).toList();
    }
    data['ValorTotal'] = this.valorTotal;
    data['ValorAnoAnterior'] = this.valorAnoAnterior;
    data['PerCresValor'] = this.perCresValor;
    return data;
  }
}

class ListaFiliais {
  String nomeFilial;
  double valorTotal;
  double perCresValor;

  ListaFiliais({this.nomeFilial, this.valorTotal, this.perCresValor});

  ListaFiliais.fromJson(Map<String, dynamic> json) {
    nomeFilial = json['NomeFilial'];
    valorTotal = json['ValorTotal'];
    perCresValor = json['PerCresValor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NomeFilial'] = this.nomeFilial;
    data['ValorTotal'] = this.valorTotal;
    data['PerCresValor'] = this.perCresValor;
    return data;
  }
}

class ListaClientes {
  String nomeCliente;
  double valorTotal;
  double perCresValor;

  ListaClientes({this.nomeCliente, this.valorTotal, this.perCresValor});

  ListaClientes.fromJson(Map<String, dynamic> json) {
    nomeCliente = json['NomeCliente'];
    valorTotal = json['ValorTotal'];
    perCresValor = json['PerCresValor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NomeCliente'] = this.nomeCliente;
    data['ValorTotal'] = this.valorTotal;
    data['PerCresValor'] = this.perCresValor;
    return data;
  }
}

class ListaTipoTransporte {
  String tipoTransporte;
  double valorTotal;
  double perCresValor;

  ListaTipoTransporte({this.tipoTransporte, this.valorTotal, this.perCresValor});

  ListaTipoTransporte.fromJson(Map<String, dynamic> json) {
    tipoTransporte = json['TipoTransporte'];
    valorTotal = json['ValorTotal'];
    perCresValor = json['PerCresValor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TipoTransporte'] = this.tipoTransporte;
    data['ValorTotal'] = this.valorTotal;
    data['PerCresValor'] = this.perCresValor;
    return data;
  }
}