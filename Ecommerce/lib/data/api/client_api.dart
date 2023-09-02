
import 'package:get/get.dart';
import 'package:http/http.dart' as https;
import 'package:ecommerce/utils/project_constanst.dart';


class ApiClient extends GetConnect implements GetxService{
    late String token;
    Map<String,String> _headers = {};
    late String baseurl;
    ApiClient({required this.baseurl}){
        baseUrl = baseurl;
        timeout = Duration(seconds: 30);
        token ="";
        _headers = {
            'Content-type':'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token',
        };
    }

    //   WAS GIVING NULL IN RESPONSE SO SKIPPED GET AND USED HTTPS INSTEAD
    // Future<Response> gettPopularProduct(String uri)async{
    //      try{
    //          Response response = await get(uri);
    //          print(response.statusCode);
    //          return response;
    //      }catch(e){
    //          return Response(statusCode: 1,statusText:e.toString());
    //      }
    // }

    Future<https.Response> getData(String endUrl)async{
        Map<String,String> head;
        head = {"Bearer":"${AppConstants.TOKEN}"};
        https.Response response = await https.get(Uri.parse(AppConstants.BASE_URL+endUrl),headers: head);
        return response;
    }

}
















