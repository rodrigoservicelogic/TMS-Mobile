import 'package:flutter/material.dart';
import 'package:tms_mobile/models/usuario.dart';
import 'package:tms_mobile/pages/resultado-page.dart';

import 'modules-page.dart';

class HomePage extends StatefulWidget {
  final Usuario usuarioLogado;

  HomePage(this.usuarioLogado);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController pageCtrl = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageCtrl,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        ModuleSelectionPage(widget.usuarioLogado, pageCtrl),
        ResultadoPage(pageCtrl),
        Container(),
        Container(),
        Container(),
      ],
    );
  }
}
