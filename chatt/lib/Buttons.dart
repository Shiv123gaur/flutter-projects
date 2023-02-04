import 'package:flutter/material.dart';

class RoundedButtons extends StatelessWidget {
  RoundedButtons(this.color,this.text,this.vc);
  final Color color;
  final String text;
  final VoidCallback vc;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: this.vc,
      child: Container(
        height: 60,
        width: 350,
        child: Card(
          elevation: 5,
          color: this.color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)),
          child: Align(
              alignment: Alignment.center,
              child: Text(
                this.text,style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20,color: Colors.white),
              )),
        ),
      ),
    );
  }
}