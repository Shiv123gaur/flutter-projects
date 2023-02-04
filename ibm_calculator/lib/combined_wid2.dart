import 'package:flutter/material.dart';

class CombindedWid2 extends StatelessWidget {
  final Icon ic;
  final String Txt;
  CombindedWid2(@required this.ic,this.Txt);
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [ic,
            SizedBox(height: 10.0,),
            Text(Txt,style: TextStyle(fontSize: 25,color: Colors.white),),
          ]);
  }
}