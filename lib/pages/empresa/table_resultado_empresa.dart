import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tms_mobile/models/resultado_empresa.dart';

import '../../global.dart';

class TableResultadoEmpresa extends StatelessWidget {
  final NumberFormat format =
      NumberFormat.currency(locale: "pt_BR", symbol: "", decimalDigits: 2);

  final List<ResultadoEmpresa> resultadoEmpresa;
  TableResultadoEmpresa(this.resultadoEmpresa);

  double despesasAdmPerc = 0;
  double despesasOperPerc = 0;
  double investimentosPerc = 0;

  BoxDecoration myBoxDecoration(double size) {
    return BoxDecoration(
      border: Border(bottom: BorderSide(width: size)),
    );
  }

  void ajustarPercentual() {
    double diff = 0;
    double total = double.parse(despesasAdmPerc.toStringAsFixed(2)) + double.parse(despesasOperPerc.toStringAsFixed(2)) + double.parse(investimentosPerc.toStringAsFixed(2));

    if(total < 100) {
      diff = 100 - total;
      investimentosPerc += diff;
    } else if(total > 100) {
      diff = total - 100;
      investimentosPerc -= diff;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: resultadoEmpresa.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        despesasAdmPerc = resultadoEmpresa[index].despesasAdmPerc;
        despesasOperPerc = resultadoEmpresa[index].despesasOperPerc;
        investimentosPerc = resultadoEmpresa[index].investimentosPerc;

        ajustarPercentual();

        return Column(
          children: <Widget>[
            Center(
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 90,
                decoration: myBoxDecoration(1.4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "RECEITA (R\$)",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '${format.format(resultadoEmpresa[index].receita)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: 25,
                width: MediaQuery.of(context).size.width - 90,
                decoration: myBoxDecoration(.3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Frete Frota",
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${format.format(resultadoEmpresa[index].freteFrota)}',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '${format.format(resultadoEmpresa[index].freteFrotaPerc)} %',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: 25,
                width: MediaQuery.of(context).size.width - 90,
                decoration: myBoxDecoration(.3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Frete Agregados",
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${format.format(resultadoEmpresa[index].freteAgregados)}',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '${format.format(resultadoEmpresa[index].freteAgregadosPerc)} %',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: 25,
                width: MediaQuery.of(context).size.width - 90,
                decoration: myBoxDecoration(.3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Frete Terceiros",
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${format.format(resultadoEmpresa[index].freteTerceiros)}',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '${format.format(resultadoEmpresa[index].freteTerPerc)} %',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 90,
                decoration: myBoxDecoration(1.4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "DESPESA (R\$)",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '${format.format(resultadoEmpresa[index].despesa)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: 25,
                width: MediaQuery.of(context).size.width - 50,
                // decoration: myBoxDecoration(3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 20,
                    ),
                    Container(
                      decoration: myBoxDecoration(.3),
                      height: 25,
                      width: MediaQuery.of(context).size.width - 90,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Despesas Adm",
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${format.format(resultadoEmpresa[index].despesaAdm)}',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              '${format.format(despesasAdmPerc)} %',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        " [+]",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Color(COR_PRIMARY)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: 25,
                width: MediaQuery.of(context).size.width - 50,
                // decoration: myBoxDecoration(3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 20,
                    ),
                    Container(
                      decoration: myBoxDecoration(.3),
                      height: 25,
                      width: MediaQuery.of(context).size.width - 90,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Despesas Operacionais",
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${format.format(resultadoEmpresa[index].despesaOperacional)}',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              '${format.format(despesasOperPerc)} %',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        " [+]",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Color(COR_PRIMARY)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: 25,
                width: MediaQuery.of(context).size.width - 50,
                // decoration: myBoxDecoration(3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 20,
                    ),
                    Container(
                      decoration: myBoxDecoration(.3),
                      height: 25,
                      width: MediaQuery.of(context).size.width - 90,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Investimentos",
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${format.format(resultadoEmpresa[index].investimentos)}',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              '${format.format(investimentosPerc)} %',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        " [+]",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Color(COR_PRIMARY)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 90,
                decoration: myBoxDecoration(1.4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "RESULTADO (R\$)",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '${format.format(resultadoEmpresa[index].resultado)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: 25,
                width: MediaQuery.of(context).size.width - 90,
                decoration: myBoxDecoration(1.4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "RESULTADO (%)",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '${format.format(resultadoEmpresa[index].percentualResultado)} %',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
