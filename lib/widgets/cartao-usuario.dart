import 'package:flutter/material.dart';
import 'package:tms_mobile/models/usuario.dart';

class ProfileCard extends StatefulWidget {
  final Usuario usuario;

  ProfileCard(this.usuario);

  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  Image _getAvatarUsuario() {
    if (widget.usuario.avatar == null) {
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: double.infinity,
            child: _getAvatarUsuario(),
          ),
          Container(
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.usuario.nomeApresentacao,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.usuario.cargo,
                  style: TextStyle(color: Colors.black54),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.usuario.empresaApresentacao,
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
