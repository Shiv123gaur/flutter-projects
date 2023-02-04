import 'package:chatt/Chat_screen.dart';
import 'package:flutter/material.dart';
import 'Buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class Login_Screen extends StatefulWidget {
  static String id = 'Login';

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  late String Email;
  late String Passward;
  final _auth  = FirebaseAuth.instance;
  bool isSpinneron =false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(backgroundColor: Colors.grey,    //have to add title iin the row
          appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Row(children:[
            MaterialButton(onPressed: (){
                Navigator.pop(context);
        }, child: Icon(Icons.arrow_back,size: 40,)),
        ]),
        ),
          body:ModalProgressHUD(inAsyncCall: isSpinneron,
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
                                child: Image.asset('images/flash.jpg')),
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                     TextField(
                       keyboardType: TextInputType.emailAddress,
                       textAlign: TextAlign.center,
                       onChanged: (value){
                         Email = value;
                       },
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
                        textAlign: TextAlign.center,
                        obscureText: true,
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
                      SizedBox(height: 20,),
                      RoundedButtons(Colors.blue, "Login", () async{
                        setState(() {
                          isSpinneron = true;
                        });
                        try {
                          final user = await _auth.signInWithEmailAndPassword(
                              email: Email, password: Passward);
                          if (user != null) {
                            Navigator.pushNamed(context, Chat_Screen.id);
                            setState(() {
                              isSpinneron =false;
                            });
                          }
                        }catch(e){
                          print("Logging in Failed!!");
                        }
                      })
                    ],
                  ),
                )),
              ),
          ),
          ),
        ),
    );
  }
}
