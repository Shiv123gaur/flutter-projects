import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MobileResponse extends StatefulWidget {
  const MobileResponse({Key? key}) : super(key: key);

  @override
  State<MobileResponse> createState() => _MobileResponseState();
}

String userName = '';

class _MobileResponseState extends State<MobileResponse> {
  @override
  void initState() {
    //getUsername();
    super.initState();
  }

  // void getUsername() async {
  //   DocumentSnapshot snap = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .get();
  //   setState(() {
  //     userName = (snap.data() as Map<String, dynamic>)['userName'];
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      appBar: AppBar(title: Text("${userName}"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This is the card !",style: TextStyle(fontSize: 50),),
          ),color: Colors.red,),
      ),
    ),);
  }
}
