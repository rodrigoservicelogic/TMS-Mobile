import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tms_mobile/controller/login/login-controller.dart';
import 'package:tms_mobile/global.dart';
import 'package:tms_mobile/models/login-model.dart';
import 'package:tms_mobile/models/usuario.dart';

import 'empresa/selecao-empresa-page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = GetIt.I.get<LoginController>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController loginCtrl = TextEditingController();
  TextEditingController senhaCtrl = TextEditingController();
  LoginModel login = LoginModel();

  @override
  void initState() {
    super.initState();

    _init();
  }

  Future<void> _init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    loginCtrl.text =
        prefs.getString('Email') != null ? prefs.getString('Email') : null;
    Usuario usuario = Usuario();
    usuario.login = loginCtrl.text;
    controller.changeUsuario(usuario);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/bg_azul.jpg"), fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Center(
                child: Image.asset(
                  "images/logoServiceLogic.png",
                  width: 300,
                ),
              ),
            ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.width - 220,
            // ),
            Spacer(),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Observer(
                    builder: (_) {
                      return Container(
                        color: Colors.white,
                        child: TextFormField(
                          controller: loginCtrl,
                          enabled: !controller.isLoad,
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(hintText: "LOGIN"),
                          onChanged: controller.changedLogin,
                          validator: (value) {
                            if (value == "") {
                              return "Campo Obrigatório!";
                            }

                            if (!value.contains('@')) {
                              return 'Não é um e-mail válido!';
                            }

                            return null;
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Observer(
                    builder: (_) {
                      return Container(
                        color: Colors.white,
                        child: TextFormField(
                          controller: senhaCtrl,
                          enabled: !controller.isLoad,
                          obscureText: true,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(hintText: "SENHA"),
                          onChanged: controller.changeSenha,
                          validator: (value) {
                            if (value == "") {
                              return "Campo Obrigatório!";
                            }

                            return null;
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Observer(
                    builder: (_) {
                      if (controller.isLoad == true) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return SizedBox(
                          height: 55,
                          width: double.infinity,
                          child: RaisedButton(
                            color: Color(COR_PRIMARY),
                            disabledColor: Color(COR_PRIMARY).withAlpha(600),
                            textColor: Colors.white,
                            child: Text(
                              "ENTRAR",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            onPressed: controller.isValid
                                ? () async {
                                    if (_formKey.currentState.validate()) {
                                      await controller.login();

                                      if (controller.usuario.id != null) {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SelecaoEmpresa(
                                                        controller.usuario)));
                                      } else {
                                        showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text("Atenção"),
                                                content: Text(
                                                    "Usuário ou senha inválidos"),
                                                actions: <Widget>[
                                                  FlatButton(
                                                    child: Text("OK"),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  )
                                                ],
                                              );
                                            });
                                      }
                                    }
                                  }
                                : null,
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: InkWell(
                      child: Container(
                          child: Text(
                        'Esqueci minha senha',
                        style: TextStyle(color: Colors.white),
                      )),
                      onTap: () {},
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
