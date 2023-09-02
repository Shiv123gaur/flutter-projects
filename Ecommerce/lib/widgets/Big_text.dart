import 'package:ecommerce/utils/dimentions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BigFont extends StatefulWidget {
  final String text;
  final double size;
  final Color? color;
  final TextOverflow overflow;
  const BigFont(
      {Key? key,
      required this.text,
      this.color = const Color(0xff243763),
      this.overflow = TextOverflow.ellipsis,
      this.size = 0
      })
      : super(key: key);

  @override
  State<BigFont> createState() => _BigFontState();
}

class _BigFontState extends State<BigFont> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: GoogleFonts.roboto(color: widget.color,fontWeight: FontWeight.w400,fontSize:widget.size==0?dimentions.font10:widget.size,),
        overflow: widget.overflow,
    );
  }
}
