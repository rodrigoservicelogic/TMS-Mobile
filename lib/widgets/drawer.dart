import 'package:flutter/material.dart';

import 'drawer_tile.dart';

class DrawerPage extends StatefulWidget {
  final PageController pageCtrl;

  DrawerPage(this.pageCtrl);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
              Color.fromRGBO(39, 74, 139, 1),
              Color.fromRGBO(110, 170, 211, 1)
            ])),
        child: ListView(
          children: <Widget>[
            Container(
              height: 120.0,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          Color.fromRGBO(39, 74, 139, 1),
                          Color.fromRGBO(110, 170, 211, 1)
                        ]),
                    border:
                        Border(bottom: BorderSide(color: Colors.grey[200]))),
                accountName: Center(
                  child: Image.asset(
                    "images/logoServiceLogic.png",
                    width: 150,
                  ),
                ),
                accountEmail: SizedBox(
                  height: 1,
                ),
              ),
            ),
            DrawerTile("home", "Início", widget.pageCtrl, 0),
            DrawerTile(
                "images/icon_resultados.png", "Resultados", widget.pageCtrl, 1),
            DrawerTile("images/icon_despesas_viagem.PNG", "Despesas de Viagem",
                widget.pageCtrl, 2),
            DrawerTile("images/icon_comprovante_entrega.PNG",
                "Comprovante de Entrega", widget.pageCtrl, 3),
            DrawerTile(
                "images/icon_e_papeleta.PNG", "e-Papeleta", widget.pageCtrl, 4),
          ],
        ),
      ),
    );
  }
}
