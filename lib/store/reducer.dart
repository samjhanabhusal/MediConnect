import 'package:flutter/material.dart';
import 'package:luveen/models/user.dart';
import 'package:redux/redux.dart';
// import 'package:main.dart';
// import 'package:luveen/Models.dart';
import 'actions/types.dart';
import 'package:luveen/main.dart';

@immutable
// Initial State Values

class ChatState {
  // Authentication state values
  final String errMsg;
  final bool isAuthenticated;
  // for spinners--reg ra log loading
  final bool? regLoading;
  final bool? logLoading;

  User? user;
  final List<UserData>? allUsers;

  // Chats state values
  // whenever you click on a user to chat with user active User update 
  final String activeUser;
  // ---activeRoom for socket io
  final String activeRoom;

// Chat Messages
final List<Map<String, dynamic>> messages;
 // Chat State Constructor
ChatState({
  this.user,
  required this.errMsg,
  required this.isAuthenticated,
  required this.regLoading,
  required this.logLoading,
  required this.allUsers,
  required this.activeUser,
  required this.activeRoom,
  required this.messages
});


// In the context of state management in Flutter, copyWith is often used to update the state of a widget without 
//mutating the original state object. For example, if a widget has a ChatState object that contains information about the current chat, and the user wants 
//to update the error message displayed on the screen, copyWith can be used to create a new ChatState object with the same properties as the original object, except with the errMsg property set to the new error message.
ChatState copyWith({
  String? errMsg,
  required bool isAuthenticated,
  dynamic user,
  required List<dynamic> allUsers,
}) {
  // return ChatState(
  //   errMsg: errMsg ?? this.errMsg,
  //   isAuthenticated: isAuthenticated,
  //   user: user ?? this.user,
  //   allUsers: allUsers, activeRoom: '', activeUser: '', logLoading: null, messages: [], regLoading: null,
  // );
  return ChatState(
errMsg: errMsg ?? this.errMsg,
isAuthenticated: isAuthenticated,
allUsers: this.allUsers,
activeUser: activeUser?? this.activeUser,
activeRoom: activeRoom ?? this.activeRoom,
user:user??this.user,
messages:messages??messages, logLoading: null, regLoading: null,
  );
}

  // static ChatState fromJson(String chatState) {}


  
}


// Authentication Reducer
ChatState authReducer(ChatState state, dynamic action){
return state;

}


// Reset Reducer
ChatState resetReducer(ChatState state, dynamic action){
   return state;
}

// Combine Reducer(s)
final reducers = combineReducers<ChatState>([authReducer, resetReducer]);