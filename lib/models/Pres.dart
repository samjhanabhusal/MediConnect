import 'dart:convert';

class Pres {
  final String name;
  final String presdescription;
  final double age;
  final List<String> presimages;
  final String? id;
  // final String userId;

  Pres({
    required this.name,
    required this.presdescription,
    required this.age,
    required this.presimages,
    this.id,
    // required this.userId
  });
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': presdescription,
      'age': age,
      'images': presimages,
      'id': id,
      // 'userId':userId
    };
  }

  factory Pres.fromMap(Map<String, dynamic> map) {
    return Pres(
      name: map['name'] ?? '',
      presdescription: map['description'] ?? '',
      presimages: List<String>.from(map['images']),
      age: map['age']?.toDouble() ?? 0.0,
      id: map['_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Pres.fromJson(String source) => Pres.fromMap(json.decode(source));
}
