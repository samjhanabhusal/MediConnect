// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'dart:convert';
// import 'dart:ffi';

class Doctor {
  final String name;
  final String email;
  final String password;
  final String  contactno;
  final String address;
  final String qualification;
  final String specialization;
  final String experience;
  final int nmc_no;
  final String? id;
  Doctor({
    required this.name,
    required this.email,
    required this.password,
    required this.contactno,
    required this.address,
    required this.qualification,
    required this.specialization,
    required this.experience,
    required this.nmc_no,
     this.id,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'contactno': contactno,
      'address': address,
      'qualification': qualification,
      'specialization': specialization,
      'experience': experience,
      'nmc_no': nmc_no,
      'id': id,
    };
  }

  factory Doctor.fromMap(Map<String, dynamic> map) {
    return Doctor(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      contactno: map['contactno'] as String,
      address: map['address'] as String,
      qualification: map['qualification'] as String,
      specialization: map['specialization'] as String,
      experience: map['experience'] as String,
      nmc_no: map['nmc_no'] ?.toInt() ?? 0,
      id: map['_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Doctor.fromJson(String source) => Doctor.fromMap(json.decode(source) as Map<String, dynamic>);

//   Doctor copyWith({
//     String? name,
//     String? email,
//     String? password,
//     String? contactno,
//     String? qualification,
//     String? specialization,
//     int? experience,
//     int? nmc_no,
//   }) {
//     return Doctor(
//       name: name ?? this.name,
//       email: email ?? this.email,
//       password: password ?? this.password,
//       contactno: contactno ?? this.contactno,
//       qualification: qualification ?? this.qualification,
//       specialization: specialization ?? this.specialization,
//       experience: experience ?? this.experience,
//       nmc_no: nmc_no ?? this.nmc_no,
//     );
//   }
}
