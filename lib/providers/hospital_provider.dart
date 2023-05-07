import 'package:flutter/material.dart';

import '../models/Hospital.dart';

class HospitalProvider extends ChangeNotifier {
  Hospital _hospital = Hospital(
    id: '',
    name: '',
    password: '',
    // bed: [], 
    email: '',
    
  );

  Hospital get hospital => _hospital;

  void setHospital(String hospital) {
    _hospital = Hospital.fromJson(hospital);
    notifyListeners();
  }

  void setHospitalFromModel(Hospital hospital) {
    _hospital = hospital;
    notifyListeners();
  }
}
