import 'package:chatt/Chat_screen.dart';
import 'package:flutter/material.dart';
import 'Buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Registration_screen extends StatefulWidget {
  static String id = 'Registartion';

  @override
  State<Registration_screen> createState() => _Registration_screenState();
}

class _Registration_screenState extends State<Registration_screen> {
  late String Email ;
  late String Passward;
  bool spinnerISon=false;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: 40,
              )),
        ),
        backgroundColor: Colors.grey,
        body: ModalProgressHUD(inAsyncCall: spinnerISon,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: SafeArea(
                child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Hero(tag: 'logo',
                          child: Container(height: 100,
                            child: ClipRRect(borderRadius: BorderRadius.circular(20),
                                child: Image.asset("images/flash.jpg")),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextField(
                        onChanged: (value){
                          Email = value;
                        },
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            hintText: "Enter your Email",
                            contentPadding:EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
                            enabledBorder: OutlineInputBorder(borderSide:BorderSide(color: Colors.black,width: 1.0,),borderRadius: BorderRadius.circular(32),
                            ),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 2.0),borderRadius: BorderRadius.circular(32))
                      ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        textAlign: TextAlign.center,
                        onChanged: (value){
                          Passward = value;
                        },
                        decoration: InputDecoration(
                            hintText: "Enter your passward",
                            contentPadding:EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
                            enabledBorder: OutlineInputBorder(borderSide:BorderSide(color: Colors.black,width: 1.0,),borderRadius: BorderRadius.circular(32),
                            ),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 2.0),borderRadius: BorderRadius.circular(32))

                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                     RoundedButtons(Colors.blue, "Register", () async{
                       setState(() {
                         spinnerISon=true;
                       });
                       try {
                         final NewUser = await _auth
                             .createUserWithEmailAndPassword(
                             email: Email, password: Passward);
                         if (NewUser != null) {
                           Navigator.pushNamed(context, Chat_Screen.id);
                           setState(() {
                             spinnerISon=false;
                           });
                         }
                       }catch(e){
                         print('There was exception was generated $e');
                       }
                     }),
                ],)
              ),
            )),
        ),
        ),
      );
  }
}
