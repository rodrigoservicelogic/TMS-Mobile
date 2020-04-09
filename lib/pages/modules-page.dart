import 'package:flutter/material.dart';
import 'package:tms_mobile/models/usuario.dart';
import 'package:tms_mobile/widgets/cartao-modulo.dart';
import 'package:tms_mobile/widgets/cartao-usuario.dart';

class ModuleSelectionPage extends StatefulWidget {
  final Usuario usuarioLogado;

  ModuleSelectionPage(this.usuarioLogado);

  @override
  _ModuleSelectionPageState createState() => _ModuleSelectionPageState();
}

class _ModuleSelectionPageState extends State<ModuleSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg_1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                  height: 50,
                ),
                ProfileCard(widget.usuarioLogado),
                SizedBox(
                  height: 25,
                ),
                CardButton(
                  Image.asset(
                    "images/icon_resultados.png",
                    fit: BoxFit.fitHeight,
                  ),
                  "RESULTADOS",
                  // OnPressed no futuro
                ),
                SizedBox(height: 5,),
                CardButton(
                  Image.asset(
                    "images/icon_despesas_viagem.png",
                    fit: BoxFit.fitHeight,
                  ),
                  "DESPESAS DE VIAGEM",
                  // OnPressed no futuro
                ),
                SizedBox(height: 5,),
                CardButton(
                  Image.asset(
                    "images/icon_comprovante_entrega.png",
                    fit: BoxFit.fitHeight,
                  ),
                  "COMPROVANTE DE ENTREGA",
                  // OnPressed no futuro
                ),
                SizedBox(height: 5,),
                CardButton(
                  Image.asset(
                    "images/icon_e_papeleta.png",
                    fit: BoxFit.fitHeight,
                  ),
                  "e-PAPELETA",
                  // OnPressed no futuro
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
