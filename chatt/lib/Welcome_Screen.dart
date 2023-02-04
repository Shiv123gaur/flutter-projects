import 'package:chatt/Login_screen.dart';
import 'package:chatt/Registration_Screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'Buttons.dart';

class Welcome_Screen extends StatefulWidget {
  static String id = "welcome";

  @override
  State<Welcome_Screen> createState() => _Welcome_ScreenState();
}

class _Welcome_ScreenState extends State<Welcome_Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: SafeArea(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Hero(
                      tag: 'logo',
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        height: animation.value * 100,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset('images/flash.jpg')),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Chat Box',
                        textStyle: TextStyle(
                          fontSize: 35,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        speed: Duration(microseconds: 100000),


                      ),


                    ],
                  ),
                ],
              ),
              SizedBox(height: 20,),
              RoundedButtons(Colors.blueAccent, 'Login',(){
                Navigator.pushNamed(context,Login_Screen.id);
              }),
              SizedBox(
                height: 25,
              ),
              RoundedButtons(Colors.lightBlueAccent,'Register',(){
                Navigator.pushNamed(context, Registration_screen.id);
              },)
            ],
          )),
        ),
      ),
    );
  }
}





