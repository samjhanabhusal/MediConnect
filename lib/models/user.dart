import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String address;
  final String contactno;
  final String age;
  final String type;
  final String token;
  final List<dynamic> cart;
  final List<dynamic> prescription;
  final List<dynamic> profiles;


  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.type,
    required this.token,
    required this.cart,
    required this.contactno,
    required this.age,
    required this.prescription,
    required this.profiles

  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'contactno': contactno,
      'age': age,
      'type': type,
      'token': token,
      'cart': cart,
      'prescription':prescription,
            'profiles':profiles,

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
      age: map['age'] ?? '',
      type: map['type'] ?? '',
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
    String? age,
    String? type,
    String? token,
    List<dynamic>? cart,
    List<dynamic>? prescription,
    List<dynamic>? profiles

  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      address: address ?? this.address,
      contactno: contactno ?? this.contactno,
      age: age ?? this.age,
      type: type ?? this.type,
      token: token ?? this.token,
      cart: cart ?? this.cart,
      prescription: prescription ?? this.prescription,
      profiles: profiles ?? this.profiles,

    );
  }
}
