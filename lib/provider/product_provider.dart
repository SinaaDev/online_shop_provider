import 'package:flutter/material.dart';

import '../model/product_model.dart';

class Product extends ChangeNotifier{

  List<ProductModel> _productList = [];

  List<ProductModel> get list{
    return [..._productList];
  }

  List<ProductModel> get favouriteList{
    return [..._productList.where((product) => product.favorite == true,)];
  }


  // add product method
  void addProduct(ProductModel product){
    _productList.add(product);
    notifyListeners();
  }

  // delete product
  void deleteProduct(ProductModel product){
    _productList.removeWhere((p) => p.name == product.name && p.price == product.price);
    notifyListeners();
  }

}