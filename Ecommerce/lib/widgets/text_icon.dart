import 'package:flutter/material.dart';
import 'package:ecommerce/utils/dimentions.dart';


class TextIcons extends StatefulWidget {
  const TextIcons({Key? key,required this.iconn,required this.text,required this.IconColor,required this.textColor}) : super(key: key);
  final IconData iconn;
  final String text;
  final Color textColor;
  final Color IconColor;

  @override
  State<TextIcons> createState() => _TextIconsState();
}

class _TextIconsState extends State<TextIcons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      Icon(widget.iconn,color: widget.IconColor,),
        SizedBox(width:dimentions.width5,),
        Text(widget.text,style: TextStyle(color: widget.textColor),)
      ],
    );
  }
}
