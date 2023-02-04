import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:somethingg/Resourses/storage_images.dart';
import 'package:somethingg/Models/users.dart' as model;

class Authentication {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<String> SignUp(
      {required String email,
      required String passward,
      required String username,
      required String bio,
        required Uint8List file}) async {



    String result;
    try {
      result = "some error occured";
      if (email.isNotEmpty ||
          passward.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: passward);
        String profileURL = await StorageMethods().UploadImage("profilePhotos", file, false);
        model.User user = model.User(username: username,uId: _auth.currentUser!.uid,Email: email,url: profileURL,followers: [],following: []);
        _firestore.collection("users").doc(cred.user!.uid).set(user.toJson(),);
        result = "success";
      }else {
          result = "Enter all the fields";
      }
    } catch (error) {
      result = error.toString();
    }
   return result;
  }

  Future<String> SinginUser({required String Email,required String Passward})async{
    FirebaseAuth _auth = FirebaseAuth.instance;
    String res = "some error occured";
    try{
      if(Email.isNotEmpty && Passward.isNotEmpty){
        await _auth.signInWithEmailAndPassword(email: Email, password: Passward);
        res = "success";
      } else{
        res = "Enter all the fields";
      }
    }catch(e){
      res = e.toString();
    }
    return res;
  }


  Future<model.User> getUserdetails()async{
    User currentUser = await _auth.currentUser!;
    DocumentSnapshot snapshot = await _firestore.collection('users').doc(currentUser.uid).get();
    return model.User.fromSnap(snapshot);
  }
}
