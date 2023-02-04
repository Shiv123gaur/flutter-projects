
import 'package:weather/Screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:weather/Services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loadingScreen extends StatefulWidget {
  const loadingScreen({Key? key}) : super(key: key);
  @override
  State<loadingScreen> createState() => _loadingScreenState();
}

class _loadingScreenState extends State<loadingScreen> {
  @override
  void initState(){
    super.initState();
    getlocationdata();
  }
  Future getlocationdata() async{
    WeatherModel weathermodel = WeatherModel();
    var weatherdata = await weathermodel.getLocationWeather();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => locationScreen(weatherdata)));

  }
  Widget build(BuildContext context) {
    return MaterialApp(home:
        Scaffold(backgroundColor:Colors.black45,
            body:Center(
              child: SpinKitDoubleBounce(
                color: Colors.pink,
                size: 200.0,
              ),
            )
        ),
    );
  }
}


