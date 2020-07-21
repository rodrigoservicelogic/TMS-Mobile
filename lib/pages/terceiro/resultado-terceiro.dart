import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:simple_autocomplete_formfield/simple_autocomplete_formfield.dart';
import 'package:tms_mobile/controller/terceiro/terceiro-controller.dart';
import 'package:tms_mobile/global.dart';
import 'package:tms_mobile/models/filtro_terceiro_model.dart';
import 'package:tms_mobile/models/terceiro.dart';
import 'package:tms_mobile/pages/terceiro/table_resultado_terceiro.dart';
import 'package:tms_mobile/widgets/dateTimePicker.dart';
import 'package:tms_mobile/widgets/drawer.dart';

import 'filtro-terceiro.dart';

class ResultadoTerceiro extends StatefulWidget {
  final PageController pageController;

  ResultadoTerceiro(this.pageController);

  @override
  _ResultadoTerceiroState createState() => _ResultadoTerceiroState();
}

class _ResultadoTerceiroState extends State<ResultadoTerceiro> {
  final controller = GetIt.I.get<TerceiroController>();
  ModelFiltroTerceiro filtro = ModelFiltroTerceiro();

  String dropdownValue = '';

  @override
  void initState() {
    super.initState();

    _init();
  }

  Future<void> _init() async {
    await controller.getListaTerceiros();
    await controller.getListaPlacas();
    
    controller.dataInicial = DateTime.now();
    controller.dataFinal = DateTime.now();
    controller.terceiroSelected = null;
    controller.placaSelected = null;
    controller.resultadoterceiro = [];
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
        title: Text("TERCEIROS"),
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
                        selectedDate: controller.dataFinal,
                        selectDate: controller.changeDataFinal,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 13,
                ),
                DropdownButton<Terceiro>(
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
                ),
                SizedBox(
                  height: 13,
                ),
                SimpleAutocompleteFormField(
                  maxSuggestions: 5,
                  minSearchLength: 3,
                  decoration: InputDecoration(
                      labelText: "Por Placa",
                      labelStyle: TextStyle(color: Color(COR_PRIMARY)),
                      hintText: "ABC-0000 ou ABC0D00",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(COR_PRIMARY))
                      )),
                  itemBuilder: (_, placa) => Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(placa),
                  ),
                  onSearch: (search) async => controller.placas
                      .where((placa) =>
                          placa.toLowerCase().contains(search.toLowerCase()))
                      .toList(),
                  onChanged: controller.changePlaca,
                  onSaved: controller.changePlaca,
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
                          filtro.terceiro = controller.terceiroSelected;
                          filtro.placa = controller.placaSelected;

                          await controller.filtrar(filtro);
                        },
                      ),
                    ),
                  ),
                ),
                TableResultadoTerceiro(controller.resultadoterceiro),                
              ],
            ),
          );
        },
      ),
    );
  }
}
