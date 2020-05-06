import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:tms_mobile/controller/empresa/empresa-controller.dart';
import 'package:tms_mobile/controller/login/login-controller.dart';
import 'package:tms_mobile/models/usuario.dart';

import '../home-page.dart';

class SelecaoEmpresa extends StatefulWidget {
  final Usuario usuario;

  SelecaoEmpresa(this.usuario);

  @override
  _SelecaoEmpresaState createState() => _SelecaoEmpresaState();
}

class _SelecaoEmpresaState extends State<SelecaoEmpresa> {
  final controller = GetIt.I.get<LoginController>();
  String empresaSelected;
  final controllerEmpresa = GetIt.I.get<EmpresaController>();
  Usuario user = Usuario();

  @override
  void initState() {
    super.initState();

    user = widget.usuario;

    controller.getEmpresas(user.id);
    controllerEmpresa.popularListaEmpresas();
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
              // SizedBox(
              //   height: 100,
              // ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: Center(
                  child: Image.asset(
                    "images/logoServiceLogic.png",
                    width: 300,
                  ),
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
                  user.nomeApresentacao.toUpperCase(),
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
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          hint: Text(
                              'Selecione a Empresa'), // Not necessary for Option 1
                          value: empresaSelected,
                          isExpanded: true,
                          onChanged: (value) {
                            empresaSelected = value;
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HomePage(user)));
                          },
                          items: controller.empresas
                              .map<DropdownMenuItem<String>>((var empresa) {
                            return DropdownMenuItem<String>(
                              value: empresa.nome,
                              child: Text(
                                empresa.nome,
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          }).toList()),
                    ),
                  ),
                ),
              ),

              Observer(builder: (_) {
                if (controller.isLoad) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Center(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 10.0),
                      color: Colors.white,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                            hint: Text(
                                'Selecione a Empresa'), // Not necessary for Option 1
                            value: empresaSelected,
                            isExpanded: true,
                            onChanged: (value) {
                              empresaSelected = value;
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HomePage(user)));
                            },
                            items: controllerEmpresa.empresas
                                .map<DropdownMenuItem<String>>((var empresa) {
                              return DropdownMenuItem<String>(
                                value: empresa.nome,
                                child: Text(
                                  empresa.nome,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              );
                            }).toList()),
                      ),
                    ),
                  ),
                );
              })
            ],
          )
        ],
      ),
    );
  }
}
