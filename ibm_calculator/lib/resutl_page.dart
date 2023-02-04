import 'package:flutter/material.dart';
import 'package:ibm_calculator/combined_wid1.dart';

class secondPage extends StatelessWidget {
  secondPage(this.bmi,this.cal,this.advicee);
  String bmi;
  String cal;
  String  advicee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Expanded(flex: 0,
            child: CombinedWid1(Color(0Xff322E54),Text("Result",textAlign: TextAlign.center,style: TextStyle(fontSize: 38,color: Colors.white)))),
        Expanded(flex: 6,
            child:CombinedWid1(Color(0Xff3D2CD3),
            Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Text(cal ,style: TextStyle(color: Colors.green,fontSize: 50,fontWeight: FontWeight.bold),),
              Text(bmi,style: TextStyle(fontSize: 100,fontWeight: FontWeight.bold),),
              Text(advicee,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 25,),textAlign: TextAlign.center,)
            ]),)),
        Expanded(flex: 1,
            child: GestureDetector(onTap: (){
              Navigator.pop(context);
            },
                child: CombinedWid1(Color(0Xff322E54),Text("Re-Calculate",textAlign: TextAlign.center,style: TextStyle(fontSize: 30,color: Colors.white),),)),
        )
        ],)
    );
  }
}
