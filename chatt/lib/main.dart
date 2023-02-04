import 'package:chatt/Chat_screen.dart';
import 'package:chatt/Login_screen.dart';
import 'package:chatt/Registration_Screen.dart';
import 'package:chatt/Welcome_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  var ensureInitialized = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Welcome_Screen.id,
      routes: {
        Welcome_Screen.id:(context)=>Welcome_Screen(),
        Chat_Screen.id:(context)=>Chat_Screen(),
        Login_Screen.id:(context)=>Login_Screen(),
        Registration_screen.id:(context)=>Registration_screen()
      },
    );
  }
}



