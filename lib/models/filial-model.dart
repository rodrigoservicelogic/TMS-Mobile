class Filial {
  int idFilial;
  int idEmpresa;
  String razaoSocial;
  String nomeFantasia;
  String cnpj;
  int desativado;
  String ultimaAtualizacao;

  Filial();

  Filial.fromJson(Map<String, dynamic> json) {
    idFilial = json['IdFilial'];
    idEmpresa = json['IdEmpresa'];
    razaoSocial = json['RazaoSocial'];
    nomeFantasia = json['NomeFantasia'];
    cnpj = json['Cnpj'];
    desativado = json['Desativado'];
    ultimaAtualizacao = json['UltimaAtualizacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IdFilial'] = this.idFilial;
    data['IdEmpresa'] = this.idEmpresa;
    data['RazaoSocial'] = this.razaoSocial;
    data['NomeFantasia'] = this.nomeFantasia;
    data['Cnpj'] = this.cnpj;
    data['Desativado'] = this.desativado;
    data['UltimaAtualizacao'] = this.ultimaAtualizacao;

    return data;
  }
}
