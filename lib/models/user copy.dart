// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String address;
  final String contactno;
  final String type;
  final String token;
  final List<dynamic> cart;
  final List<dynamic> prescription;
  final List<dynamic> profiles;
  final String errMsg;

  // Authentication state values
  
  final bool isAuthenticated;
  // for spinners--reg ra log loading
  final bool? regLoading;
  final bool? logLoading;

  final dynamic user;
  final List<dynamic> allUsers;

  // Chats state values
  // whenever you click on a user to chat with user active User update 
  final String activeUser;
  // ---activeRoom for socket io
  final String activeRoom;

// Chat Messages
final List<Map<String, dynamic>> messages;





  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.contactno,
    required this.type,
    required this.token,
    required this.cart,
    required this.prescription,
    required this.profiles,
    required this.errMsg,
    required this.isAuthenticated,
    
    this.regLoading,
    this.logLoading,
    this.user,
    required this.allUsers,
    required this.activeUser,
    required this.activeRoom,
    required this.messages,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'contactno': contactno,
      'type': type,
      'token': token,
      'cart': cart,
      'prescription': prescription,
      'profiles': profiles,
      'errMsg': errMsg,
      'isAuthenticated': isAuthenticated,
      'regLoading': regLoading,
      'logLoading': logLoading,
      'user': user,
      'allUsers': allUsers,
      'activeUser': activeUser,
      'activeRoom': activeRoom,
      'messages': messages,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      address: map['address'] as String,
      contactno: map['contactno'] as String,
      type: map['type'] as String,
      token: map['token'] as String,
      cart: List<dynamic>.from((map['cart'] as List<dynamic>),),
      prescription: List<dynamic>.from((map['prescription'] as List<dynamic>),),
      profiles: List<dynamic>.from((map['profiles'] as List<dynamic>),),
      errMsg: map['errMsg'] as String,
      isAuthenticated: map['isAuthenticated'] as bool,
      regLoading: map['regLoading'] != null ? map['regLoading'] as bool : null,
      logLoading: map['logLoading'] != null ? map['logLoading'] as bool : null,
      user: map['user'] as dynamic,
      allUsers: List<dynamic>.from((map['allUsers'] as List<dynamic>),),
      activeUser: map['activeUser'] as String,
      activeRoom: map['activeRoom'] as String,
      // The error message you're receiving is probably related to the fact that you're trying to use an integer as if it were a map. The map function transforms each integer in the list into a map, but the lambda function you're passing as an argument is simply returning the integer itself, instead of returning a map.
      messages: List<Map<String, dynamic>>.from((map['messages'] as List<int>).map<Map<String, dynamic>>((x) => {'value':x}),),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? address,
    String? contactno,
    String? type,
    String? token,
    List<dynamic>? cart,
    List<dynamic>? prescription,
    List<dynamic>? profiles,
    String? errMsg,
    bool? isAuthenticated,
    bool? regLoading,
    bool? logLoading,
    dynamic? user,
    List<dynamic>? allUsers,
    String? activeUser,
    String? activeRoom,
    List<Map<String, dynamic>>? messages,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      address: address ?? this.address,
      contactno: contactno ?? this.contactno,
      type: type ?? this.type,
      token: token ?? this.token,
      cart: cart ?? this.cart,
      prescription: prescription ?? this.prescription,
      profiles: profiles ?? this.profiles,
      errMsg: errMsg ?? this.errMsg,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      regLoading: regLoading ?? this.regLoading,
      logLoading: logLoading ?? this.logLoading,
      user: user ?? this.user,
      allUsers: allUsers ?? this.allUsers,
      activeUser: activeUser ?? this.activeUser,
      activeRoom: activeRoom ?? this.activeRoom,
      messages: messages ?? this.messages,
    );
  }
}
