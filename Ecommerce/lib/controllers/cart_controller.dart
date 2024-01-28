import 'dart:ui';

import 'package:ecommerce/controllers/popular_product_controller.dart';
import 'package:ecommerce/data/repositories/cart_repo.dart';
import 'package:ecommerce/models/cartModel.dart';
import 'package:ecommerce/models/popular_products_model.dart';
import 'package:ecommerce/routes/routes_helper.dart';
import 'package:ecommerce/screens/cart/order_history.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
   CartController({required this.cart_repo});
   final Cart_repo cart_repo;

   Map<int,CartModel> _items={};
   List<CartModel> StorageItems = [];
   List<CartModel> History = [];
   Map<int,CartModel> get cartItems=>_items;
   List<CartModel> get history =>History;

   set cartPage(Map<int,CartModel> moree){
      _items = moree;
   }

   void Add_to_Cart(Products products,int quantity){
     var totalQuantity;
     if(_items.containsKey(products.id)){
       _items.update(products.id!, (value){
         totalQuantity = value.quantity!+quantity;
         if(totalQuantity>0 && totalQuantity<=20){
           return CartModel(
             id: value.id,
             name: value.name,
             price: value.price,
             img: value.img,
             quantity: value.quantity!+quantity,
             time: DateTime.now().toString(),
             product: products
           );
         }else{
           (totalQuantity<=0)?Get.snackbar("Add some quantity !!", "Zero cant't be added.",backgroundColor:Color(0xff01FFFF)):Get.snackbar("You cannot add more than 20,sorry!!", "Deduct some quantity",backgroundColor:Color(0xff01FFFF));
           return CartModel(
             id: value.id,
             name: value.name,
             price: value.price,
             img: value.img,
             quantity: value.quantity,
             time: DateTime.now().toString(),
             product: products
           );
         }
       });
       if(totalQuantity<=0){
         _items.remove(products.id);
       }
     }
     else{
       _items.putIfAbsent(products.id!, () {
         totalQuantity = quantity;
         if(quantity>0 && quantity<=20){
           return CartModel(
             id: products.id,
             name: products.name,
             price: products.price,
             img: products.img,
             quantity: quantity,
             time: DateTime.now().toString(),
             product: products
           );
         }else{
           (totalQuantity<=0)?Get.snackbar("Add some quantity !!", "Zero cant't be added.",backgroundColor:Color(0xff01FFFF)):Get.snackbar("You cannot add more than 20,sorry!!", "Deduct some quantity",backgroundColor:Color(0xff01FFFF));
           return CartModel(
             id: products.id,
             name: products.name,
             price: products.price,
             img: products.img,
             quantity: quantity,
             time: DateTime.now().toString(),
             product: products
           );
         }
       });
       if(totalQuantity<=0){
         _items.remove(products.id);
       }
     }
     cart_repo.addItemsSharedpreferences(cartItemss);
     update();
   }

    int getQuantity(Products product){
      int quantityy=0;
       if(_items.containsKey(product.id)){
          _items.forEach((key, value) {
               if(key==product.id!){
                  quantityy = value.quantity!;
               }
          });
          return quantityy;
       }
       return 0;
   }

   int get CartTotal{
     var cartt=0;
     _items.forEach((key, value) {
        cartt += value.quantity!;
     });
     return cartt;
   }
   List<CartModel> get cartItemss{
     return  _items.entries.map((e) {
        return e.value;
     }).toList();

   }

   int get totalAmount{
     var total = 0;
     _items.forEach((key, value) {
        total = total+(value.quantity!*value.price!);
     });
     return total;
   }


   List<CartModel> get GetStoredData{
     storageData = cart_repo.getCartItems();
      return StorageItems;
   }

   set storageData(List<CartModel> list){
      StorageItems = list;
      for(int i=0;i<StorageItems.length;i++){
         _items.putIfAbsent(StorageItems[i].product!.id!, () =>StorageItems[i]);
      }
   }


   void AddHistory(){
     cart_repo.AddCartHistory();
     clear();
   }
   void clear(){
     _items = {};
     update();
   }

   List<CartModel> getHistory(){
     History = cart_repo.getHistory();
     return History;
   }

   void addToSharedpreferences(){
     cart_repo.addItemsSharedpreferences(cartItemss);
     update();
   }





}



