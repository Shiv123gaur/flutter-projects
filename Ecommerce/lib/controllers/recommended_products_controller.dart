
import 'dart:convert';

import 'package:ecommerce/data/repositories/popular_product_repo.dart';
import 'package:ecommerce/models/popular_products_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as https;

class Recommended_products_Controller extends GetxController{
  final PopularProductRepo popularProductRepo;
   Recommended_products_Controller({required this.popularProductRepo});

   List<dynamic> _products=[];
   List<dynamic> get products =>_products;
   bool _isloaded = false;
   bool get  isloaded =>_isloaded;

   Future<void> getRecommended_products_list()async{
      https.Response response = await popularProductRepo.getPopularProductlist();
      if(response.statusCode==200){
        _products = [];
        _products.addAll(Popular_Products.fromJson(jsonDecode(response.body)).productss);
        _isloaded = true;
        update();
        print("Recommended products loaded");
      }else{
        print("Something went wrong");
      }
   }
}