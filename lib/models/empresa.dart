class Empresa {
  int idEmpresa;
  String codigo;
  String nome;
  int desativado;

  Empresa({this.idEmpresa, this.codigo, this.nome, this.desativado});

  Empresa.fromJson(Map<String, dynamic> json) {
    idEmpresa = json['IdEmpresa'];
    codigo = json['Codigo'];
    nome = json['Nome'] == 'GO SERV TRANSPORTES EIRELI' ? 'SERVICELOGIC TRANSPORTES' : 'SL LOGISTICA';
    desativado = json['Desativado'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IdEmpresa'] = this.idEmpresa;
    data['Codigo'] = this.codigo;
    data['Nome'] = this.nome;
    data['Desativado'] = this.desativado;
    return data;
  }
}
