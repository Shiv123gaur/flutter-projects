
import 'dart:io';

import 'package:ecommerce/controllers/popular_product_controller.dart';
import 'package:ecommerce/controllers/recommended_products_controller.dart';
import 'package:ecommerce/data/api/client_api.dart';
import 'package:ecommerce/routes/routes_helper.dart';
import 'package:ecommerce/screens/Home/home_food_page.dart';
import 'package:ecommerce/screens/Home/home_page.dart';
import 'package:ecommerce/screens/cart/cart_home.dart';
import 'package:ecommerce/screens/food/popularFoodDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/widgets/trial.dart';
import 'package:ecommerce/screens/food/recommended_food.dart';
import 'package:ecommerce/helper/dependencies.dart' as dep;



class PostHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

Future main()async{
  HttpOverrides.global = new PostHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(myapp());
}


class myapp extends StatefulWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  State<myapp> createState() => _myappState();

}
class _myappState extends State<myapp> {
  @override
  void initState() {
    print(Get.height);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<Recommended_products_Controller>().getRecommended_products_list();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.go_to_home(),
      getPages: Routes.routes,
    );
  }
}

