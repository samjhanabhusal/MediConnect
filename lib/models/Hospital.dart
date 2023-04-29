// // ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:luveen/models/Doctor.dart';

class Hospital {
  final String id;
  final String name;
  final String email;
  final String password;
  final List<dynamic> bed;
 


  Hospital({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.bed,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'bed': bed,
    };
  }

  factory Hospital.fromMap(Map<String, dynamic> map) {
    return Hospital(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      bed: List<Map<String, dynamic>>.from(
        map['bed']?.map(
          (x) => Map<String, dynamic>.from(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Hospital.fromJson(String source) => Hospital.fromMap(json.decode(source) as Map<String, dynamic>);

  Hospital copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    List<dynamic>? bed,
  }) {
    return Hospital(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      bed: bed ?? this.bed,
    );
  }
}


// class UserData {
//   final String? id;
//   final String name;
//   final String email;
//   UserData({
//     this.id,
//     required this.name,
//     required this.email,
//   });

// }
// class Hospital {
//   final String id;
//   final String name;
//   final String email;
//   final String password;
//   final String address;
//   final String contactno;
//   final String role;
//   final String token;
//   final List<String> cart;
//   final List<String> bed;
//   final List<String> profiles;
//   final List<String> doctors;
//   final Doctor doctor;

//   Hospital({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.password,
//     required this.address,
//     required this.role,
//     required this.token,
//     required this.cart,
//     required this.contactno,
//     required this.bed,
//     required this.profiles,
//     required this.doctors,
//     required this.doctor,
//   });

//   // Factory methods for serialization/deserialization
//   factory Hospital.fromJson(Map<String, dynamic> json) {
//     return Hospital(
//       id: json['id'],
//       name: json['name'],
//       email: json['email'],
//       password: json['password'],
//       address: json['address'],
//       contactno: json['contactno'],
//       role: json['role'],
//       token: json['token'],
//       cart: List<String>.from(json['cart']),
//       bed: List<String>.from(json['bed']),
//       profiles: List<String>.from(json['profiles']),
//       doctors: List<String>.from(json['doctors']),
//       doctor: Doctor.fromJson(json['doctor']),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'email': email,
//       'password': password,
//       'address': address,
//       'contactno': contactno,
//       'role': role,
//       'token': token,
//       'cart': cart,
//       'bed': bed,
//       'profiles': profiles,
//       'doctors': doctors,
//       'doctor': doctor.toJson(),
//     };
//   }

//   Hospital copyWith({required cart}) {}
// }