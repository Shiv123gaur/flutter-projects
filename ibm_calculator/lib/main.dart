import 'package:flutter/material.dart';
import 'design_page.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
            primaryColor: Color(0xff322E54),
            scaffoldBackgroundColor: Colors.black87,
      ),

      home: design_page(),
    );
  }
}
