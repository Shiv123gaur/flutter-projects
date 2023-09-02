

import 'dart:convert';
import 'dart:ui';

import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/data/repositories/popular_product_repo.dart';
import 'package:ecommerce/models/cartModel.dart';
import 'package:get/get.dart';
import 'package:ecommerce/models/popular_products_model.dart';
import 'package:http/http.dart' as https;


class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  late CartController _cart;
  CartController get cart=>_cart;
  List<dynamic> _popularProductList = [];
  bool _isLoaded = false;
  int _quantity=0;
  int _cartItems=0;

  List<dynamic> get popularProductList => _popularProductList;
  bool get isloaded  => _isLoaded;
  int get quantity =>_quantity;
  int get cartItem  =>_cartItems+_quantity;



  Future<void> getPopularProductList()async{
    https.Response response = await popularProductRepo.getPopularProductlist();
    if(response.statusCode ==200){
      _popularProductList = [];
      _popularProductList.addAll(Popular_Products.fromJson(jsonDecode(response.body)).productss);
      update();
      _isLoaded = true;
    }else{
       print("There was error in popularproduct controller  shivvv");
    }
  }

  void increment(bool isIncremented){
     if(isIncremented){
        if(_quantity>=20){
            Get.snackbar("Quantity exceeded!!", "Cannot add more.",backgroundColor: Color(0xff01FFFF));
        }else{
          _quantity = _quantity+1;
          print("incremented");
          update();
        }
     }else{
       if(_cartItems+_quantity<=0){
          Get.snackbar("cannot deduct more", "please try adding!!",backgroundColor:Color(0xff01FFFF));
       }else{
         _quantity = _quantity-1;
         update();
       }
     }
  }

 void initiate(CartController cart,Products products){
    if(cart.cartItems.containsKey(products.id)){
       cart.cartItems.forEach((keyy, value) {
          if(value.id == products.id){
           _cartItems = value.quantity!;
          }
       });
    }else{
      _quantity = 0;
      _cartItems=0;
    }
    _cart = cart;
  }
  void add_cart(Products products ,int quantity){
    _cart.Add_to_Cart(products, quantity);
    _quantity=0;
    _cartItems =_cart.getQuantity(products);
    update();
    _cart.cartItems.forEach((key, value) {
      print("The id is :"+value.id!.toString()+" quatity :"+value.quantity.toString());
    });
  }

  int get Get_Cart_Items{
    return cart.CartTotal;
  }

  List<CartModel> get cartItems{
    return _cart.cartItemss;
  }
}