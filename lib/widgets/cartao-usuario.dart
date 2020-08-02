import 'package:flutter/material.dart';
import 'package:tms_mobile/models/usuario.dart';

class ProfileCard extends StatelessWidget {
  final Usuario usuario;

  ProfileCard(this.usuario);

  Image _getAvatarUsuario() {
    if (usuario.avatar == null) {
      return Image.asset(
        "images/avatar.png",
        fit: BoxFit.fitHeight,
      );
    }

    return Image.asset(
      "images/avatar.png",
      fit: BoxFit.fitHeight,
    ); // Repetindo enquanto não temos o BD
    //return Image.fromBytes(widget.usuario.avatar), ou qualquer que seja a estratégia para gerar a partir do blob no BD
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      //elevation: 4.0,
      color: Colors.transparent,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 50,
              child: _getAvatarUsuario(),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    usuario.nomeUsuario != null
                        ? usuario.nomeUsuario
                        : "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // Text(
                  //   usuario.cargo != null ? usuario.cargo : "",
                  //   style: TextStyle(
                  //     fontSize: 14,
                  //     color: Colors.black54,
                  //   ),
                  // ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    usuario.empresaApresentacao != null
                        ? usuario.empresaApresentacao
                        : "",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
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
