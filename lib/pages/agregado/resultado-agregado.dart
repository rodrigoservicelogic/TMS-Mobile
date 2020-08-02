import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:simple_autocomplete_formfield/simple_autocomplete_formfield.dart';
import 'package:tms_mobile/controller/agregado/agregado-controller.dart';
import 'package:tms_mobile/global.dart';
import 'package:tms_mobile/models/agregado.dart';
import 'package:tms_mobile/models/filtro_agregado_model.dart';
import 'package:tms_mobile/pages/agregado/table_resultado_agregado.dart';
import 'package:tms_mobile/widgets/dateTimePicker.dart';
import 'package:tms_mobile/widgets/drawer.dart';

import 'filtro-agregado.dart';

class ResultadoAgregado extends StatefulWidget {
  final PageController pageController;

  ResultadoAgregado(this.pageController);

  @override
  _ResultadoAgregadoState createState() => _ResultadoAgregadoState();
}

class _ResultadoAgregadoState extends State<ResultadoAgregado> {
  final controller = GetIt.I.get<AgregadoController>();
  MediaQueryData queryData;
  ModelFiltroAgregado filtro = ModelFiltroAgregado();

  String dropdownValue = '';

  @override
  void initState() {
    super.initState();

    _init();
  }

  Future<void> _init() async {
    await controller.getListaAgregado();
    await controller.getListaPlacas();

    controller.dataInicial = DateTime.now();
    controller.dataFinal = DateTime.now();
    controller.placaSelected = null;
    controller.listaAgregado = [];
  }

  BoxDecoration myBoxDecoration(double size) {
    return BoxDecoration(
      border: Border(bottom: BorderSide(width: size)),
    );
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
            subtitle: const Text("Agregado",
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
              onPressed: () async {},
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
                DropdownButtonFormField<Agregado>(
                  decoration: InputDecoration(
                      labelText: "Por Agregado",
                      labelStyle: TextStyle(color: Color(COR_PRIMARY))),
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
                SimpleAutocompleteFormField(
                  maxSuggestions: 5,
                  minSearchLength: 3,
                  decoration: InputDecoration(
                      labelText: "Por Placa",
                      labelStyle: TextStyle(color: Color(COR_PRIMARY)),
                      hintText: "ABC-0000 ou ABC0D00",
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(COR_PRIMARY)))),
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
                          filtro.agregado = controller.agregadoSelected;
                          filtro.placa = controller.placaSelected;

                          await controller.filtrar(filtro);
                        },
                      ),
                    ),
                  ),
                ),
                TableResultadoAgregado(controller.listaAgregado),
              ],
            ),
          );
        },
      ),
    );
  }
}
