import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class Biometrics {
  final _authh = LocalAuthentication();
  Future<bool> hasBiometrics() async {
    final Future<bool> isavailable;
    try {
      isavailable = _authh.canCheckBiometrics;
      if (await isavailable) {
        return true;
      } else {
        return false;
      }
    } on PlatformException catch (err) {
      print(err);
      return false;
    }
  }
  Future<bool> authenticate()async{
    bool authenticated;
    bool available = await Biometrics().hasBiometrics();
    if(available){
      try{
        authenticated = await _authh.authenticate(localizedReason: "Scan your finger");
        if(authenticated){
          return true;
        }else{
          return false;
        }
      }on PlatformException catch(err){
        print(err);
        return false;
      }
    }
    return false;
  }
}
