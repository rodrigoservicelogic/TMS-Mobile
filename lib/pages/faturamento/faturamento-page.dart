import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:getflutter/getflutter.dart';
import 'package:tms_mobile/controller/faturamento/faturamento-cliente-controller.dart';
import 'package:tms_mobile/controller/faturamento/faturamento-un-controller.dart';
import 'package:tms_mobile/models/filtrofaturamento-model.dart';
import 'package:tms_mobile/pages/faturamento-mensal.dart';
import 'package:tms_mobile/widgets/dateTimePicker.dart';
import 'package:tms_mobile/widgets/drawer.dart';
import 'package:intl/intl.dart';

import '../../global.dart';
import 'faturamento-cliente.dart';
import 'faturamento-visao-un.dart';

class FaturamentoPage extends StatefulWidget {
  final PageController pageController;
  final ModelFiltroFaturamento filtroFaturamento;

  FaturamentoPage(this.pageController, this.filtroFaturamento);

  @override
  _FaturamentoPageState createState() => _FaturamentoPageState();
}

class _FaturamentoPageState extends State<FaturamentoPage> {
  DateTime _dataInicial, _dataFinal;
  final controllerFaturamentoUn = GetIt.I.get<FaturamentoUnController>();
  final controllerEmpresa = GetIt.I.get<FaturamentoClienteController>();
  NumberFormat format = NumberFormat.currency(locale: "pt_BR", symbol: "R\$");

  @override
  void initState() {
    super.initState();

    _dataInicial = widget.filtroFaturamento.dataDe != null
        ? widget.filtroFaturamento.dataDe
        : DateTime.now();
    _dataFinal = widget.filtroFaturamento.dataAte != null
        ? widget.filtroFaturamento.dataAte
        : DateTime.now();

    _init();
  }

  void _init() async {
    String retorno =
        await controllerFaturamentoUn.getFaturamento(widget.filtroFaturamento);

    if (retorno != 'ok') {
      Navigator.of(context).pop();
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: Text("Atenção"),
              content: Text(retorno),
              actions: <Widget>[
                FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(width: 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: DrawerPage(widget.pageController),
      appBar: AppBar(
        centerTitle: true,
        title: Text("RESULTADOS"),
        leading: Center(
          child: Image.asset(
            "images/icon_resultados.png",
            width: 45,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Color.fromRGBO(39, 74, 139, 1),
                Color.fromRGBO(110, 170, 211, 1)
              ])),
        ),
      ),
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Observer(
              builder: (_) {
                if (controllerFaturamentoUn.isLoad) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: constraints.maxWidth,
                        child: Container(
                          color: Color(COR_PRIMARY),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 8.0),
                            child: Center(
                              child: SizedBox(
                                width: constraints.maxWidth * .50,
                                child: FittedBox(
                                  child: Text(
                                    "FATURAMENTO",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.02,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: DateTimePicker(
                              labelText: "De:",
                              selectedDate: _dataInicial,
                              selectDate: (DateTime date) {
                                print(date);
                                setState(() {
                                  _dataInicial = date;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: constraints.maxWidth * 0.02,
                          ),
                          Expanded(
                            flex: 4,
                            child: DateTimePicker(
                              labelText: "Até:",
                              selectedDate: _dataFinal,
                              selectDate: (DateTime date) {
                                print(date);
                                setState(() {
                                  _dataFinal = date;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.02,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Container(
                          decoration: myBoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 6.0),
                            child: Center(
                              child: SizedBox(
                                width: constraints.maxWidth * 0.5,
                                child: FittedBox(
                                  child: Text(
                                    controllerFaturamentoUn
                                                .faturamento.valorTotal !=
                                            null
                                        ? format.format(controllerFaturamentoUn
                                            .faturamento.valorTotal)
                                        : "R\$ 0,00",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(COR_PRIMARY)),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.02,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                              flex: 4,
                              child: Center(
                                child: SizedBox(
                                  width: constraints.maxWidth * 0.60,
                                  height: constraints.maxHeight * 0.05,
                                  child: FittedBox(
                                    child: Text(
                                      "Mesmo Período (Ano Anterior):",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF606062)),
                                    ),
                                  ),
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: Center(
                                child: SizedBox(
                                  height: constraints.maxHeight * 0.05,
                                  width: constraints.maxWidth * 0.30,
                                  child: FittedBox(
                                    child: Text(
                                      "%",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF606062)),
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.005,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                              flex: 4,
                              child: Container(
                                decoration: myBoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 6.0),
                                  child: Center(
                                    child: SizedBox(
                                      width: constraints.maxWidth * 0.60,
                                      height: constraints.maxHeight * 0.06,
                                      child: FittedBox(
                                        child: Text(
                                          controllerFaturamentoUn.faturamento
                                                      .valorAnoAnterior !=
                                                  null
                                              ? format.format(
                                                  controllerFaturamentoUn
                                                      .faturamento
                                                      .valorAnoAnterior)
                                              : "R\$ 0,00",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF606062)),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: constraints.maxWidth * 0.02,
                          ),
                          Expanded(
                              flex: 2,
                              child: Container(
                                decoration: myBoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 6.0),
                                  child: Center(
                                    child: SizedBox(
                                      width: constraints.maxWidth * 0.30,
                                      height: constraints.maxHeight * 0.06,
                                      child: FittedBox(
                                        child: Text(
                                          controllerFaturamentoUn.faturamento
                                                      .perCresValor !=
                                                  null
                                              ? controllerFaturamentoUn
                                                  .faturamento.perCresValor
                                                  .toString()
                                              : "0,00",
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: Color(0XFF00ab85)),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.02,
                      ),
                      Container(
                        child: GFCarousel(
                            height: constraints.maxHeight * 0.50,
                            viewportFraction: 0.98,
                            aspectRatio: MediaQuery.of(context).devicePixelRatio,
                            pagerSize: 0.0,
                            pagination: true,
                            autoPlay: false,
                            items: <Widget>[
                              FaturamentoVisaoMensal(widget.filtroFaturamento),
                              FaturamentoVisaoUn(widget.filtroFaturamento),
                              FaturamentoCliente(),
                              FittedBox(child: Text("Slide 3")),
                            ]),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.02,
                      ),
                      Container(
                        child: Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            child: RaisedButton(
                              color: Color(COR_PRIMARY),
                              textColor: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0, vertical: 15.0),
                                child: Text(
                                  "Voltar",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
