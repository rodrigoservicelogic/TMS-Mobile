import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:tms_mobile/controller/frota/frota-propria-controller.dart';
import 'package:tms_mobile/models/filtro_frota_propria_model.dart';
import 'package:tms_mobile/widgets/dateTimePicker.dart';
import 'package:tms_mobile/widgets/drawer.dart';

import '../../global.dart';
import 'frota-propria-resultado.dart';

class FiltroFrotaPropria extends StatefulWidget {
  final PageController pageController;

  FiltroFrotaPropria(this.pageController);
  @override
  _FiltroFrotaPropriaState createState() => _FiltroFrotaPropriaState();
}

class _FiltroFrotaPropriaState extends State<FiltroFrotaPropria> {
  final controller = GetIt.I.get<FrotaPropriaController>();

  String dropdownValue = '';

  @override
  void initState() {
    super.initState();

    controller.dataInicial = DateTime.now();
    controller.dataFinal = DateTime.now();

    _init();
  }

  Future<void> _init() async {
    await controller.getListaMotorista();
    await controller.getListaPlacas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: DrawerPage(widget.pageController),
      appBar: AppBar(
        centerTitle: true,
        title: Text("FROTA PRÓPRIA"),
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
                        valueStyle: TextStyle(color: Colors.red),
                        selectedDate: controller.dataFinal,
                        selectDate: controller.changeDataFinal,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 13,
                ),
                DropdownButton(
                  hint: Text('Por Motorista'),
                  value: controller.motoristaSelected,
                  isExpanded: true,
                  onChanged: controller.changeMotorista,
                  items: controller.motorista.map((motorista) {
                    return DropdownMenuItem(
                      child: new Text(motorista.nome),
                      value: motorista.codMotorista,
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
                  height: 200,
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
                              builder: (context) => FrotaPropriaResultado(
                                    widget.pageController
                                  )));
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
