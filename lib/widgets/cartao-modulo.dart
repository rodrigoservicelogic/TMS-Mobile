import 'package:flutter/material.dart';

class CardButton extends StatefulWidget {
  final Image icon;
  final String text;
  final Function onPressed;

  CardButton(this.icon, this.text, this.onPressed);

  @override
  _CardButtonState createState() => _CardButtonState();
}

class _CardButtonState extends State<CardButton> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0x25000000),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: InkWell(
          onTap: widget.onPressed,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 80,
                  child: widget.icon,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  widget.text,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
