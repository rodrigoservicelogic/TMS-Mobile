import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tms_mobile/global.dart';

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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          centerTitle: true,
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(color: Color(COR_PRIMARY)),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(COR_PRIMARY)),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                color: Colors.white,
                height: 1,
              ),
            ),
            DrawerTile("perfil", "MEU PERFIL", widget.pageCtrl, 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                color: Colors.white,
                height: 1,
              ),
            ),
            DrawerTile("home", "Início", widget.pageCtrl, 0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                color: Colors.white,
                height: 1,
              ),
            ),
            DrawerTile(
                "images/icon_resultados.png", "Resultados", widget.pageCtrl, 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                color: Colors.white,
                height: 1,
              ),
            ),
            // DrawerTile("images/icon_despesas_viagem.png", "Despesas de Viagem",
            //     widget.pageCtrl, 2),
            // DrawerTile("images/icon_comprovante_entrega.png",
            //     "Comprovante de Entrega", widget.pageCtrl, 3),
            // DrawerTile(
            //     "images/icon_e_papeleta.png", "e-Papeleta", widget.pageCtrl, 4),
            InkWell(
              child: ListTile(
                title: Text(
                  "SAIR",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              onTap: () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Atenção"),
                        content: Text("Deseja sair do aplicativo?"),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("Sim"),
                            onPressed: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.remove('Usuario');
                              prefs.remove('User');
                              prefs.remove('Empresa');

                              Navigator.of(context).pop();
                              exit(0);
                            },
                          ),
                          FlatButton(
                            child: Text("Não"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                    });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                color: Colors.white,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
