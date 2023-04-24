// // ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:luveen/models/doctor.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String address;
  final String contactno;
  final String role;
  final String token;
  final List<dynamic> cart;
  final List<dynamic> prescription;
  final List<dynamic> profiles;
  final List<dynamic> doctors;
  // final List<Doctor> doctor;


  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.role,
    required this.token,
    required this.cart,
    required this.contactno,
    required this.prescription,
    required this.profiles,
    required this.doctors,
    // required this.doctor

  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'contactno': contactno,
      'role': role,
      'token': token,
      'cart': cart,
      'prescription':prescription,
      'profiles':profiles,
      'doctors':doctors,
      // 'doctor'kjhkjh:doctor,

    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      address: map['address'] ?? '',
      contactno: map['contactno'] ?? '',
      role: map['role'] ?? '',
      token: map['token'] ?? '',
      cart: List<Map<String, dynamic>>.from(
        map['cart']?.map(
          (x) => Map<String, dynamic>.from(x),
        ),
      ),
      prescription: List<Map<String, dynamic>>.from(
        map['prescription']?.map(
          (x) => Map<String, dynamic>.from(x),
        ),
      ),
      doctors: List<Map<String, dynamic>>.from(
        map['doctors']?.map(
          (x) => Map<String, dynamic>.from(x),
        ),
      ),
      // doctor: map['doctor'] != null ? Doctor.fromMap(map['doctor']) : null,
  // );
       profiles: List<Map<String, dynamic>>.from(
        map['profiles']?.map(
          (x) => Map<String, dynamic>.from(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? address,
    String? contactno,
    String? role,
    String? token,
    List<dynamic>? cart,
    List<dynamic>? prescription,
    List<dynamic>? profiles,
    List<dynamic>? doctors

  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      address: address ?? this.address,
      contactno: contactno ?? this.contactno,
      role: role ?? this.role,
      token: token ?? this.token,
      cart: cart ?? this.cart,
      prescription: prescription ?? this.prescription,
      profiles: profiles ?? this.profiles,
      doctors: doctors ?? this.doctors,

    );
  }
}


class UserData {
  final String? id;
  final String name;
  final String email;
  UserData({
    this.id,
    required this.name,
    required this.email,
  });

// }
// class User {
//   final String id;
//   final String name;
//   final String email;
//   final String password;
//   final String address;
//   final String contactno;
//   final String role;
//   final String token;
//   final List<String> cart;
//   final List<String> prescription;
//   final List<String> profiles;
//   final List<String> doctors;
//   final Doctor doctor;

//   User({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.password,
//     required this.address,
//     required this.role,
//     required this.token,
//     required this.cart,
//     required this.contactno,
//     required this.prescription,
//     required this.profiles,
//     required this.doctors,
//     required this.doctor,
//   });

//   // Factory methods for serialization/deserialization
//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['id'],
//       name: json['name'],
//       email: json['email'],
//       password: json['password'],
//       address: json['address'],
//       contactno: json['contactno'],
//       role: json['role'],
//       token: json['token'],
//       cart: List<String>.from(json['cart']),
//       prescription: List<String>.from(json['prescription']),
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
//       'prescription': prescription,
//       'profiles': profiles,
//       'doctors': doctors,
//       'doctor': doctor.toJson(),
//     };
//   }

//   User copyWith({required cart}) {}
}