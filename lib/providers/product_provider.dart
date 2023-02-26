// import 'package:luveen/models/user.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class UserProvider extends ChangeNotifier {
  Product _product = Product(
    id: '',
    name: '',
    price: 0,
    quantity: 0,
    images: [],
    category: '',
    description: '',
    rating: [],
    
  );

  Product get user => _product;

  void setProduct(String user) {
    _product = Product.fromJson(user);
    notifyListeners();
  }

  void setProductFromModel(Product product) {
    _product = product;
    notifyListeners();
  }
}
