import 'package:flutter/material.dart';
import 'package:ecommerce/utils/dimentions.dart';

class App_TextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final double radius;
  const App_TextField({Key? key,required this.controller,required this.hint,required this.icon,required this.radius}) : super(key: key);
  @override
  State<App_TextField> createState() => _App_TextFieldState();
}

class _App_TextFieldState extends State<App_TextField> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(dimentions.width5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 1),
                blurRadius: 8,
                spreadRadius: 2,
                color: Colors.grey
            ),
          ]),
      padding: EdgeInsets.only(left: dimentions.width10,right: dimentions.width10),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.hint,
          prefixIcon: Icon(
            widget.icon,
            color: Colors.greenAccent,
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                dimentions.radius20 * 2,
              ),
              borderSide: BorderSide(color: Colors.white)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                dimentions.radius20 * 2,
              ),
              borderSide: BorderSide(color: Colors.white)),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(
              dimentions.radius20 * 2,
            ),
          ),
        ),
      ),
    );
  }
}
