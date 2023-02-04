import 'dart:convert';
import 'package:http/http.dart';
import 'coinScreen.dart';

const List<String> currencyy = [
  'INR',
  'ERU',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'USD',
  'ZAR'
];


class CoinsData{
  Future<dynamic> InitialRates()async{
    String url = "https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=0D0804FE-BC85-4F02-B2C3-F4471BA46865";
    Response response= await get(Uri.parse(url));
    String data  = response.body;
    var decodedData = jsonDecode(data);
    return decodedData;
  }
  Future<dynamic> CurrencyWiseRateBTC(String? currency)async{
    String url  = "https://rest.coinapi.io/v1/exchangerate/BTC/$currency?apikey=0D0804FE-BC85-4F02-B2C3-F4471BA46865";
    Response response = await get(Uri.parse(url));
    String data = response.body;
    var Decodeddata = jsonDecode(data);
    return Decodeddata;
  }
  Future<dynamic> CurrencyWiseRateETH(String? currency)async{
    String url  = "https://rest.coinapi.io/v1/exchangerate/ETH/$currency?apikey=0D0804FE-BC85-4F02-B2C3-F4471BA46865";
    Response response = await get(Uri.parse(url));
    String data = response.body;
    var Decodeddata = jsonDecode(data);
    print(response.statusCode);
    return Decodeddata;
  }
  Future<dynamic> CurrencyWiseRateLTC(String? currency)async{
    String url  = "https://rest.coinapi.io/v1/exchangerate/LTC/$currency?apikey=0D0804FE-BC85-4F02-B2C3-F4471BA46865";
    Response response = await get(Uri.parse(url));
    print(response.statusCode);
    String data = response.body;
    var Decodeddata = jsonDecode(data);
    return Decodeddata;
  }
}
