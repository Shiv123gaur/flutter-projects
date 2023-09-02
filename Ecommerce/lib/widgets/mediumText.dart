import 'package:flutter/material.dart';




class MediumText extends StatelessWidget {
  const MediumText({Key? key,required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,maxLines: 100,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 20,color: Colors.black),);
  }
}
