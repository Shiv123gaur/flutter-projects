import 'package:ecommerce/controllers/recommended_products_controller.dart';
import 'package:ecommerce/data/api/client_api.dart';
import 'package:ecommerce/utils/project_constanst.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as https;

class Recommended_products extends GetxService{
  final ApiClient apiClient;
  Recommended_products({required this.apiClient});

  Future<https.Response> getrecommendedProducts()async{
       https.Response response = await apiClient.getData(AppConstants.POPULAR_PRODUCTS_END_URL);
       return response;
  }
}