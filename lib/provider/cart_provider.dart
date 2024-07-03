import 'package:flutter/material.dart';

import '../model/product_model.dart';

class Cart extends ChangeNotifier{

  List<ProductModel> _cartList = [];

  List<ProductModel> get list{
    return [..._cartList];
  }

  // total price
  int get totalPrice {
    int total = 0;
    for (var element in list) {
      total += int.parse(element.price) ;
    }
    return total;
  }

  // add to cart
  void addToCart(ProductModel product){
    _cartList.add(product);
    notifyListeners();
  }

  // delete form cart
  void deleteFromCart(ProductModel product){
    _cartList.removeWhere((p) => p.name == product.name && p.price == product.price ,);
    notifyListeners();
  }

  // clear cart
  void clearCart(){
    _cartList.clear();
    notifyListeners();
  }
}