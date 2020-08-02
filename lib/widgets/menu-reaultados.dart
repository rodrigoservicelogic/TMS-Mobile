import 'package:flutter/material.dart';
import 'package:tms_mobile/global.dart';

class MenuResultados extends StatelessWidget {
  final String title;
  final String image;
  final Function onTap;

  MenuResultados({this.title, this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Container(
          child: Stack(
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(COLOR_SECONDARY),
                      Color(COLOR_SECONDARY)
                    ],
                  ),
                ),
                child: Image.asset(this.image,
                    color: const Color.fromRGBO(255, 255, 255, 0.190),
                    colorBlendMode: BlendMode.modulate,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 175),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 60.0,
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        this.title,
                        style: Theme.of(context)
                            .textTheme
                            .subhead
                            .copyWith(color: Colors.white),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      onTap: this.onTap,
    );
  }
}
