import 'package:flutter/material.dart';
import 'package:tms_mobile/pages/login-page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage()));
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
