import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:tms_mobile/controller/agregado/agregado-controller.dart';
import 'package:tms_mobile/global.dart';
import 'package:tms_mobile/models/agregado.dart';
import 'package:tms_mobile/models/filtro_agregado_model.dart';
import 'package:tms_mobile/pages/agregado/resultado-agregado.dart';
import 'package:tms_mobile/widgets/dateTimePicker.dart';
import 'package:tms_mobile/widgets/drawer.dart';

import '../resultado-page.dart';

class FiltroAgregado extends StatefulWidget {
  final PageController pageController;

  FiltroAgregado(this.pageController);

  @override
  _FiltroAgregadoState createState() => _FiltroAgregadoState();
}

class _FiltroAgregadoState extends State<FiltroAgregado> {
  DateTime _dataInicial, _dataFinal;
  final controller = GetIt.I.get<AgregadoController>();

  String dropdownValue = '';

  @override
  void initState() {
    super.initState();

    controller.dataInicial = DateTime.now();
    controller.dataFinal = DateTime.now();

    _init();
  }

  Future<void> _init() async {
    await controller.getListaAgregado();
    await controller.getListaPlacas();
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
      body: Observer(
        builder: (_) {
          if (controller.isLoad) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Container(
            padding: EdgeInsets.all(20),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: Container(
                    color: Color(COR_PRIMARY),
                    child: Center(
                      child: Text(
                        "RESULTADO - AGREGADO",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
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
                DropdownButton<Agregado>(
                  hint: Text('Por Agregado'),
                  value: controller.agregadoSelected,
                  isExpanded: true,
                  onChanged: controller.changeAgregado,
                  items: controller.agregados.map((agregado) {
                    return DropdownMenuItem(
                      child: Text(agregado.nome ?? ""),
                      value: agregado,
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 13,
                ),
                DropdownButton(
                  hint: Text('Por Placa'),
                  value: controller.placaSelected,
                  isExpanded: true,
                  onChanged: controller.changePlaca,
                  items: controller.placas.map((placa) {
                    return DropdownMenuItem(
                      child: new Text(placa),
                      value: placa,
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 230,
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
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ResultadoAgregado(
                                    widget.pageController,
                                  )));
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
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  ResultadoPage(widget.pageController)));
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
  }
}
