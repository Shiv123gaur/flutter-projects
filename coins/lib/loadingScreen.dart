

import 'package:coins/coinScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'coinData.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    gettingData();
  }

  gettingData()async{
    String? currency = 'USD';
    var data1;
    var data2;
    var data3;
    CoinsData rate = CoinsData();
    data1 = await rate.InitialRates();
    data2 = await rate.CurrencyWiseRateETH(currency);
    data3 = await rate.CurrencyWiseRateLTC(currency);

    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CoinScreen(data1,data2,data3)));
  }
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      body: Center(
        child: SpinKitThreeInOut(color: Colors.green,size: 80,),
      ),
    ),);
  }
}

