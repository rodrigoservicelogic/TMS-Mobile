import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_select/smart_select.dart';
import 'package:tms_mobile/controller/empresa/empresa-controller.dart';
import 'package:tms_mobile/controller/login/login-controller.dart';
import 'package:tms_mobile/models/empresa.dart';
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
  Empresa empresaSelected;
  final controllerEmpresa = GetIt.I.get<EmpresaController>();
  Usuario user = Usuario();

  @override
  void initState() {
    super.initState();

    _init();
  }

  Future<void> _init() async {
    user = widget.usuario;
    await controller.getEmpresas(user.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/bg_azul.jpg"), fit: BoxFit.cover)),
          ),
          ListView(
            children: <Widget>[
              // SizedBox(
              //   height: 100,
              // ),
              SizedBox(
                height: 40,
              ),
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
                  user.nomeUsuario.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),

              Observer(builder: (_) {
                if (controller.isLoad) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Container(
                  width: double.infinity,
                  child: SmartSelect<Empresa>.single(
                      title: 'Selecione a Empresa',
                      titleStyle: TextStyle(color: Colors.white, fontSize: 18),
                      placeholder: 'Selecione',
                      placeholderStyle: TextStyle(color: Colors.white, fontSize: 16),
                      modalType: SmartSelectModalType.bottomSheet,
                      value: empresaSelected,
                      choiceConfig: SmartSelectChoiceConfig(useDivider: true,),
                      isTwoLine: true,
                      options: SmartSelectOption.listFrom(
                          source: controller.empresas,
                          value: (index, item) => item,
                          title: (index, item) => item.nome),
                      onChange: (value) async {
                        empresaSelected = value;

                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString("Empresa", empresaSelected.codigo);
                        user.empresaApresentacao = empresaSelected.nome;

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomePage(user)));
                      }),
                );

                // return SmartSelect<Empresa>.single(
                //     value: empresaSelected,
                //     title: "Selecione a Empresa",
                //     options: controller.empresas
                //         .map<SmartSelectOption>((var empresa) {
                //       return SmartSelectOption(
                //           value: empresa, title: empresa.nome);
                //     }).toList(),
                //     onChange: (value) async {
                //       empresaSelected = value;

                //       SharedPreferences prefs =
                //           await SharedPreferences.getInstance();
                //       prefs.setString("Empresa", empresaSelected.codigo);
                //       user.empresaApresentacao = empresaSelected.nome;

                //       Navigator.of(context).push(MaterialPageRoute(
                //           builder: (context) => HomePage(user)));
                //     });

                // return Padding(
                //   padding: const EdgeInsets.all(40.0),
                //   child: Center(
                //     child: Container(
                //       width: double.infinity,
                //       padding: EdgeInsets.only(left: 10.0),
                //       color: Colors.white,
                //       child: DropdownButtonHideUnderline(
                //         child: DropdownButton<Empresa>(
                //             hint: Text(
                //                 'Selecione a Empresa'), // Not necessary for Option 1
                //             value: empresaSelected,
                //             isExpanded: true,
                //             onChanged: (value) async {
                //               empresaSelected = value;

                //               SharedPreferences prefs =
                //                   await SharedPreferences.getInstance();
                //               prefs.setString(
                //                   "Empresa", empresaSelected.codigo);
                //               user.empresaApresentacao = empresaSelected.nome;

                //               Navigator.of(context).push(MaterialPageRoute(
                //                   builder: (context) => HomePage(user)));
                //             },
                //             items: controller.empresas
                //                 .map<DropdownMenuItem<Empresa>>((var empresa) {
                //               return DropdownMenuItem<Empresa>(
                //                 value: empresa,
                //                 child: Text(
                //                   empresa.nome,
                //                   overflow: TextOverflow.ellipsis,
                //                 ),
                //               );
                //             }).toList()),
                //       ),
                //     ),
                //   ),
                // );
              })
            ],
          )
        ],
      ),
    );
  }
}
