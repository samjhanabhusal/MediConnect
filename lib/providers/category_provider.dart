import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../models/product.dart';

class CategoryProvider extends ChangeNotifier {
  // Product _product = Product(
  //   id: '',
  //   name: '',
  //   price: 0,
  //   quantity: 0,
  //   images: [],
  //   category: '',
  //   description: '',
  //   rating: [],
    
  // );

  List<String> bhkOptions = [];
  String city = 'Rome';


  bhkOptionsAdd(String s){
    bhkOptions.add(s);
    notifyListeners();
  }

  bhkOptionsRemove(String s){
    bhkOptions.remove(s);
    notifyListeners();
  }

}