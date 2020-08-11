import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:getflutter/getflutter.dart';
import 'package:smart_select/smart_select.dart';
import 'package:tms_mobile/controller/faturamento/faturamento-cliente-controller.dart';
import 'package:tms_mobile/controller/faturamento/faturamento-un-controller.dart';
import 'package:tms_mobile/models/filtrofaturamento-model.dart';
import 'package:tms_mobile/pages/faturamento-mensal.dart';
import 'package:tms_mobile/pages/faturamento/FaturamentoVisaoGrupoCliente.dart';
import 'package:tms_mobile/widgets/dateTimePicker.dart';
import 'package:tms_mobile/widgets/drawer.dart';
import 'package:intl/intl.dart';

import '../../global.dart';
import 'faturamento-cliente.dart';
import 'faturamento-peso.dart';
import 'faturamento-tipo-transporte.dart';
import 'faturamento-visao-un.dart';

class FaturamentoPage extends StatefulWidget {
  final PageController pageController;
  final ModelFiltroFaturamento filtroFaturamento;

  FaturamentoPage(this.pageController, {this.filtroFaturamento});

  @override
  _FaturamentoPageState createState() => _FaturamentoPageState();
}

class _FaturamentoPageState extends State<FaturamentoPage> {
  DateTime _dataInicial, _dataFinal;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final controllerFaturamentoUn = GetIt.I.get<FaturamentoUnController>();
  //final controllerEmpresa = GetIt.I.get<FaturamentoClienteController>();
  NumberFormat format = NumberFormat.currency(locale: "pt_BR", symbol: "");
  ModelFiltroFaturamento filtro;

  @override
  void initState() {
    super.initState();

    filtro = widget.filtroFaturamento != null
        ? widget.filtroFaturamento
        : ModelFiltroFaturamento(DateTime.now(), DateTime.now());

    _dataInicial = filtro.dataDe;
    _dataFinal = filtro.dataAte;

    _init();
  }

