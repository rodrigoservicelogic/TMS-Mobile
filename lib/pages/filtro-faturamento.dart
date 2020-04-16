import 'package:flutter/material.dart';
import 'package:tms_mobile/global.dart';
import 'package:tms_mobile/widgets/dateTimePicker.dart';
import 'package:tms_mobile/widgets/drawer.dart';

class FiltroFaturamento extends StatefulWidget {
  final PageController pageController;

  FiltroFaturamento(this.pageController);

  @override
  _FiltroFaturamentoState createState() => _FiltroFaturamentoState();
}

class _FiltroFaturamentoState extends State<FiltroFaturamento> {
  DateTime _dataInicial, _dataFinal;
  List<String> _unidades = ['Unidade 1', 'Unidade 2', 'Unidade 3', 'Unidade 4'];
  String _selectedUnidade;
  List<String> _fretes = ['Frete 1', 'Frete 2', 'Frete 3', 'Frete 4'];
  String _selectedFrete;
  List<String> _clientes = ['Cliente 1', 'Cliente 2', 'Cliente 3', 'Cliente 4'];
  String _selectedCliente;

  String dropdownValue = '';

  @override
  void initState() {
    super.initState();

    _dataInicial = DateTime.now();
    _dataFinal = DateTime.now();
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
      body: Container(
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
            DateTimePicker(
              labelText: "De:",
              selectedDate: _dataInicial,
              selectDate: (DateTime date) {
                print(date);
                setState(() {
                  _dataInicial = date;
                });
              },
            ),
            SizedBox(
              height: 13,
            ),
            DateTimePicker(
              labelText: "Até:",
              selectedDate: _dataFinal,
              selectDate: (DateTime date) {
                print(date);
                setState(() {
                  _dataFinal = date;
                });
              },
            ),
            SizedBox(
              height: 13,
            ),
            DropdownButton(
              hint: Text('Por Unidade de Negócio'),
              value: _selectedUnidade,
              isExpanded: true,
              onChanged: (newValue) {
                setState(() {
                  _selectedUnidade = newValue;
                });
              },
              items: _unidades.map((unidade) {
                return DropdownMenuItem(
                  child: new Text(unidade),
                  value: unidade,
                );
              }).toList(),
            ),
            SizedBox(
              height: 13,
            ),
            DropdownButton(
              hint: Text('Por Tipo de Frete'),
              value: _selectedFrete,
              isExpanded: true,
              onChanged: (newValue) {
                setState(() {
                  _selectedFrete = newValue;
                });
              },
              items: _fretes.map((frete) {
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
              value: _selectedCliente,
              isExpanded: true,
              onChanged: (newValue) {
                setState(() {
                  _selectedCliente = newValue;
                });
              },
              items: _clientes.map((cliente) {
                return DropdownMenuItem(
                  child: new Text(cliente),
                  value: cliente,
                );
              }).toList(),
            ),
            SizedBox(
              height: 90,
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    onPressed: () {},
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
