import 'package:ecommerce/models/popular_products_model.dart';

class Popular_Products{
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<Products> _products;

  List<Products> get productss =>_products;

  Popular_Products({required totalSize, required typeId, required offset, required products}){
    this._totalSize = totalSize;
    this._typeId = typeId;
    this._offset = offset;
    this._products = products;
  }

  Popular_Products.fromJson(Map<String,dynamic> json) {
    _totalSize = json['total_size'];
    _typeId = json['type_id'];
    _offset = json['offset'];
    if (json['products'] != null) {
      _products = <Products>[];
      json['products'].forEach((v) {
        _products!.add(Products.fromJson(v));
      });
    }
  }
}

class Products {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  String? createdAt;
  String? updatedAt;
  int? typeId;

  Products(
      {
        this.id,
        this.name,
        this.description,
        this.price,
        this.stars,
        this.img,
        this.location,
        this.createdAt,
        this.updatedAt,
        this.typeId});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stars = json['stars'];
    img = json['img'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    typeId = json['type_id'];
  }
  Map<String,dynamic> toJson(){
     return {
         "id":this.id,
         "name" :this.name,
         "description":this.description,
         "price":this.price,
         "stars":this.stars,
         "img":this.img,
         "location":this.location,
         "createdAt":this.createdAt,
         "updatedAt":this.updatedAt,
         "typeId":this.typeId
     };
  }
}
