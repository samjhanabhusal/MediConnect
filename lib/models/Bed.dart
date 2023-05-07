// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:luveen/models/Hospital.dart';
import 'package:luveen/models/rating.dart';

class Bed {
    final String hospitalId;
  final String ? id;
  final List<String> hospital_picture;
  final String beds_available;
  final String hospital_location;
  final String location;
  final String general_ward_total;
  final String general_ward_available;
  final String VIP_ward_total;
  final String VIP_ward_available;
  final String ICU_total;
  final String ICU_available;
  final String ventilators_total;

  final String ventilators_available;

 
  Bed({
    this.id,
    required this.hospitalId,
    required this.hospital_picture,
    required this.beds_available,
    required this.hospital_location,
    required this.location,
    required this.general_ward_total,
    required this.general_ward_available,
    required this.VIP_ward_total,
    required this.VIP_ward_available,
    required this.ICU_total,
    required this.ICU_available,
    required this.ventilators_total,
    required this.ventilators_available,
  });

  // Map<String, dynamic> toMap() {
  Map<String, dynamic> toMap() {
    return{
      'hospital_id': hospitalId,
      'id': id,
      'hospital_picture': hospital_picture,
      'beds_available': beds_available,
      'hospital_location': hospital_location,
      'location': location,
      'general_ward_total': general_ward_total,
      'general_ward_available': general_ward_available,
      'VIP_ward_total': VIP_ward_total,
      'VIP_ward_available': VIP_ward_available,
      'ICU_total': ICU_total,
      'ICU_available': ICU_available,
      'ventilators_total': ventilators_total,
      'ventilators_available': ventilators_available,
    };
  }

  factory Bed.fromMap(Map<String, dynamic> map) {
    return Bed(
      hospitalId: map['hospital_id'],
      id: map['_id'],
      // hospital_picture:List<String>.from( map['hospital_picture'] ),
      hospital_picture: List<String>.from((map['hospital_picture'] as List<dynamic>).map((e) => e.toString())),

      beds_available: map['beds_available'] ?? '',
      hospital_location: map['hospital_location'] ?? '',
      location: map['location'] ?? '',
      general_ward_total: map['general_ward_total'] ?? '',
      general_ward_available: map['general_ward_available'] ?? '',
      VIP_ward_total: map['VIP_ward_total'] ?? '',
      VIP_ward_available: map['VIP_ward_available'] ?? '',
      ICU_total: map['ICU_total'] ?? '',
      ICU_available: map['ICU_available'] ?? '',
      ventilators_total: map['ventilators_total'] ?? '',
      ventilators_available: map['ventilators_available'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());


  // factory Bed.fromJson(String source) => Bed.fromMap(json.decode(source) as Map<String, dynamic>);
 factory Bed.fromJson(String source) =>
      Bed.fromMap(json.decode(source));
  // Hospital copyWith({required hospital}) {}
}

//   Bed copyWith({
//     String ? id,
//     String? hospitalPicture,
//     String? beds_available,
//     String? hospital_location,
//     String? location,
//     String? general_ward_total,
//     String? general_ward_available,
//     String? VIP_ward_total,
//     String? VIP_ward_available,
//     String? ICU_total,
//     String? ICU_available,
//     String? ventilators_total,
//     String? ventilators_available,
//   }) {
//     return Bed(
//       id: id ?? this.id,
//       hospitalPicture: hospitalPicture ?? this.hospitalPicture,
//       beds_available: beds_available ?? this.beds_available,
//       hospital_location: hospital_location ?? this.hospital_location,
//       location: location ?? this.location,
//       general_ward_total: general_ward_total ?? this.general_ward_total,
//       general_ward_available: general_ward_available ?? this.general_ward_available,
//       VIP_ward_total: VIP_ward_total ?? this.VIP_ward_total,
//       VIP_ward_available: VIP_ward_available ?? this.VIP_ward_available,
//       ICU_total: ICU_total ?? this.ICU_total,
//       ICU_available: ICU_available ?? this.ICU_available,
//       ventilators_total: ventilators_total ?? this.ventilators_total,
//       ventilators_available: ventilators_available ?? this.ventilators_available,
//     );
//   }
// }
