import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  Expanded buildfun(Color,int sound){
    return Expanded(
      child: TextButton(style: TextButton.styleFrom(backgroundColor: Color),
        onPressed: (){
          playsound(sound);
        },
        child: Container(),

      ),
    );
  }
  void playsound(int soundnumber){
    final player = AudioCache();
    player.play('assets_note$soundnumber.wav');
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Scaffold(backgroundColor: Colors.lightGreen,
        appBar:AppBar(title: Text("MY XYLOPHONE APP"),centerTitle: true,backgroundColor: Colors.greenAccent,),
        body: SafeArea(child:Column(crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildfun(Colors.pink,1),
          buildfun(Colors.blueGrey,2),
          buildfun(Colors.redAccent,3),
          buildfun(Colors.purple,4),
          buildfun(Colors.purpleAccent,5),
          buildfun(Colors.deepPurple,6),
          buildfun(Colors.cyanAccent,7),

        ],
      )
       ),
      ),
    );
  }
}



