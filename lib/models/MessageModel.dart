import 'package:luveen/models/Doctor.dart';

class MessageModel {
  String type;
  String message;
  String time;
  MessageModel({
    required this.message, required this.type, required this.time});
}




// Chatgpt
class Message {
  final String id;
  final String senderId;
  final String receiverId;
  final String text;

  Message({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.text,
  });

  // Factory methods for serialization/deserialization
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'senderId': senderId,
      'receiverId': receiverId,
      'text': text,
    };
  }
}

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

//   // Send a message to a doctor
//   void sendMessageToDoctor(String doctorId, String messageText) {
//     // Find the doctor in the list of doctors
//     Doctor doctor = findDoctorById(doctorId);

//     // Create a new message object with the current user as the sender
//     Message message = Message(
//       id: generateMessageId(),
//       senderId: this.id,
//       receiverId: doctor.id,
//       text: messageText,
//     );

//     // Add the message to the doctor's list of messages
//     doctor.messages.add(message.toJson());
//   }

//   // Find a doctor by id
//   Doctor findDoctorById(String doctorId) {
//     return doctors.firstWhere((doctor) => doctor.id == doctorId);
//   }

//   // Generate a unique id for a new message
//   String generateMessageId() {
//     // Your implementation of this method may vary depending on your backend/database setup
//     // Here's a simple
