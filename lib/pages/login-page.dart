import 'package:flutter/material.dart';
import 'package:tms_mobile/pages/filtro-faturamento.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController loginCtrl = TextEditingController();
  TextEditingController senhaCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/bg_1.png"), fit: BoxFit.cover)),
        child: ListView(
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
              height: 200,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    child: TextFormField(
                      controller: loginCtrl,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(hintText: "LOGIN"),
                      validator: (value) {
                        if (value == "") {
                          return "Campo Obrigatório!";
                        }

                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.white,
                    child: TextFormField(
                      controller: senhaCtrl,
                      obscureText: true,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(hintText: "SENHA"),
                      validator: (value) {
                        if (value == "") {
                          return "Campo Obrigatório!";
                        }

                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: RaisedButton(
                      color: Color(0xFFF58633),
                      textColor: Colors.white,
                      child: Text(
                        "ENTRAR",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (context) => FiltroFaturamento()));
                        }
                      },
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
