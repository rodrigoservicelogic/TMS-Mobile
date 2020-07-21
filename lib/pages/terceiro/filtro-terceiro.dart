import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tms_mobile/controller/terceiro/terceiro-controller.dart';
import 'package:tms_mobile/global.dart';
import 'package:tms_mobile/models/filtro_terceiro_model.dart';
import 'package:tms_mobile/models/terceiro.dart';
import 'package:tms_mobile/pages/terceiro/resultado-terceiro.dart';
import 'package:tms_mobile/widgets/dateTimePicker.dart';
import 'package:tms_mobile/widgets/drawer.dart';

import '../resultado-page.dart';

class FiltroTerceiro extends StatefulWidget {
  final PageController pageController;

  FiltroTerceiro(this.pageController);

  @override
  _FiltroTerceiroState createState() => _FiltroTerceiroState();
}

class _FiltroTerceiroState extends State<FiltroTerceiro> {
  DateTime _dataInicial, _dataFinal;
  final controller = TerceiroController();
  Terceiro _selectedTerceiro;
  String _selectedPlaca;

  String dropdownValue = '';

  @override
  void initState() {
    super.initState();

    _dataInicial = DateTime.now();
    _dataFinal = DateTime.now();

    _init();
  }

  Future<void> _init() async {
    await controller.getListaPlacas();
    await controller.getListaTerceiros();
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
                        "RESULTADO - TERCEIRO",
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
                Observer(builder: (_) {
                  return DropdownButton<Terceiro>(
                    hint: Text('Por Terceiro'),
                    value: controller.terceiroSelected,
                    isExpanded: true,
                    onChanged: controller.changeTerceiro,
                    items: controller.terceiros.map((terceiro) {
                      return DropdownMenuItem(
                        child: new Text(terceiro.nomeTerceiro),
                        value: terceiro,
                      );
                    }).toList(),
                  );
                }),
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
                              builder: (context) => ResultadoTerceiro(
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
