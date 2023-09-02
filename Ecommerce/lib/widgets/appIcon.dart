import 'package:ecommerce/utils/dimentions.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatefulWidget {
  const AppIcon(
      {Key? key,
      required this.iconbackground,
      required this.icontop,
      this.size = 40,
      this.colorr = Colors.white})
      : super(key: key);
  final IconData iconbackground;
  final IconData icontop;
  final double size;
  final Color colorr;

  @override
  State<AppIcon> createState() => _AppIconState();
}

class _AppIconState extends State<AppIcon> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: dimentions.height30+dimentions.height20,
        width: dimentions.width30+dimentions.width20,
        child: Container(
          child: Stack(
            children: [
              Align(alignment:Alignment.center,
                child: Icon(
                  widget.iconbackground,
                  size: widget.size,
                  color: widget.colorr,
                ),
              ),
              Align(alignment: Alignment.center,
                child: Icon(
                  widget.icontop,
                  color: Colors.black,
                  size: widget.size/2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
