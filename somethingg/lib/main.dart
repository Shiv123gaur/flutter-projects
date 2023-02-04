import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:somethingg/Screens/LoginScreen.dart';
import 'package:somethingg/Screens/SignupScreen.dart';
import 'package:somethingg/Utilities/colors.dart';
import 'ResponsiveLayouts/responseSelection.dart';
import 'ResponsiveLayouts/mobileResponse.dart';
import 'ResponsiveLayouts/webResponse.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBZxfI1h_P80UUnaeWEgXSLs6-Wh-nh_A8",
            appId: "1:536916852158:web:b61cc9422628d13be10def",
            messagingSenderId: "536916852158",
            projectId: "somethingg-ae51f",
            storageBucket: "somethingg-ae51f.appspot.com"));
  }else{
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),builder:(context,snapshot){  //this method help user to be logged in
          if(snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return const Response_Selection(
                Mobile: MobileResponse(),
                Web: WebResponse(),
              );
            }
            else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
          }
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(color: primaryColor,));
          }
          return LoginScreen();
      }),
    );
  }
}

// body:
