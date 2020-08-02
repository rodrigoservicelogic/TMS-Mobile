import 'package:flutter/material.dart';
import 'package:tms_mobile/global.dart';

class DrawerTile extends StatelessWidget {
  final String icon;
  final String text;
  final PageController controller;
  final int page;

  DrawerTile(this.icon, this.text, this.controller, this.page);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
          controller.jumpToPage(page);
        },
        child: Container(
          decoration: BoxDecoration(
              color: controller.page.round() == page
                  ? Colors.white
                  : Colors.transparent,
              // border: controller.page.round() == page
              //     ? Border(
              //         left: BorderSide(color: Color(COR_PRIMARY), width: 5.0))
              //     : Border.all(width: 0.0, color: Color(COR_PRIMARY))
          ),
          child: ListTile(
            title: Text(
              text.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: controller.page.round() == page
                      ? Color(COLOR_SECONDARY)
                      : Colors.white,
                  fontWeight: controller.page.round() == page
                      ? FontWeight.w500
                      : FontWeight.normal),
            ),
            selected: controller.page.round() == page,
          ),
        ),
      ),
    );
  }
}
