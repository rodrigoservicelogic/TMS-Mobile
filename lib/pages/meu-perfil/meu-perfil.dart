import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tms_mobile/controller/usuario/usuario-controller.dart';
import 'package:tms_mobile/widgets/drawer.dart';

import '../../global.dart';

class MeuPerfilPage extends StatefulWidget {
  final PageController pageCtrl;

  MeuPerfilPage(this.pageCtrl);

  @override
  _MeuPerfilPageState createState() => _MeuPerfilPageState();
}

class _MeuPerfilPageState extends State<MeuPerfilPage> {
  final controller = GetIt.I.get<UsuarioController>();

  @override
  void initState() {
    super.initState();

    getUser();
  }

  Future<void> getUser() async {
    await controller.getUsuario();
  }

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
      body: SingleChildScrollView(
          child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(height: 18),
          Text(
            'Dados do Usuário',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 18),
          TextFormField(
            controller: controller.nomeCtrl,
            enabled: false,
            decoration: InputDecoration(
              labelText: "Nome",
              labelStyle: TextStyle(fontSize: 16),
              border: OutlineInputBorder(),
            ),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(COR_PRIMARY)),
          ),
          SizedBox(height: 18),
          TextFormField(
            controller: controller.emailCtrl,
            enabled: false,
            decoration: InputDecoration(
              labelText: "Email",
              labelStyle: TextStyle(fontSize: 16),
              border: OutlineInputBorder(),
            ),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(COR_PRIMARY)),
          ),
        ],
      )),
    );
  }
}
