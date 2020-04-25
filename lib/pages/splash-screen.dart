import 'package:flutter/material.dart';
import 'package:tms_mobile/pages/login-page.dart';
import 'package:tms_mobile/pages/terceiro/filtro-terceiro.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController pageCtrl = PageController();
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => FiltroTerceiro(pageCtrl)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/bg_1.png"), fit: BoxFit.cover)),
      child: Center(
        child: Image.asset(
          "images/simboloCarregando.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
