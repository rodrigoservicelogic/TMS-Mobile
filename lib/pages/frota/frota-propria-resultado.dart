import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:simple_autocomplete_formfield/simple_autocomplete_formfield.dart';
import 'package:tms_mobile/controller/frota/frota-propria-controller.dart';
import 'package:tms_mobile/models/filtro_frota_propria_model.dart';
import 'package:tms_mobile/pages/frota/table_resultado_frota_propria.dart';
import 'package:tms_mobile/widgets/dateTimePicker.dart';
import 'package:tms_mobile/widgets/drawer.dart';

import '../../global.dart';

class FrotaPropriaResultado extends StatefulWidget {
  final PageController pageController;

  FrotaPropriaResultado(this.pageController);
  @override
  _FrotaPropriaResultadoState createState() => _FrotaPropriaResultadoState();
}

class _FrotaPropriaResultadoState extends State<FrotaPropriaResultado> {
  final controller = GetIt.I.get<FrotaPropriaController>();
  final GlobalKey _dropdownMotorista = GlobalKey();
  final GlobalKey _dropdownPlaca = GlobalKey();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  ModelFiltroFrotaPropria filtro = ModelFiltroFrotaPropria();
  ScrollController _scroll = ScrollController();

  MediaQueryData queryData;

  String dropdownValue = '';
  @override
  void initState() {
    super.initState();
    controller.dataInicial = DateTime.now();
    controller.dataFinal = DateTime.now();

    _init();
  }

  Future _init() async {
    await controller.getListaMotorista();
    await controller.getListaPlacas();

    controller.motoristaSelected = "0";
    controller.placaSelected = null;
    controller.listaFrotaPropria = [];
  }

  BoxDecoration myBoxDecoration(double size) {
    return BoxDecoration(
      border: Border(bottom: BorderSide(width: size)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
            subtitle: const Text("Frota Própria",
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
      body: Container(
        padding: EdgeInsets.all(20),
        child: Observer(
          builder: (_) {
            if (controller.isLoad) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView(
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
                DropdownButtonFormField(
                  decoration: InputDecoration(
                      labelText: "Por Motorista",
                      labelStyle: TextStyle(color: Color(COR_PRIMARY))),
                  key: _dropdownMotorista,
                  value: controller.motoristaSelected,
                  isExpanded: true,
                  onChanged: controller.changeMotorista,
                  icon: IconButton(
                    icon: controller.motoristaSelected != null
                        ? Icon(
                            Icons.clear,
                            size: 16,
                          )
                        : Icon(Icons.arrow_drop_down),
                    onPressed: controller.motoristaSelected != null
                        ? controller.clearSelectedMotorista
                        : openDropDownMotorista,
                  ),
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

                // DropdownButton(
                //   hint: Text('Por Placa'),
                //   key: _dropdownPlaca,
                //   value: controller.placaSelected,
                //   isExpanded: true,
                //   onChanged: controller.changePlaca,
                //   icon: IconButton(
                //     icon: controller.placaSelected != null
                //         ? Icon(Icons.clear, size: 16)
                //         : Icon(Icons.arrow_drop_down),
                //     onPressed: controller.placaSelected != null
                //         ? controller.clearSelectedPlaca
                //         : openDropDownPlaca,
                //   ),
                //   items: controller.placas.map((placa) {
                //     return DropdownMenuItem(
                //       child: new Text(placa),
                //       value: placa,
                //     );
                //   }).toList(),
                // ),
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
                          filtro.codMotorista = controller.motoristaSelected;
                          filtro.placa = controller.placaSelected;
                          filtro.dataInicial = controller.dataInicial;
                          filtro.dataFinal = controller.dataFinal;

                          await controller.filtrar(filtro);
                        },
                      ),
                    ),
                  ),
                ),
                TableResultadoFrotaPropria(),
              ],
            );
          },
        ),
      ),
    );
  }

  void openDropDownMotorista() {
    _dropdownMotorista.currentContext.visitChildElements((element) {
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

  void openDropDownPlaca() {
    _dropdownPlaca.currentContext.visitChildElements((element) {
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
