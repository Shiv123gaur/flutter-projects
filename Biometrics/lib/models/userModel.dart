import 'package:cloud_firestore/cloud_firestore.dart';

class Userr{
  Userr({ this.email, this.name});
  final String? email;
  final String? name;

  Userr fromSnap(DocumentSnapshot snapshot){
    return Userr(email: snapshot['email'], name: snapshot['name']);
  }
}