import 'package:flutter/material.dart';
import 'package:tms_mobile/global.dart';
import 'package:tms_mobile/widgets/drawer.dart';
import 'faturamento/filtro-faturamento.dart';

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
      //endDrawer: DrawerPage(widget.pageCtrl),
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DrawerPage(widget.pageCtrl),
                  fullscreenDialog: true));
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
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
                disabledColor: Color(COLOR_DISABLED_RESULTADOS),
                textColor: Colors.black54,
                child: Text(
                  "FATURAMENTO",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                disabledColor: Color(COLOR_DISABLED_RESULTADOS),
                textColor: Colors.black54,
                child: Text(
                  "FROTA PRÓPRIA",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                // onPressed: () {
                //   Navigator.of(context).push(MaterialPageRoute(
                //       builder: (context) =>
                //           FrotaPropriaResultado(widget.pageCtrl)));
                // },
                onPressed: null,
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
                disabledColor: Color(COLOR_DISABLED_RESULTADOS),
                textColor: Colors.black54,
                child: Text(
                  "AGREGADO",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                // onPressed: () {
                //   Navigator.of(context).push(MaterialPageRoute(
                //       builder: (context) =>
                //           ResultadoAgregado(widget.pageCtrl)));
                // },
                onPressed: null,
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
                disabledColor: Color(COLOR_DISABLED_RESULTADOS),
                textColor: Colors.black54,
                child: Text(
                  "TERCEIRO",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                // onPressed: () {
                //   Navigator.of(context).push(MaterialPageRoute(
                //       builder: (context) =>
                //           ResultadoTerceiro(widget.pageCtrl)));
                // },
                onPressed: null,
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
                disabledColor: Color(COLOR_DISABLED_RESULTADOS),
                textColor: Colors.black54,
                child: Text(
                  "DRE - FINANCEIRO",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                // onPressed: () {
                //   if (true == true) {
                //     Navigator.of(context).push(MaterialPageRoute(
                //         builder: (context) =>
                //             ResultadoEmpresa(widget.pageCtrl)));
                //   }
                // },
                onPressed: null,
              ),
            ),
            Spacer(),
            SizedBox(
              height: 55,
              width: double.infinity,
              child: RaisedButton(
                color: Color(COR_PRIMARY),
                textColor: Colors.white,
                child: Text(
                  "VOLTAR",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                onPressed: () {
                  if (true == true) {
                    Navigator.of(context).pop();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
