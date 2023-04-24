import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LocalDb{
  Future<SharedPreferences> pref = SharedPreferences.getInstance();

  Future<bool> getStatus()async{
     final instance = await  pref;
      if(instance.containsKey('status')){
        final value = instance.getBool('status');
        return value!;
      }else{
        return false;
      }
  }

  setStatus(bool value)async{
    final instance = await pref;
    instance.setBool('status', value);
  }
}