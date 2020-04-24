import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  const CardButton({this.icon, this.text, this.onPressed});

  final String icon;
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 4.0,
        color: Colors.transparent,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0x25000000),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 80,
                  child: Image.asset(icon, fit: BoxFit.fitHeight),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  text,
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
