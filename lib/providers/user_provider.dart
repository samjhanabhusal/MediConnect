import 'package:luveen/models/Doctor.dart';
import 'package:luveen/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    name: '',
    email: '',
    password: '',
    address: '',
    contactno: '',
    role: '',
    token: '',
    cart: [],
    prescription: [],
    profiles:[],
    doctors:[],
    // doctor: Doctor(name: '', email: '', password: '', contactno: '', address: '', qualification: '', specialization: '', experience: '', nmc_no: 0) ,
  );

  User get user => _user;

  get doctor => null;

  void setUser(String user) {
    _user = User.fromJson(user);
    // _user = User.fromJson(user as Map<String, dynamic>);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
