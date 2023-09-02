import 'package:ecommerce/data/api/client_api.dart';
import 'package:ecommerce/utils/project_constanst.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as https;

class PopularProductRepo extends GetxService{
   final ApiClient apiClient;
   PopularProductRepo({required this.apiClient});

   Future<https.Response> getPopularProductlist()async{
      return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCTS_END_URL);
   }
}