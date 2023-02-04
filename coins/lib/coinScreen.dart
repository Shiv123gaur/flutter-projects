import 'package:flutter/material.dart';
import 'coinData.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class CoinScreen extends StatefulWidget {
  CoinScreen(this.data1,this.data2,this.data3);
  final data1;
  final data2;
  final data3;

  @override
  State<CoinScreen> createState() => _CoinScreenState();
}

class _CoinScreenState extends State<CoinScreen> {
  @override
  String? aSelectedCurrency = 'USD';
  String currency='';
  double rate1=0;
  double  rate2=0;
  double  rate3 =0;
  String ?SelectedCurrency='';
  void initState() {
    super.initState();
    rate1 = widget.data1['rate'];
    currency = widget.data1['asset_id_quote'];
    rate1 = double.parse(rate1.toStringAsFixed(2));
    rate2 = widget.data2['rate'];
    rate2  =  double.parse(rate2.toStringAsFixed(2));
    rate3 = widget.data3['rate'];
    rate3 = double.parse(rate3.toStringAsFixed(2));
  }


  Widget wwidgetPicker(){
    if(Platform.isIOS){
      return getIosDropdown();
    }else{
      return getAndroidDropdown();
    }
  }
  DropdownButton<String> getAndroidDropdown() {
    List<DropdownMenuItem<String>> newlist = [];
    for (int i = 0; i < currencyy.length; i++) {
      String currency = currencyy[i];
      var item = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      newlist.add(item);
    }
    return DropdownButton<String>(
        value: aSelectedCurrency,
        items: newlist,
        onChanged: (value) {
          setState(() {
            aSelectedCurrency = value;
            SelectedCurrency= value;
            UpdateUI_1();
            UpdateUI_2();
            UpdateUI_3();
          });
        }
    );
  }
  CupertinoPicker getIosDropdown(){
    List<Text> newlist = [];
    for(String item in currencyy){
      newlist.add(Text(item));
    }
    return CupertinoPicker(itemExtent:32 ,onSelectedItemChanged: (selected){
      print(selected);
    },children: newlist,);

  }
  UpdateUI_1()async{
       CoinsData data = CoinsData();
       var dataa1 = await data.CurrencyWiseRateBTC(SelectedCurrency);
       setState(() {
         currency = dataa1['asset_id_quote'];
         rate1 = dataa1['rate'];
         rate1 = double.parse(rate1.toStringAsFixed(2));
       });
  }
  UpdateUI_2()async{
    CoinsData data = CoinsData();
    var dataa2 = await data.CurrencyWiseRateETH(SelectedCurrency);
    setState(() {
      currency = dataa2['asset_id_quote'];
      rate2 = dataa2['rate'];
      rate2 = double.parse(rate2.toStringAsFixed(2));
    });
  }
  UpdateUI_3()async{
    CoinsData data = CoinsData();
    var dataa3 = await data.CurrencyWiseRateLTC(SelectedCurrency);
    setState(() {
      currency = dataa3['asset_id_quote'];
      rate3 = dataa3['rate'];
      rate3 = double.parse(rate3.toStringAsFixed(2));
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:  AppBar(
          title: Text(
            "🤑 Coin Ticker",
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: Colors.greenAccent,
          shadowColor: Colors.black,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 1),
              child: Center(
                child: Container(
                  height: 60,
                  width: 300,
                  child: Card(
                    elevation: 5,color: Colors.greenAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "1  BTC =$rate1 $currency",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 20,right: 20,top: 2),
              child: Center(
                child: Container(
                  height: 60,width: 300,
                  child: Card(elevation: 5,color: Colors.greenAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Align(
                    alignment:Alignment.center,
                    child: Text("1 ETH = $rate2 $currency ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
                  ),),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Container(
                  height: 60,width: 300,
                  child: Card(
                    elevation: 5,color: Colors.greenAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Align(alignment: Alignment.center,child:
                      Text("1 LTC = $rate3 $currency",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.white),),),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(alignment: Alignment.center,
                width: double.infinity,
                height: 150,
                color: Colors.greenAccent,
                child:wwidgetPicker(),
              ),
            )
          ],
        ),
      ),
    );
  }
}







