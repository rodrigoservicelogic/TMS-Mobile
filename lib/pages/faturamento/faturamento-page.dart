import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:getflutter/getflutter.dart';
import 'package:tms_mobile/controller/empresa/empresa-controller.dart';
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
      body: SingleChildScrollView(
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
                    height: 60,
                    width: double.infinity,
                    child: Container(
                      color: Color(COR_PRIMARY),
                      child: Center(
                        child: Text(
                          "FATURAMENTO",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 13,
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
                        width: 15,
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
                    height: 13,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Container(
                      decoration: myBoxDecoration(),
                      child: Center(
                        child: Text(
                          controllerFaturamentoUn.faturamento.valorTotal != null
                              ? format.format(controllerFaturamentoUn
                                  .faturamento.valorTotal)
                              : "R\$ 0,00",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Color(COR_PRIMARY)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Expanded(
                          flex: 4,
                          child: Text(
                            "Mesmo Período (Ano Anterior):",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color(0xFF606062)),
                          )),
                      Expanded(
                          flex: 1,
                          child: Text(
                            "%",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color(0xFF606062)),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Expanded(
                          flex: 4,
                          child: Container(
                            height: 50,
                            decoration: myBoxDecoration(),
                            child: Center(
                              child: Text(
                                controllerFaturamentoUn
                                            .faturamento.valorAnoAnterior !=
                                        null
                                    ? format.format(controllerFaturamentoUn
                                        .faturamento.valorAnoAnterior)
                                    : "R\$ 0,00",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color(0xFF606062)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )),
                      SizedBox(
                        width: 13,
                      ),
                      Expanded(
                          flex: 2,
                          child: Container(
                            height: 50,
                            decoration: myBoxDecoration(),
                            child: Center(
                              child: Text(
                                controllerFaturamentoUn
                                            .faturamento.perCresValor !=
                                        null
                                    ? controllerFaturamentoUn
                                        .faturamento.perCresValor
                                        .toString()
                                    : "0,00",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20,
                                    color: Color(0XFF00ab85)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Container(
                    height: 390,
                    child: GFCarousel(
                        viewportFraction: 0.99,
                        aspectRatio: 1,
                        pagination: true,
                        autoPlay: false,
                        items: <Widget>[
                          FaturamentoVisaoMensal(widget.filtroFaturamento),
                          FaturamentoVisaoUn(widget.filtroFaturamento),
                          FaturamentoCliente(),
                          Text("Slide 3"),
                        ]),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 295,
                        height: 60,
                        child: RaisedButton(
                          color: Color(COR_PRIMARY),
                          textColor: Colors.white,
                          child: Text(
                            "Voltar",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
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
      ),
    );
  }
}
