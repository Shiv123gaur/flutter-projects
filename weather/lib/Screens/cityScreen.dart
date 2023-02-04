import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String CityName='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/cityWeather.jpg"),
                fit: BoxFit.fill),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,color: Colors.black,
                        size: 55,
                      ),
                    )),
                Container(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    style: TextStyle(
                      color: Colors.pink,
                    ),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        icon: Icon(Icons.location_city,color: Colors.white,size: 30,),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      hintText:"Enter the name of city",
                      hintStyle: TextStyle(color: Colors.black)
                    ),
                   onChanged: (value){
                     CityName=value;
                   },

                  ),
                ),
                TextButton(
                    onPressed: () {
                        Navigator.pop(context,CityName);
                    },
                    child: Container(height: 50,width: 160,
                      color: Colors.black,
                      child: Align(alignment: Alignment.center,
                        child: Text(
                          "Get Weather",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ))
              ],
            ),
          )),
    );
  }
}
