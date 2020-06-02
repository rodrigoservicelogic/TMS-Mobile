class FaturamentoUn {
  List<ListaFiliais> listaFiliais;
  double valorTotal;
  double valorAnoAnterior;
  double perCresValor;

  FaturamentoUn();

  FaturamentoUn.fromJson(Map<String, dynamic> json) {
    if (json['ListaFiliais'] != null) {
      listaFiliais = new List<ListaFiliais>();
      json['ListaFiliais'].forEach((v) {
        listaFiliais.add(new ListaFiliais.fromJson(v));
      });
    }
    valorTotal = json['ValorTotal'] ?? 0.00;
    valorAnoAnterior = json['ValorAnoAnterior'] ?? 0.00;
    perCresValor = json['PerCresValor'] ?? 0.00;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.listaFiliais != null) {
      data['ListaFiliais'] = this.listaFiliais.map((v) => v.toJson()).toList();
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
