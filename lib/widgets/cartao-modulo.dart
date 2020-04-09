import 'package:flutter/material.dart';

class CardButton extends StatefulWidget {
  final Image icon;
  final String text;

  CardButton(this.icon, this.text);

  @override
  _CardButtonState createState() => _CardButtonState();
}

class _CardButtonState extends State<CardButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0x9A000000),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
      ),
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 40.0, 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: double.infinity,
            child: widget.icon,
          ),
          Text(
            widget.text,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
