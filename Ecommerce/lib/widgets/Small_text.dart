import 'package:flutter/material.dart';

class SmallFont extends StatefulWidget {
  final String text;
  final double size;
  final Color? color;
  final bool overfloww;
  const SmallFont(
      {Key? key,
      required this.text,
      this.size = 20,
      this.color = const Color(0xffAD8E70),
      this.overfloww = false})
      : super(key: key);

  @override
  State<SmallFont> createState() => _SmallFontState();
}

class _SmallFontState extends State<SmallFont> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      maxLines:2,
      style: TextStyle(color: widget.color, fontSize: widget.size,overflow:widget.overfloww?(TextOverflow.ellipsis): (TextOverflow.ellipsis)),
    );
  }
}
