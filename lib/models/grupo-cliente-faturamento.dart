class GrupoClienteFaturamento {
  String codGrupoCliente;
  String nomeGrupoCliente;
  num totalPeso;
  num valor;

  GrupoClienteFaturamento();

  GrupoClienteFaturamento.fromJson(Map<String, dynamic> json) {
    codGrupoCliente = json['IdGrupoCliente'].toString();
    nomeGrupoCliente = json['NomeGrupo'];
    totalPeso = json['TotalPesoNF'];
    valor = json['Valor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IdGrupoCliente'] = this.codGrupoCliente;
    data['NomeGrupo'] = this.nomeGrupoCliente;
    data['TotalPesoNF'] = this.totalPeso;
    data['Valor'] = this.valor;
    return data;
  }
}
