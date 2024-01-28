import 'package:ecommerce/models/cartModel.dart';
import 'package:ecommerce/models/popular_products_model.dart';
import 'package:flutter/material.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExist;
  String? time;
  Products? product;

  CartModel(
      {this.id,
      this.name,
      this.price,
      this.img,
      required this.quantity,
      this.time,
      required this.product});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    quantity = json['quantity'];
    isExist = json['exist'];
    time = json['time'];
    product = Products.fromJson(json['product']);
  }
  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "price": this.price,
      "img": this.img,
      "quantity": this.quantity,
      "isExist": this.isExist,
      "time": this.time,
      "product":this.product!.toJson(),
    };
  }
}
