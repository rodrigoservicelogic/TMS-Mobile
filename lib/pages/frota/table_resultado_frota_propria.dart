import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:tms_mobile/controller/frota/frota-propria-controller.dart';

class TableResultadoFrotaPropria extends StatelessWidget {
  final controller = GetIt.I.get<FrotaPropriaController>();
  final NumberFormat format = NumberFormat.currency(locale: "pt_BR", symbol: "");

  BoxDecoration myBoxDecoration(double size) {
    return BoxDecoration(
      border: Border(bottom: BorderSide(width: size)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ListView.builder(
          itemCount: controller.listaFrotaPropria.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                Center(
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 50,
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
                            '${format.format(controller.listaFrotaPropria[index].receita)}',
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
                    height: 50,
                    width: MediaQuery.of(context).size.width - 50,
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
                            '${format.format(controller.listaFrotaPropria[index].despesa)}',
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
                    decoration: myBoxDecoration(.3),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Text(
                            "Impostos",
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${format.format(controller.listaFrotaPropria[index].impostos)}',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            '${format.format(controller.listaFrotaPropria[index].percentualImpostos)}',
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
                    width: MediaQuery.of(context).size.width - 50,
                    decoration: myBoxDecoration(.3),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Text(
                            "Custos Fixos",
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${format.format(controller.listaFrotaPropria[index].custosFixos)}',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            '${format.format(controller.listaFrotaPropria[index].percentualCustoFixo)}',
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
                    width: MediaQuery.of(context).size.width - 50,
                    decoration: myBoxDecoration(.3),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Text(
                            "Custos Variáveis",
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${format.format(controller.listaFrotaPropria[index].custosVariaveis)}',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            '${format.format(controller.listaFrotaPropria[index].percentualCustoVariavel)}',
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
                    width: MediaQuery.of(context).size.width - 50,
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
                            '${format.format(controller.listaFrotaPropria[index].resultado)}',
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
                    width: MediaQuery.of(context).size.width - 50,
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
                            '${format.format(controller.listaFrotaPropria[index].percentualResultado)}',
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
      },
    );
  }
}
