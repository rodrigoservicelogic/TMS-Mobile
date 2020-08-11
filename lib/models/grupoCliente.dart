class GrupoCliente {
  int idGrupoCliente;
  String nome;

  GrupoCliente({this.idGrupoCliente, this.nome});

  GrupoCliente.fromJson(Map<String, dynamic> json) {
    idGrupoCliente = json['IdGrupoCliente'];
    nome = json['Nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IdGrupoCliente'] = this.idGrupoCliente;
    data['Nome'] = this.nome;
    return data;
  }
}