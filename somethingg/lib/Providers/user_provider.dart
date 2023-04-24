import 'package:flutter/material.dart';
import 'package:somethingg/Models/users.dart';
import 'package:somethingg/Resourses/authentication.dart';


class UserProvider with ChangeNotifier{
  UserProvider(){
    refreshUser();
  }
  Authentication authh = Authentication();
  User? _user ;
  User get getUser {
    refreshUser();
    return _user!;
  }
    Future refreshUser()async{
      User user = await authh.getUserdetails();
      _user = user;
      notifyListeners();
    }
  }
