

import 'package:ecommerce/controllers/popular_product_controller.dart';
import 'package:ecommerce/controllers/recommended_products_controller.dart';
import 'package:ecommerce/data/api/client_api.dart';
import 'package:ecommerce/data/repositories/cart_repo.dart';
import 'package:ecommerce/data/repositories/popular_product_repo.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controllers/cart_controller.dart';

Future<void> init()async{

  //loading api
  Get.lazyPut(() => ApiClient(baseurl: "https://mvs.bslmeiyu.com"));

  //loading repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(()=>PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(()=>Cart_repo());

  //loading controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => Recommended_products_Controller(popularProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cart_repo: Get.find()));
}