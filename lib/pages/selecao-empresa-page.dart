import 'package:flutter/material.dart';
import 'package:tms_mobile/models/usuario.dart';

import 'modules-page.dart';

class SelecaoEmpresa extends StatefulWidget {
  final Usuario usuario;

  SelecaoEmpresa(this.usuario);

  @override
  _SelecaoEmpresaState createState() => _SelecaoEmpresaState();
}

class _SelecaoEmpresaState extends State<SelecaoEmpresa> {
  List empresas = List();
  String empresaSelected;

  @override
  void initState() {
    super.initState();

    empresas = [
      {'id': 1, 'nome': 'Empresa 1'},
      {'id': 2, 'nome': 'Empresa 2'},
      {'id': 3, 'nome': 'Empresa 3'},
      {'id': 4, 'nome': 'Empresa 4'},
      {'id': 5, 'nome': 'Empresa 5'},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/bg_1.png"), fit: BoxFit.cover)),
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Center(
                child: Image.asset(
                  "images/logoServiceLogic.png",
                  width: 300,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Center(
                child: Text(
                  "Bem vindo(a),",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              Center(
                child: Text(
                  widget.usuario.nomeApresentacao.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Center(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 10.0),
                    color: Colors.white,
                    child: DropdownButton(
                        hint: Text(
                            'Selecione a Empresa'), // Not necessary for Option 1
                        value: empresaSelected,
                        isExpanded: true,
                        onChanged: (value) {
                          empresaSelected = value;
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  ModuleSelectionPage(widget.usuario)));
                        },
                        items: empresas
                            .map<DropdownMenuItem<String>>((var empresa) {
                          return DropdownMenuItem<String>(
                            value: empresa["nome"],
                            child: Text(
                              empresa["nome"],
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }).toList()),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
