import 'dart:convert';

import 'package:luveen/models/Doctor.dart';
import 'package:flutter/material.dart';

// class DoctorProvider extends ChangeNotifier {
class DoctorProvider extends ChangeNotifier {
  Doctor _doctor = Doctor(
    id: '',
    name: '',
    email: '',
    password: '',
    address: '',
    contactno: '',
    qualification: '', experience: '', 
    // nmc_no: 0, 
    nmc_no: '',
    specialization: '',
    
  );

//   Doctor get doctor => _doctor;
// void setDoctor(String doctorJson) {
//   Map<String, dynamic> doctorData = json.decode(doctorJson);
//   _doctor = Doctor.fromJson(doctorData as String);
//   notifyListeners();
// }
  // ignore: non_constant_identifier_names
  void setDoctor(String doctor) {
    _doctor = Doctor.fromJson(doctor);
    // _doctor = Doctor.fromJson(Doctor);
    notifyListeners();
  }

  void setDoctorFromModel(Doctor doctor) {
    _doctor = doctor;
    notifyListeners();
  }
}
