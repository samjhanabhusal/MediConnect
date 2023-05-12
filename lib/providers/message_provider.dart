import 'package:luveen/models/Doctor.dart';
import 'package:luveen/models/MessageModel.dart';

import 'package:flutter/material.dart';

class MessageProvider extends ChangeNotifier {
  MessageModel _message = MessageModel(
   message: '',
    sourceId: '',
     time: '',
     targetId: '',
     type: ''
    // doctor: Doctor(name: '', email: '', password: '', contactno: '', address: '', qualification: '', specialization: '', experience: '', nmc_no: 0) ,
  );

  MessageModel get message => _message;

  // get message => null;

  void setMessage(String message) {
    _message = MessageModel.fromJson(message);
    // _user = User.fromJson(user as Map<String, dynamic>);
    notifyListeners();
  }

  void setMessageFromModel(MessageProvider user) {
    _message = message;
    notifyListeners();
  }
}
