import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:tms_mobile/controller/faturamento/faturamento-cliente-controller.dart';
import 'package:tms_mobile/global.dart';
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

  DateTime _dataInicial, _dataFinal;

  String dropdownValue = '';
  String retorno = '';

  @override
  void initState() {
    super.initState();

    _dataInicial = DateTime.now();
    _dataFinal = DateTime.now();

    Future.delayed(Duration.zero, () async {
      retorno = await controllerEmpresa.getListaFilial();
    });
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
            if (controllerEmpresa.isLoad) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
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
                  DropdownButton(
                    hint: Text('Por Unidade de Negócio'),
                    value: controllerEmpresa.selectedUnidade,
                    isExpanded: true,
                    onChanged: controllerEmpresa.changeUnidadeNegocio,
                    icon: IconButton(
                      icon: controllerEmpresa.selectedUnidade != null ? Icon(Icons.clear) : Icon(Icons.arrow_drop_down),
                      onPressed: controllerEmpresa.clearSelectedUnidadeNegocio,
                      color: controllerEmpresa.selectedUnidade != null ? Colors.red : Colors.black54,
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
                  DropdownButton(
                    hint: Text('Por Tipo de Frete'),
                    value: controllerEmpresa.selectedFrete,
                    isExpanded: true,
                    onChanged: controllerEmpresa.changeTipoFrete,
                    icon: IconButton(
                      icon: controllerEmpresa.selectedFrete != null ? Icon(Icons.clear) : Icon(Icons.arrow_drop_down),
                      onPressed: controllerEmpresa.clearSelectedTipoFrete,
                      color: controllerEmpresa.selectedFrete != null ? Colors.red : Colors.black54,
                    ),
                    items: controllerEmpresa.tiposFrete.map((frete) {
                      return DropdownMenuItem(
                        child: new Text(frete),
                        value: frete,
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  DropdownButton(
                    hint: Text('Por Cliente'),
                    value: controllerEmpresa.selectedCliente,
                    isExpanded: true,
                    onChanged: controllerEmpresa.changeCliente,
                    icon: IconButton(
                      icon: controllerEmpresa.selectedCliente != null ? Icon(Icons.clear) : Icon(Icons.arrow_drop_down),
                      onPressed: controllerEmpresa.clearSelectedCliente,
                      color: controllerEmpresa.selectedCliente != null ? Colors.red : Colors.black54,
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
                    height: 100,
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
                            "Aplicar Filtro",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => FaturamentoPage(
                                  widget.pageController,
                                  new ModelFiltroFaturamento(
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
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 295,
                        height: 60,
                        child: RaisedButton(
                          color: Colors.grey,
                          textColor: Colors.white,
                          child: Text(
                            "Voltar",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
