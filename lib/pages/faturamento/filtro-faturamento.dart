import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_select/smart_select.dart';
import 'package:tms_mobile/controller/faturamento/faturamento-cliente-controller.dart';
import 'package:tms_mobile/global.dart';
import 'package:tms_mobile/models/empresa.dart';
import 'package:tms_mobile/models/filtrofaturamento-model.dart';
import 'package:tms_mobile/widgets/dateTimePicker.dart';
import 'package:tms_mobile/widgets/drawer.dart';

import 'faturamento-page.dart';

class FiltroFaturamento extends StatefulWidget {
  final PageController pageController;

  FiltroFaturamento(this.pageController);

  @override
  _FiltroFaturamentoState createState() => _FiltroFaturamentoState();
}

class _FiltroFaturamentoState extends State<FiltroFaturamento> {
  final controllerEmpresa = GetIt.I.get<FaturamentoClienteController>();
  final GlobalKey _dropdownButtonUN = GlobalKey();
  final GlobalKey _dropdownButtonFrete = GlobalKey();
  final GlobalKey _dropdownButtonCliente = GlobalKey();

  DateTime _dataInicial, _dataFinal;

  String dropdownValue = '';
  String retorno = '';

  @override
  void initState() {
    super.initState();

    _dataInicial = DateTime.now();
    _dataFinal = DateTime.now();

    _init();
  }

  void _init() async {
    String result = await controllerEmpresa.getListaFilial();
  }

