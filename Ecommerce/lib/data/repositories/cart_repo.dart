import 'dart:convert';

import 'package:ecommerce/utils/project_constanst.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cartModel.dart';

class Cart_repo{
    final SharedPreferences sharedPreferences;
    Cart_repo({required this.sharedPreferences});
    List<String> CartItems=[];
    List<String> CartHistory=[];
    addItemsSharedpreferences(List<CartModel> list){
      CartItems = [];
      var time = DateTime.now().toString();
      list.forEach((element) {
           element.time =time;
          return CartItems.add(jsonEncode(element));
      });
      sharedPreferences.setStringList(AppConstants.CARTITEMS, CartItems);
    }

    List<CartModel> getCartItems(){
      List<String> cartItems =[];
      List<CartModel> items =[];
      if(sharedPreferences.containsKey(AppConstants.CARTITEMS)){
        cartItems = sharedPreferences.getStringList(AppConstants.CARTITEMS)!;
        items =[];
        cartItems.forEach((element) {
          items.add(CartModel.fromJson(jsonDecode(element)));
        });
      }
      return items;

    }
    void AddCartHistory(){
      if(sharedPreferences.containsKey(AppConstants.CARTHISTORYLIST)){
        CartHistory = sharedPreferences.getStringList(AppConstants.CARTHISTORYLIST)!;
      }
      for(int i=0;i<CartItems.length;i++){
        CartHistory.add(CartItems[i]);
      }
      print("This is the length  history storage ${CartHistory.length}");
      for(int i=0;i<getHistory().length;i++){
        print("This is the time take by item $i ${getHistory()[i].time}");
      }
      sharedPreferences.setStringList(AppConstants.CARTHISTORYLIST, CartHistory);
      removeData();
    }
    void removeData(){
      CartItems = [];
      sharedPreferences.remove(AppConstants.CARTITEMS);
    }

    List<CartModel> getHistory(){
      List<String> list=[];
      List<CartModel> historyItems = [];
      if(sharedPreferences.containsKey(AppConstants.CARTHISTORYLIST)){
       list = sharedPreferences.getStringList(AppConstants.CARTHISTORYLIST)!;
      }
      list.forEach((element) {
        historyItems.add(CartModel.fromJson(jsonDecode(element)));
      });
      return historyItems;
    }

    // void clean(){
    //   sharedPreferences.remove(AppConstants.CARTITEMS);
    //   sharedPreferences.remove(AppConstants.CARTHISTORYLIST);
    // }

}