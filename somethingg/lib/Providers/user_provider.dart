import 'package:flutter/material.dart';
import 'package:somethingg/Models/users.dart';
import 'package:somethingg/Resourses/authentication.dart';

class userProvider with ChangeNotifier{
  Authentication authh = Authentication();
  User? _user ;
  User get getUser => _user!;

  Future<void> refreshUser()async{
     User user = await authh.getUserdetails();
     _user = user;
     notifyListeners();
  }
}