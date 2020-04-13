import 'package:flutter/material.dart';
import 'package:tms_mobile/models/usuario.dart';

class ProfileCard extends StatelessWidget {
  final Usuario usuario;
  final double height;

  ProfileCard(this.usuario, {this.height});

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
      elevation: 4.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 80,
              child: _getAvatarUsuario(),
            ),
            SizedBox(
              width: 7.5,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    usuario.nomeApresentacao,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    usuario.cargo,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    usuario.empresaApresentacao,
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