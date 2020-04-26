import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:tms_mobile/widgets/dateTimePicker.dart';
import 'package:tms_mobile/widgets/drawer.dart';

import '../global.dart';
import 'faturamento-cliente.dart';
import 'faturamento-visao-un.dart';

class FaturamentoPage extends StatefulWidget {
  final PageController pageController;

  FaturamentoPage(this.pageController);

  @override
  _FaturamentoPageState createState() => _FaturamentoPageState();
}

class _FaturamentoPageState extends State<FaturamentoPage> {
  DateTime _dataInicial, _dataFinal;

  @override
  void initState() {
    super.initState();

    _dataInicial = DateTime.now();
    _dataFinal = DateTime.now();
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(width: 0),
    );
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
        child: Column(
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
                  flex: 4,
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
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Container(
                decoration: myBoxDecoration(),
                child: Center(
                  child: Text(
                    "R\$6.000.000,00",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color(COR_PRIMARY)),
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
                    child: Text(
                      "Mesmo Período (Ano Anterior):",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF606062)),
                    )),
                Expanded(
                    flex: 1,
                    child: Text(
                      "%",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF606062)),
                    )),
              ],
            ),
            SizedBox(
              height: 9,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                    flex: 4,
                    child: Container(
                      height: 50,
                      decoration: myBoxDecoration(),
                      child: Center(
                        child: Text(
                          "R\$4.000.000,00",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFF606062)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )),
                SizedBox(
                  width: 13,
                ),
                Expanded(
                    flex: 2,
                    child: Container(
                      height: 50,
                      decoration: myBoxDecoration(),
                      child: Center(
                        child: Text(
                          "33,33",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                              color: Color(0XFF00ab85)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 13,
            ),
            Container(
              height: 390,
              child: GFCarousel(
                  viewportFraction: 0.99,
                  aspectRatio: 1,
                  pagination: true,
                  autoPlay: false,
                  items: <Widget>[
                    FaturamentoVisaoUn(),
                    FaturamentoCliente(),
                    Text("Slide 3"),
                  ]),
            ),
            SizedBox(
              height: 13,
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
                      "Voltar",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
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