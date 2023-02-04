import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'combined_wid1.dart';
import 'combined_wid2.dart';
import 'constants.dart';
import 'resutl_page.dart';
import 'bmi_brain.dart';




class design_page extends StatefulWidget {
  @override
  State<design_page> createState() => _design_pageState();
}

class _design_pageState extends State<design_page> {
  Color male = inactive;
  Color female = inactive;
  void functionIncrementAge(){
    setState(() {
      age++;
    });
  }
  void functionIncrementWeight(){
    setState(() {
      weight++;
    });
  }
  void functionDecrementAge(){
    setState(() {
      age--;
    });
  }
  void functionDecrementWeight(){
    setState(() {
      weight--;
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("IBM Calculator"),
          centerTitle: true,
          backgroundColor: Color(0Xff322E54),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: Row(children: [
                    Expanded(
                      child: GestureDetector(onTap: () {
                        setState(() {
                          if (male == inactive) {
                            male = active;
                          } else {
                            male = inactive;
                          }
                          female = inactive;
                        });
                      },
                        child: CombinedWid1(male,
                          CombindedWid2(
                              Icon(
                                Icons.male,
                                color: Colors.white,
                                size: 80,
                              ),
                              "Male"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(onTap: () {
                        setState(() {
                          if (female == inactive) {
                            female = active;
                          } else {
                            female = inactive;
                          }
                          male = inactive;
                        });
                      },
                        child: CombinedWid1(
                          female,
                          CombindedWid2(
                              Icon(Icons.female, color: Colors.white, size: 80),
                              "Female"),
                        ),
                      ),
                    ),
                  ])),
              Expanded(
                child: Container(padding: EdgeInsets.only(top: 15),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Color(0Xff3D2CD3),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Height", style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 35,
                          color: Colors.white)),
                      SizedBox(height: 15.0,),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(height.toString(), style: TextStyle(fontSize: 30,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),),
                          SizedBox(width: 10.0,),
                          Text("CM", style: TextStyle(fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),),
                        ],
                      ),
                      Slider(value: height.toDouble(),
                          min: 80,
                          max: 210,
                          activeColor: Color(0xffEB1555),
                          inactiveColor: Colors.white,
                          onChanged: (double heighttt) {
                            setState(() {
                              height = heighttt.round();
                            });
                          })
                    ],
                  ),),),
              Expanded(
                child: Row(crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                          child: Container(padding:EdgeInsets.only(top: 20,left: 10),margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Color(0Xff3D2CD3),
                                  borderRadius: BorderRadius.circular(15)),
                            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Weight",style: TextStyle(fontSize: 30,color: Colors.white)),
                                Text(weight.toString(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                                SizedBox(height: 10,),
                                Row(mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  RoundButton(Icons.add,functionIncrementWeight),
                                  SizedBox(width: 15,),
                                  RoundButton(Icons.remove,functionDecrementWeight)
                                ],)
                              ],

                            ),
                          )
                      ),
                      Expanded(child: Container(padding:EdgeInsets.only(top: 20,left: 10),margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Color(0Xff3D2CD3),
                            borderRadius: BorderRadius.circular(15)),
                      child: Column(children: [
                        Text("Age",style: TextStyle(fontSize: 30,color: Colors.white,),),
                        Text(age.toString(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          RoundButton(Icons.add,functionIncrementAge),
                          SizedBox(width:15),
                          RoundButton(Icons.remove,functionDecrementAge),
                        ],)
                      ],),)
                      )
                    ]),),
              GestureDetector(onTap: (){
                brain br = brain(height,weight);
                String bmii = br.calculate();
                String resultt = br.result();
                String advicee = br.advice();
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>secondPage(
                bmii,resultt,advicee
                )));
              },
                child: Container(
                  child: Center(
                      child: Text(
                        "Calculate",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      )),
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      color:  Color(0Xff322E54),
                      borderRadius: BorderRadius.circular(10)),
                  height: 80,
                  width: double.infinity,
                ),
              )
            ]));
  }
}
class RoundButton extends StatelessWidget {


  RoundButton(@required this.icon,@required this.funn);
  final IconData icon;
  final  void Function() funn;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(onPressed:funn,
      constraints: BoxConstraints(minHeight: 55.0,minWidth: 55.0),
      shape: CircleBorder(),
      fillColor: Colors.cyan,
      child: Icon(icon),
    );
  }
}

