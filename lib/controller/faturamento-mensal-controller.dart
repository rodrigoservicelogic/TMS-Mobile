import 'package:charts_flutter/flutter.dart' as charts;
import 'package:tms_mobile/pages/faturamento-mensal.dart';
import 'package:mobx/mobx.dart';
part 'faturamento-mensal-controller.g.dart';

class FaturamentoVisaoMensalController = _FaturamentoVisaoMensalControllerBase
    with _$FaturamentoVisaoMensalController;

abstract class _FaturamentoVisaoMensalControllerBase with Store {
  List<charts.Series<Dados, String>> series = List();

  @action
  getSeries() {
    var lista2019 = List<Dados>();
    lista2019.add(Dados('01', 6000000.00));
    lista2019.add(Dados('02', 6000000.00));
    lista2019.add(Dados('03', 6000000.00));

    var lista2020 = List<Dados>();
    lista2020.add(Dados('01', 4000000.00));
    lista2020.add(Dados('02', 4000000.00));
    lista2020.add(Dados('03', 4000000.00));

    var dummy2019 = charts.Series(
      id: '2019',
      domainFn: (Dados d, _) => d.mes,
      measureFn: (Dados d, _) => d.valor,
      data: lista2019,
    );

    var dummy2020 = charts.Series(
      id: '2019',
      domainFn: (Dados d, _) => d.mes,
      measureFn: (Dados d, _) => d.valor,
      data: lista2020,
    );

    series.clear();
    series.add(dummy2019);
    series.add(dummy2020);
    return series;
  }
}

class Dados {
  final String mes;
  final double valor;

  Dados(this.mes, this.valor);
}
