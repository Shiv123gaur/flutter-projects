import 'package:http/http.dart';
import 'dart:convert';

class NetworkingData {
  String url;

  NetworkingData(this.url);

  networking() async{

    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    }else{
      print(response.statusCode);
    }
  }
}