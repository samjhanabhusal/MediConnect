import 'package:flutter/material.dart';

import '../models/bed.dart';

class HospitalProvider extends ChangeNotifier {
  Bed _bed = Bed(
      id: '',
      hospital_picture: [],
      beds_available: '',
      location: '',
      hospital_location: '',
      general_ward_total: '',
      general_ward_available: '',
      VIP_ward_available: '',
      VIP_ward_total: '',
      ICU_available: '',
      ICU_total: '',
      ventilators_total: '',
      ventilators_available: '', hospitalId: '', );

  Bed get hospital => _bed;

  void setProduct(String hospital) {
    _bed = Bed.fromJson(hospital);
    notifyListeners();
  }

  void setProductFromModel(Bed bed) {
    _bed = bed;
    notifyListeners();
  }

  void setHospital(String body) {}
}
