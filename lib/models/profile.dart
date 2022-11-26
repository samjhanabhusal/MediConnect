// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Profile {
  final String firstname;
  final String lastname;
  final String address;
  final String gender;
  final double age;
  // final String ? status;
  final double phoneno;
  // final List<String> image;
  final String? id;
  // final String userId;

  Profile({
    required this.firstname,
    required this.lastname,
    required this.address,
    required this.gender,
    required this.age,
    //  this.status,
    required this.phoneno,
    this.id,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstname': firstname,
      'lastname': lastname,
      'address': address,
      'gender': gender,
      'age': age,
      // 'status':status,
      'phoneno': phoneno,
      'id': id,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      firstname: map['firstname'] as String,
      lastname: map['lastname'] as String,
      // status: map['status'] as String,
      // status: map['status']!=null?map['status'] as String:null,
      address: map['address'] as String,
      gender: map['gender'] as String,
      phoneno: map['phoneno']?.toDouble()?? 0.0,
      age: map['age']?.toDouble() ?? 0.0,
      id: map['_id'] != null ? map['_id'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) => Profile.fromMap(json.decode(source) as Map<String, dynamic>);
}