  void _init() async {
    await controllerFaturamentoUn.getListaFilial();
    // String retorno =
    //     await controllerFaturamentoUn.getFaturamento(widget.filtroFaturamento);

    // if (retorno != 'ok') {
    //   Navigator.of(context).pop();
    //   showDialog(
    //       context: context,
    //       barrierDismissible: false,
    //       builder: (context) {
    //         return AlertDialog(
    //           title: Text("Atenção"),
    //           content: Text(retorno),
    //           actions: <Widget>[
    //             FlatButton(
    //               child: Text("OK"),
    //               onPressed: () {
    //                 Navigator.of(context).pop();
    //               },
    //             )
    //           ],
    //         );
    //       });
    // }
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(width: 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    int size = MediaQuery.of(context).devicePixelRatio.round();

    size = size < minAspectRation ? minAspectRation : size;
    size = size > maxAspectRation ? maxAspectRation : size;

    double titleSize = 0.0;

    if (size == 1) {
      titleSize = titleSmall;
    } else if (size == 2) {
      titleSize = titleMedium;
    } else if (size == 3) {
      titleSize = titleLarge;
    }

    return Scaffold(
      //endDrawer: DrawerPage(widget.pageController),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          centerTitle: true,
          title: ListTile(
            title: const Text("RESULTADOS",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center),
            subtitle: const Text("Faturamento",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center),
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
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () async {
                await controllerFaturamentoUn.createPdf();
              },
            ),
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DrawerPage(widget.pageController),
                    fullscreenDialog: true));
              },
            )
          ],
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

            return Column(
              children: <Widget>[
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: ExpansionTile(
                    title: Text("Filtros"),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Expanded(
                                  flex: 4,
                                  child: DateTimePicker(
                                    labelText: "De:",
                                    selectedDate: _dataInicial,
                                    selectDate: (DateTime date) {
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
                            Container(
                              width: double.infinity,
                              child: SmartSelect<int>.single(
                                  padding: EdgeInsets.zero,
                                  title: 'Por Unidade de Negócio',
                                  titleStyle: TextStyle(
                                      color: Color(COR_PRIMARY), fontSize: 14),
                                  placeholder: 'Selecione',
                                  placeholderStyle: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                  modalType: SmartSelectModalType.bottomSheet,
                                  value:
                                      controllerFaturamentoUn.selectedUnidade,
                                  choiceConfig:
                                      SmartSelectChoiceConfig(useDivider: true),
                                  isTwoLine: true,
                                  options: SmartSelectOption.listFrom(
                                      source: controllerFaturamentoUn.filiais,
                                      value: (index, item) => item.idFilial,
                                      title: (index, item) =>
                                          item.nomeFantasia),
                                  onChange: (value) {
                                    setState(() {
                                      controllerFaturamentoUn.selectedUnidade =
                                          value;
                                      filtro.idUnidadeNegocio = value;
                                    });
                                  }),
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            Container(
                              width: double.infinity,
                              child: SmartSelect<String>.single(
                                  padding: EdgeInsets.zero,
                                  title: 'Por Tipo de Transporte',
                                  titleStyle: TextStyle(
                                      color: Color(COR_PRIMARY), fontSize: 14),
                                  placeholder: 'Selecione',
                                  placeholderStyle: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                  modalType: SmartSelectModalType.bottomSheet,
                                  value: controllerFaturamentoUn.selectedFrete,
                                  choiceConfig:
                                      SmartSelectChoiceConfig(useDivider: true),
                                  isTwoLine: true,
                                  options: SmartSelectOption.listFrom(
                                      source:
                                          controllerFaturamentoUn.tiposFrete,
                                      value: (index, item) => item,
                                      title: (index, item) => item),
                                  onChange: (value) {
                                    setState(() {
                                      controllerFaturamentoUn.selectedFrete =
                                          value;
                                      filtro.tipoFrete = value;
                                    });
                                  }),
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            Container(
                              width: double.infinity,
                              child: SmartSelect<int>.single(
                                  padding: EdgeInsets.zero,
                                  title: 'Por Grupo de Cliente',
                                  titleStyle: TextStyle(
                                      color: Color(COR_PRIMARY), fontSize: 14),
                                  placeholder: 'Selecione',
                                  placeholderStyle: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                  modalType: SmartSelectModalType.bottomSheet,
                                  value: controllerFaturamentoUn
                                      .selectedGrupoCliente,
                                  choiceConfig:
                                      SmartSelectChoiceConfig(useDivider: true),
                                  isTwoLine: true,
                                  options: SmartSelectOption.listFrom(
                                      source:
                                          controllerFaturamentoUn.gruposCliente,
                                      value: (index, item) =>
                                          item.idGrupoCliente,
                                      title: (index, item) => item.nome),
                                  onChange: (value) async {
                                    setState(() {
                                      controllerFaturamentoUn
                                          .selectedGrupoCliente = value;
                                      filtro.idGrupoCliente = value;
                                    });

                                    await controllerFaturamentoUn
                                        .getCliente(value);
                                  }),
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            Visibility(
                              visible: controllerFaturamentoUn.loadCliente,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            Visibility(
                              visible: !controllerFaturamentoUn.loadCliente,
                              child: Container(
                                width: double.infinity,
                                child: SmartSelect<String>.single(
                                    padding: EdgeInsets.zero,
                                    title: 'Por Cliente',
                                    titleStyle: TextStyle(
                                        color: Color(COR_PRIMARY),
                                        fontSize: 14),
                                    placeholder: 'Selecione',
                                    placeholderStyle: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    modalType: SmartSelectModalType.bottomSheet,
                                    value:
                                        controllerFaturamentoUn.selectedCliente,
                                    choiceConfig: SmartSelectChoiceConfig(
                                        useDivider: true),
                                    isTwoLine: true,
                                    options: SmartSelectOption.listFrom(
                                        source:
                                            controllerFaturamentoUn.clientes,
                                        value: (index, item) => item.codCliente,
                                        title: (index, item) =>
                                            item.nomeCliente),
                                    onChange: (value) {
                                      setState(() {
                                        controllerFaturamentoUn
                                            .selectedCliente = value;
                                        filtro.codigoCliente = value;
                                      });
                                    }),
                              ),
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            Container(
                              height: 60,
                              child: Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 60,
                                  child: RaisedButton(
                                    color: Color(COR_PRIMARY),
                                    textColor: Colors.white,
                                    child: Text(
                                      "Aplicar Filtro",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    onPressed: () async {
                                      filtro.dataDe = _dataInicial;
                                      filtro.dataAte = _dataFinal;

                                      String retorno =
                                          await controllerFaturamentoUn
                                              .getFaturamento(filtro);

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
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  )
                                                ],
                                              );
                                            });
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 50,
                //   width: double.infinity,
                //   child: Container(
                //     decoration: myBoxDecoration(),
                //     child: Center(
                //       child: Text(
                //         controllerFaturamentoUn.faturamento.valorTotal != null
                //             ? format.format(
                //                 controllerFaturamentoUn.faturamento.valorTotal)
                //             : "0,00",
                //         style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: titleSize,
                //             color: Color(COR_PRIMARY)),
                //         textAlign: TextAlign.center,
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 50,
                //   width: double.infinity,
                //   child: Container(
                //     decoration: myBoxDecoration(),
                //     child: Center(
                //       child: Text(
                //         controllerFaturamentoUn.faturamento.pesoTotal != null
                //             ? format.format(
                //                 controllerFaturamentoUn.faturamento.pesoTotal / 1000)
                //             : "0,00",
                //         style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: titleSize,
                //             color: Color(COR_PRIMARY)),
                //         textAlign: TextAlign.center,
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 13,
                ),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.end,
                //   children: <Widget>[
                //     Expanded(
                //         flex: 4,
                //         child: Text(
                //           "Mesmo Período (Ano Anterior):",
                //           style: TextStyle(
                //               fontWeight: FontWeight.bold,
                //               fontSize: 16,
                //               color: Color(0xFF606062)),
                //         )),
                //     Expanded(
                //         flex: 1,
                //         child: Text(
                //           "%",
                //           style: TextStyle(
                //               fontWeight: FontWeight.bold,
                //               fontSize: 16,
                //               color: Color(0xFF606062)),
                //         )),
                //   ],
                // ),
                // SizedBox(
                //   height: 9,
                // ),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.end,
                //   children: <Widget>[
                //     Expanded(
                //         flex: 4,
                //         child: Container(
                //           height: 50,
                //           decoration: myBoxDecoration(),
                //           child: Center(
                //             child: Text(
                //               controllerFaturamentoUn
                //                           .faturamento.valorAnoAnterior !=
                //                       null
                //                   ? format.format(controllerFaturamentoUn
                //                       .faturamento.valorAnoAnterior)
                //                   : "R\$ 0,00",
                //               style: TextStyle(
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: titleSize,
                //                   color: Color(0xFF606062)),
                //               textAlign: TextAlign.center,
                //             ),
                //           ),
                //         )),
                //     SizedBox(
                //       width: 13,
                //     ),
                //     Expanded(
                //         flex: 2,
                //         child: Container(
                //           height: 50,
                //           decoration: myBoxDecoration(),
                //           child: Center(
                //             child: Text(
                //               controllerFaturamentoUn
                //                           .faturamento.perCresValor !=
                //                       null
                //                   ? controllerFaturamentoUn
                //                       .faturamento.perCresValor
                //                       .toString()
                //                   : "0,00",
                //               style: TextStyle(
                //                   fontWeight: FontWeight.normal,
                //                   fontSize: titleSize,
                //                   color: Color(0XFF00ab85)),
                //               textAlign: TextAlign.center,
                //             ),
                //           ),
                //         )),
                //   ],
                // ),
                // SizedBox(
                //   height: 13,
                // ),
                Observer(
                  builder: (context) {
                    return Visibility(
                      visible: controllerFaturamentoUn.visible,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 13,
                          ),
                          TextFormField(
                            controller: controllerFaturamentoUn.valorTotalCtrl,
                            enabled: false,
                            decoration: InputDecoration(
                              labelText: "Total do Período",
                              labelStyle: TextStyle(fontSize: 16),
                              border: OutlineInputBorder(),
                            ),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: titleSize,
                                color: Color(COR_PRIMARY)),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 13,
                          ),
                          TextFormField(
                            controller: controllerFaturamentoUn.pesoTotalCtrl,
                            enabled: false,
                            decoration: InputDecoration(
                              labelText: "Total do Peso",
                              labelStyle: TextStyle(fontSize: 16),
                              border: OutlineInputBorder(),
                            ),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: titleSize,
                                color: Color(COR_PRIMARY)),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text('* Para ordenar toque nas colunas da tabela.',),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: GFCarousel(
                                viewportFraction: 0.99,
                                enableInfiniteScroll: false,
                                height:
                                    MediaQuery.of(context).size.height * 0.50,
                                autoPlay: false,
                                onPageChanged: (index) {
                                  controllerFaturamentoUn.changeCurrent(index);
                                },
                                items: <Widget>[
                                  FaturamentoVisaoMensal(filtro),
                                  FaturamentoVisaoUn(filtro),
                                  FaturamentoVisaoTipoTransporte(filtro),
                                  FaturamentoVisaoGrupoCliente(filtro),
                                  FaturamentoCliente(),
                                ]),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 8.0,
                                height: 8.0,
                                margin: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 2.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: controllerFaturamentoUn.current == 0
                                      ? Color.fromRGBO(0, 0, 0, 0.9)
                                      : Color.fromRGBO(0, 0, 0, 0.4),
                                ),
                              ),
                              Container(
                                width: 8.0,
                                height: 8.0,
                                margin: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 2.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: controllerFaturamentoUn.current == 1
                                      ? Color.fromRGBO(0, 0, 0, 0.9)
                                      : Color.fromRGBO(0, 0, 0, 0.4),
                                ),
                              ),
                              Container(
                                width: 8.0,
                                height: 8.0,
                                margin: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 2.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: controllerFaturamentoUn.current == 2
                                      ? Color.fromRGBO(0, 0, 0, 0.9)
                                      : Color.fromRGBO(0, 0, 0, 0.4),
                                ),
                              ),
                              Container(
                                width: 8.0,
                                height: 8.0,
                                margin: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 2.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: controllerFaturamentoUn.current == 3
                                      ? Color.fromRGBO(0, 0, 0, 0.9)
                                      : Color.fromRGBO(0, 0, 0, 0.4),
                                ),
                              ),
                              Container(
                                width: 8.0,
                                height: 8.0,
                                margin: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 2.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: controllerFaturamentoUn.current == 4
                                      ? Color.fromRGBO(0, 0, 0, 0.9)
                                      : Color.fromRGBO(0, 0, 0, 0.4),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
