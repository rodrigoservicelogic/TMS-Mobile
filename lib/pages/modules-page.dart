import 'package:flutter/material.dart';
import 'package:tms_mobile/global.dart';
import 'package:tms_mobile/models/usuario.dart';
import 'package:tms_mobile/pages/resultado-page.dart';
import 'package:tms_mobile/widgets/cartao-modulo.dart';
import 'package:tms_mobile/widgets/cartao-usuario.dart';

class ModuleSelectionPage extends StatefulWidget {
  final Usuario usuarioLogado;
  final PageController pageCtrl;

  ModuleSelectionPage(this.usuarioLogado, this.pageCtrl);

  @override
  _ModuleSelectionPageState createState() => _ModuleSelectionPageState();
}

class _ModuleSelectionPageState extends State<ModuleSelectionPage> {
  Usuario usuario = Usuario();

  @override
  void initState() {
    super.initState();

    usuario = widget.usuarioLogado;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg_azul.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 40,
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
                  ProfileCard(
                    usuario,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CardButton(
                    icon: "images/icon_resultados.png",
                    text: "RESULTADOS",
                    onPressed: () async {
                      widget.pageCtrl.jumpToPage(1);
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  // CardButton(
                  //   icon: "images/icon_despesas_viagem.png",
                  //   text: "DESPESAS\n DE VIAGEM",
                  //   onPressed: () {},
                  // ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // CardButton(
                  //   icon: "images/icon_comprovante_entrega.png",
                  //   text: "COMPROVANTE\n DE ENTREGA",
                  //   onPressed: () {},
                  // ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // CardButton(
                  //   icon: "images/icon_e_papeleta.png",
                  //   text: "e-PAPELETA",
                  //   onPressed: () {},
                  // ),
                ],
              ),
            ),
            Spacer(),
            // InkWell(
            //   child: Card(
            //     color: Color(COR_PRIMARY),
            //     child: Container(
            //       width: double.infinity,
            //       height: 54,
            //       padding: EdgeInsets.all(15),
            //       child: Center(
            //         child: Text(
            //           'VOLTAR',
            //           style: TextStyle(
            //               color: Colors.white, fontWeight: FontWeight.bold),
            //           textAlign: TextAlign.center,
            //         ),
            //       ),
            //     ),
            //   ),
            //   onTap: () {
            //     Navigator.of(context).pop();
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