  @override
  Widget build(BuildContext context) {
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
            if (controllerEmpresa.isLoad) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Expanded(
                        child: DateTimePicker(
                          labelText: "De:",
                          valueStyle: TextStyle(color: Colors.red),
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
                  DropdownButtonFormField(
                    key: _dropdownButtonUN,
                    hint: Text('Por Unidade de Negócio'),
                    decoration: InputDecoration(
                        labelText: "Por Unidade de Negócio",
                        labelStyle: TextStyle(color: Color(COR_PRIMARY))),
                    value: controllerEmpresa.selectedUnidade,
                    isExpanded: true,
                    onChanged: controllerEmpresa.changeUnidadeNegocio,
                    icon: IconButton(
                      icon: controllerEmpresa.selectedUnidade != null
                          ? Icon(Icons.clear)
                          : Icon(Icons.arrow_drop_down),
                      onPressed: controllerEmpresa.selectedUnidade != null
                          ? controllerEmpresa.clearSelectedUnidadeNegocio
                          : openDropdownUN,
                      color: controllerEmpresa.selectedUnidade != null
                          ? Colors.red
                          : Colors.black54,
                    ),
                    items: controllerEmpresa.filiais.map((unidade) {
                      return DropdownMenuItem(
                        child: new Text(unidade.nomeFantasia),
                        value: unidade.idFilial,
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Container(
                    width: double.infinity,
                    child: SmartSelect<String>.single(
                        padding: EdgeInsets.zero,
                        title: 'Por Tipo de Transporte',
                        titleStyle:
                            TextStyle(color: Color(COR_PRIMARY), fontSize: 14),
                        placeholder: 'Selecione',
                        placeholderStyle: TextStyle(color: Colors.black, fontSize: 14),
                        modalType: SmartSelectModalType.bottomSheet,
                        value: controllerEmpresa.selectedFrete,
                        choiceConfig: SmartSelectChoiceConfig(useDivider: true),
                        isTwoLine: true,
                        options: SmartSelectOption.listFrom(
                            source: controllerEmpresa.tiposFrete,
                            value: (index, item) => item,
                            title: (index, item) => item),
                        onChange: controllerEmpresa.changeTipoFrete),
                  ),
                  // DropdownButtonFormField(
                  //   key: _dropdownButtonFrete,
                  //   hint: Text('Por Tipo de Transporte'),
                  //   decoration: InputDecoration(
                  //       labelText: "Por Tipo de Transporte",
                  //       labelStyle: TextStyle(color: Color(COR_PRIMARY))),
                  //   value: controllerEmpresa.selectedFrete,
                  //   isExpanded: true,
                  //   onChanged: controllerEmpresa.changeTipoFrete,
                  //   icon: IconButton(
                  //     icon: controllerEmpresa.selectedFrete != null
                  //         ? Icon(Icons.clear)
                  //         : Icon(Icons.arrow_drop_down),
                  //     onPressed: controllerEmpresa.selectedFrete != null
                  //         ? controllerEmpresa.clearSelectedTipoFrete
                  //         : openDropdownFrete,
                  //     color: controllerEmpresa.selectedFrete != null
                  //         ? Colors.red
                  //         : Colors.black54,
                  //   ),
                  //   items: controllerEmpresa.tiposFrete.map((frete) {
                  //     return DropdownMenuItem(
                  //       child: new Text(frete),
                  //       value: frete,
                  //     );
                  //   }).toList(),
                  // ),
                  SizedBox(
                    height: 13,
                  ),
                  DropdownButtonFormField(
                    key: _dropdownButtonCliente,
                    hint: Text('Por Cliente'),
                    decoration: InputDecoration(
                        labelText: "Por Cliente",
                        labelStyle: TextStyle(color: Color(COR_PRIMARY))),
                    value: controllerEmpresa.selectedCliente,
                    isExpanded: true,
                    onChanged: controllerEmpresa.changeCliente,
                    icon: IconButton(
                      icon: controllerEmpresa.selectedCliente != null
                          ? Icon(Icons.clear)
                          : Icon(Icons.arrow_drop_down),
                      onPressed: controllerEmpresa.selectedCliente != null
                          ? controllerEmpresa.clearSelectedCliente
                          : openDropdownCliente,
                      color: controllerEmpresa.selectedCliente != null
                          ? Colors.red
                          : Colors.black54,
                    ),
                    items: controllerEmpresa.clientes.map((cliente) {
                      return DropdownMenuItem(
                        child: new Text(
                            "${cliente.codCliente} - ${cliente.nomeCliente}"),
                        value: cliente.codCliente,
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 20,
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
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => FaturamentoPage(
                                  widget.pageController,
                                  filtroFaturamento: ModelFiltroFaturamento(
                                      _dataInicial, _dataFinal,
                                      idUnidadeNegocio:
                                          controllerEmpresa.selectedUnidade,
                                      tipoFrete:
                                          controllerEmpresa.selectedFrete,
                                      codigoCliente: controllerEmpresa
                                          .selectedCliente // Incluir demais filtros após atualização da tela com info da API
                                      ),
                                ),
                              ),
                            );
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

  void openDropdownUN() {
    _dropdownButtonUN.currentContext.visitChildElements((element) {
      if (element.widget != null && element.widget is Semantics) {
        element.visitChildElements((element) {
          if (element.widget != null && element.widget is Actions) {
            element.visitChildElements((element) {
              Actions.invoke(element, Intent(ActivateAction.key));
              return false;
            });
          }
        });
      }
    });
  }

  void openDropdownCliente() {
    _dropdownButtonCliente.currentContext.visitChildElements((element) {
      if (element.widget != null && element.widget is Semantics) {
        element.visitChildElements((element) {
          if (element.widget != null && element.widget is Actions) {
            element.visitChildElements((element) {
              Actions.invoke(element, Intent(ActivateAction.key));
              return false;
            });
          }
        });
      }
    });
  }

  void openDropdownFrete() {
    _dropdownButtonFrete.currentContext.visitChildElements((element) {
      if (element.widget != null && element.widget is Semantics) {
        element.visitChildElements((element) {
          if (element.widget != null && element.widget is Actions) {
            element.visitChildElements((element) {
              Actions.invoke(element, Intent(ActivateAction.key));
              return false;
            });
          }
        });
      }
    });
  }
}
