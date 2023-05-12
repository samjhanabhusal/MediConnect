// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:luveen/models/Doctor.dart';

class MessageModel {
  String type;
  String message;
  String time;
  String sourceId;
  String targetId;
  MessageModel({
    required this.message, 
    required this.type,
     required this.time,
     required this.sourceId,
     required this.targetId,

     });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'message': message,
      'time': time,
      'sourceId':sourceId,
      'targetId':targetId
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      type: map['type'] ?? '',
      message: map['message'] ?? '',
      time: map['time'] ?? '',
      sourceId: map['sourceId'] ?? '',
      targetId: map['targetId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  // factory MessageModel.fromJson(String source) => MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);
  factory MessageModel.fromJson(String source) => MessageModel.fromMap(json.decode(source));

  MessageModel copyWith({
    String? type,
    String? message,
    String? time,
    String? sourceId,
    String? targetId,
  }) {
    return MessageModel(
      type: type ?? this.type,
      message: message ?? this.message,
      time: time ?? this.time,
      sourceId: sourceId ?? this.sourceId,
      targetId: targetId ?? this.targetId,
    );
  }
}


// // Chatgpt
// class Message {
//   final String id;
//   final String senderId;
//   final String receiverId;
//   final String text;

//   Message({
//     required this.id,
//     required this.senderId,
//     required this.receiverId,
//     required this.text,
//   });

//   // Factory methods for serialization/deserialization
//   factory Message.fromJson(Map<String, dynamic> json) {
//     return Message(
//       id: json['id'],
//       senderId: json['senderId'],
//       receiverId: json['receiverId'],
//       text: json['text'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'senderId': senderId,
//       'receiverId': receiverId,
//       'text': text,
//     };
//   }
// }
