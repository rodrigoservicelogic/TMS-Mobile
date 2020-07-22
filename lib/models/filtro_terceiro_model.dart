import 'package:tms_mobile/models/terceiro.dart';

class ModelFiltroTerceiro {
  int idFilial;
  DateTime dataInicial;
  DateTime dataFinal;
  Terceiro terceiro;
  String placa;

  ModelFiltroTerceiro({this.terceiro, this.dataFinal, this.dataInicial, this.idFilial, this.placa});

  Map toMap() {
    Map<String, dynamic> map = {
      'IdFilial': this.idFilial,
      'DataInicial': this.dataInicial.toIso8601String(),
      'DataFinal': this.dataFinal.toIso8601String(),
      'CodTerceiro': this.terceiro != null && this.terceiro.idTerceiros != 0 ? this.terceiro.codTerceiro : null,
      'Placa': this.placa
    };

    return map;
  }

  String asQueryParams() {
    var queryParams = 'idFilial=${this.idFilial.toString()}';

    if(this.dataInicial != null && this.dataFinal != null)
      queryParams += 'dataInicial=${this.dataInicial.toString()}&dataFinal=${this.dataFinal.toString()}';

    if(this.terceiro != null)
      queryParams += 'codTerceiro=${this.terceiro.codTerceiro}';

    if(this.placa != null)
      queryParams += 'placa=${this.placa}';

    return queryParams;
  }
}