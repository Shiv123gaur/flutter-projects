
import 'package:geolocator/geolocator.dart';

class Locationn{
  double latitude=0.0;
  double longitude=0.0;
  Future getCurrentLocation() async{
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission==LocationPermission.denied || permission  == LocationPermission.deniedForever){
      print("Permission not given ");
      LocationPermission asked = await Geolocator.requestPermission();
    }else{
      Position currentPositon = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
     latitude = currentPositon.latitude;
     longitude = currentPositon.longitude;
    }
  }
}
