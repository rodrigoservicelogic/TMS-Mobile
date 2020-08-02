import 'package:flutter/material.dart';
import 'package:tms_mobile/widgets/drawer.dart';

class MeuPerfilPage extends StatefulWidget {
  final PageController pageCtrl;

  MeuPerfilPage(this.pageCtrl);

  @override
  _MeuPerfilPageState createState() => _MeuPerfilPageState();
}

class _MeuPerfilPageState extends State<MeuPerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("MEU PERFIL"),
        leading: Center(
          child: Icon(
            Icons.person,
            size: 45,
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
      body: Container(),
    );
  }
}