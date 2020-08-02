import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tms_mobile/controller/login/login-controller.dart';
import 'package:tms_mobile/models/usuario.dart';
import 'package:tms_mobile/pages/empresa/selecao-empresa-page.dart';
import 'package:tms_mobile/pages/login-page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = GetIt.I.get<LoginController>();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.getString("User") != null) {
        Usuario usuario = Usuario.fromPrefs(json.decode(prefs.getString('User')));

        if (usuario != null) {
          controller.usuario = usuario;

          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => SelecaoEmpresa(controller.usuario)));
        } else {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoginPage()));
        }
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/bg_azul.jpg"), fit: BoxFit.cover)),
      child: Center(
        child: Image.asset(
          "images/simboloCarregando.png",
          fit: BoxFit.cover,
          width: 100,
        ),
      ),
    );
  }
}
