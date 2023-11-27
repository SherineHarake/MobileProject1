import 'package:flutter/material.dart';
import 'cart.dart';
import 'CartPage.dart';
import 'cartProduct.dart';
import'home.dart';
class Product {
  final String _name;
  final double _price;
  final String _image;
  int _quantity;

  Product(this._name, this._price, this._image, this._quantity);

  String get name => _name;
  double get price => _price;
  String get image => _image;
  int get quantity => _quantity;

  set quantity(int value) {
    _quantity = value.clamp(0, 10);
  }
}
List<Product> products=[
  Product('Bombshell Rose' , 100, 'assets/1.png',1 ),
  Product('Tease' , 200, 'assets/2.png',1),
  Product('Elegant' , 300, 'assets/3.png',1 ),
  Product('Jasmine' , 100, 'assets/4.png',1),
  Product('Beauty' , 200, 'assets/5.png',1),
  Product('Bombshell Black' , 300, 'assets/6.png',1 ),
];