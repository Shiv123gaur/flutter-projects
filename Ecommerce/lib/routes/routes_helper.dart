


import 'package:ecommerce/screens/Home/home_food_page.dart';
import 'package:ecommerce/screens/Home/home_page.dart';
import 'package:ecommerce/screens/cart/cart_home.dart';
import 'package:ecommerce/screens/food/popularFoodDetails.dart';
import 'package:ecommerce/screens/food/recommended_food.dart';
import 'package:ecommerce/screens/splashscreen/SplashScreen.dart';
import 'package:get/get.dart';

import '../screens/cart/order_history.dart';

class Routes{
  static const String splashScreen = "/splash-screen";
  static const String home = "/";
  static const String popularfood = "/popular-food";
  static const String recommendedfood = "/Recommended-Food";
  static const String CartHome = "/cart-home";
  static const String OrderHistory = "/order-history";

  static go_to_home()=>home;
  static go_to_popularFood(int pageId,page)=>'$popularfood?pageid=$pageId&page=$page';
  static go_to_recommendedFood(int pageId,page)=>"$recommendedfood?pageId=$pageId&page=$page";
  static got_to_cartHome(bool isempty)=>'$CartHome?empty=$isempty';
  static go_to_splashScreen()=>'$splashScreen';
  static go_to_cartHistory()=>'$OrderHistory';

  static List<GetPage> routes =[
    GetPage(name: splashScreen, page:(){
      return Splash_Screen();
    }),
    GetPage(name: home,transition: Transition.circularReveal,page: (){
       return Home_page();
    }),
    GetPage(name: popularfood, page: (){
      var pageid = Get.parameters['pageid'];
      var page = Get.parameters['page'];
      return PopularFood_Details(pageId: int.parse(pageid!),page: page!,);
    }),
    GetPage(name: recommendedfood, page: (){
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters['page'];
      return Recommended_Food(pageId: int.parse(pageId!),page: page!,);
    }),
    GetPage(name: CartHome, transition: Transition.circularReveal,page: (){
      var isEmpty = Get.parameters['empty'];
      return Cart_Home(empty: bool.parse(isEmpty!),);
    }),
    GetPage(name: OrderHistory, page:(){
      return History();
    }),
  ];

}