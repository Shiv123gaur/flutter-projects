import 'package:flutter/material.dart';
import 'package:weather/Services/weather.dart';
import 'cityScreen.dart';

class locationScreen extends StatefulWidget {

  locationScreen(this.weatherr);
  final weatherr;

  @override
  State<locationScreen> createState() => _locationScreenState();
}

class _locationScreenState extends State<locationScreen> {
  var cityy;
  var data;
  int temp=0;
  int conditionId=0;
  String iconn='';
  String city="";
  String Messagee ="";
  WeatherModel weatherrr = WeatherModel();
  @override

  void initState() {
    super.initState();
    print(widget.weatherr);
    UIupdate(widget.weatherr);

  }
  void UIupdate(weatherData){
   setState(() {
     if(weatherData==null){
       temp = 0;
       conditionId = 0;
       city = 'unknown';
       iconn = 'none';
       Messagee = 'some error';
     }else {
       double temperature = weatherData['main']['temp'];
       temp = temperature.toInt();
       conditionId = weatherData['weather'][0]['id'];
       city = weatherData['name'];
       iconn = weatherrr.getWeatherIcon(conditionId);
       Messagee = weatherrr.getMessage(temp);
     }
   });
  }
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(padding: EdgeInsets.all(10),

            height: double.infinity,
          width: double.infinity,
          decoration:  BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/climate.jpg"),
                  fit: BoxFit.cover)),
         child:
         SafeArea(
           child: Column(children: [
             Row(children: [
               TextButton(onPressed: ()async{
                     var weatherdataa = await weatherrr.getLocationWeather();
                     UIupdate(weatherdataa);
               },
                   child: Icon(Icons.near_me,color: Colors.black,size: 50,)),
               SizedBox(width: 200,),
               TextButton(onPressed: ()async{
                    cityy = await Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          return CityScreen();
                    }));
                    if(cityy != null) {
                      data =await weatherrr.citylocation(cityy);
                      print(data);
                      UIupdate(data);
                    }
               },
                   child: Icon(Icons.location_city,size: 50,color: Colors.black,))
             ],),
             SizedBox(height: 60,),
             Row(mainAxisAlignment: MainAxisAlignment.center,
               children: [
               Text("$temp°",style: TextStyle(fontSize: 130,fontWeight: FontWeight.bold,),),
               SizedBox(width: 20,),
               Text(iconn,style: TextStyle(fontSize: 60),)
             ],),
             SizedBox(height: 30,),
             Text(Messagee,style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color: Colors.black),),
             Text("in $city",style: TextStyle(fontSize: 55,fontWeight: FontWeight.w700,color: Colors.black),),

           ],),
         )
        ),
    );
  }
}

