import 'package:flutter/material.dart';


class CombinedWid1 extends StatelessWidget {

  CombinedWid1(@required this.colour,this.childWidget);
  final Color colour;
  final Widget childWidget;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: childWidget,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(color: colour,
                borderRadius: BorderRadius.circular(20)));
  }
}