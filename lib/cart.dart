import'home.dart';
import 'product.dart';
import'cart.dart';
import'cartProduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends ChangeNotifier {
  List<Product> products=[
    Product('Bombshell Rose' , 100, 'assets/1.png',0 ),
    Product('Tease' , 200, 'assets/2.png',0),
    Product('Elegant' , 300, 'assets/3.png',0 ),
    Product('Jasmine' , 100, 'assets/4.png',0),
    Product('Beauty' , 200, 'assets/5.png',0),
    Product('Bombshell Black' , 300, 'assets/6.png',0 ),
  ];

  List<Product> CartofUser = [];

  List<Product> getProductsList(){
    return products;
  }

  List<Product> getUsersCart(){
    return CartofUser;
  }

  void removeItem(Product product) {
    CartofUser.remove(product);
    notifyListeners();
  }

  void addItemToCart(Product product) {
    CartofUser.add(product);
    notifyListeners();
  }

  double calculateFinalPrice() {
    double finalPrice = 0.0;
    for (Product item in CartofUser) {
      finalPrice += item.price * item.quantity;
    }
    return finalPrice;
  }
}

