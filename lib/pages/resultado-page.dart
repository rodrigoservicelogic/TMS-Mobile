import 'package:flutter/material.dart';
import 'package:tms_mobile/global.dart';
import 'package:tms_mobile/pages/terceiro/filtro-terceiro.dart';
import 'package:tms_mobile/widgets/drawer.dart';

import 'filtro-faturamento.dart';

class ResultadoPage extends StatefulWidget {
  final PageController pageCtrl;

  ResultadoPage(this.pageCtrl);

  @override
  _ResultadoPage createState() => _ResultadoPage();
}

class _ResultadoPage extends State<ResultadoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: DrawerPage(widget.pageCtrl),
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
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: RaisedButton(
                      color: Color(0x62FFFFFF),
                      textColor: Colors.black54,
                      child: Text(
                        "FATURAMENTO",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                FiltroFaturamento(widget.pageCtrl)));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: RaisedButton(
                      color: Color(0x62FFFFFF),
                      textColor: Colors.black54,
                      child: Text(
                        "RESULTADO - FROTA PRÓPRIA",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: RaisedButton(
                      color: Color(0x62FFFFFF),
                      textColor: Colors.black54,
                      child: Text(
                        "RESULTADO - AGREGADOS",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: RaisedButton(
                      color: Color(0x62FFFFFF),
                      textColor: Colors.black54,
                      child: Text(
                        "RESULTADO - TERCEIROS",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              FiltroTerceiro(widget.pageCtrl)));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: RaisedButton(
                      color: Color(0x62FFFFFF),
                      textColor: Colors.black54,
                      child: Text(
                        "RESULTADO - EMPRESA",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      onPressed: () {
                        if (true == true) {}
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
