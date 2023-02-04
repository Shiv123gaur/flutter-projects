import 'package:flutter/material.dart';


class textField extends StatelessWidget {
  final hint;
  final ispass;
  final TextInputType keyBoard;
  final TextEditingController controller;
  const textField({Key? key,required this.hint,this.ispass = false,required this.keyBoard,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          border: inputBorder,
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
        ),
        textAlign: TextAlign.center,
        obscureText: ispass,
        keyboardType:keyBoard,
        controller: controller,

      ),
    );
  }
}
