import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:tms_mobile/controller/empresa/empresa-controller.dart';
import 'package:tms_mobile/global.dart';
import 'package:tms_mobile/models/filtro_resultado_empresa.dart';
import 'package:tms_mobile/pages/empresa/table_resultado_empresa.dart';
import 'package:tms_mobile/widgets/dateTimePicker.dart';
import 'package:tms_mobile/widgets/drawer.dart';

import 'filtro-empresa.dart';

class ResultadoEmpresa extends StatefulWidget {
  final PageController pageController;

  ResultadoEmpresa(this.pageController);

  @override
  _ResultadoEmpresaState createState() => _ResultadoEmpresaState();
}

class _ResultadoEmpresaState extends State<ResultadoEmpresa> {
  final controller = GetIt.I.get<EmpresaController>();
  ModelFiltroResultadoEmpresa filtro = ModelFiltroResultadoEmpresa();

  @override
  void initState() {
    super.initState();

    _init();
  }

  Future<void> _init() async {
    await controller.getListaRegimes();

    controller.dataInicial = DateTime.now();
    controller.dataFinal = DateTime.now();
    controller.resultadoEmpresa = [];
    controller.regimeSelected = null;
  }

  BoxDecoration myBoxDecoration(double size) {
    return BoxDecoration(
      border: Border(bottom: BorderSide(width: size)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: DrawerPage(widget.pageController),
      appBar: AppBar(
        centerTitle: true,
        title: Text("RESULTADO EMPRESA"),
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
      body: Observer(
        builder: (_) {
          if (controller.isLoad) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          
          return Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: DateTimePicker(
                        labelText: "De:",
                        valueStyle: TextStyle(color: Colors.red),
                        selectedDate: controller.dataInicial,
                        selectDate: controller.changeDataInicial,
                      ),
                    ),
                    Container(
                      width: 15,
                    ),
                    Expanded(
                      flex: 4,
                      child: DateTimePicker(
                        labelText: "Até:",
                        selectedDate: controller.dataFinal,
                        selectDate: controller.changeDataFinal,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 13,
                ),
                DropdownButton<String>(
                  hint: Text('Por Regime'),
                  value: controller.regimeSelected,
                  isExpanded: true,
                  onChanged: controller.changeRegime,
                  items: controller.regimes.map((regime) {
                    return DropdownMenuItem(
                      child: new Text(regime),
                      value: regime,
                    );
                  }).toList(),
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
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        onPressed: () async {
                          filtro.dataInicial = controller.dataInicial;
                          filtro.dataFinal = controller.dataFinal;
                          filtro.regime = controller.regimeSelected;

                          await controller.filtrar(filtro);
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                TableResultadoEmpresa(controller.resultadoEmpresa),
              ],
            ),
          );
        },
      ),
    );
  }
}
