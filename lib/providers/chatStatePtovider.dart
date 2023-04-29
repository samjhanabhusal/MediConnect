// // Initial state/store values
// import 'package:flutter/material.dart';
// import '../store/reducer.dart';


// from json rakhnuu parxa in reduer.dart

// class ChatStateProvider extends ChangeNotifier {
// // final Store<ChatState> store = Store<ChatState>(reducers,
//   ChatState _chatState = ChatState(
//       errMsg: '',
//       isAuthenticated: false,
//       regLoading: null,
//       logLoading: null,
//       allUsers: [],
//       activeUser: "",
//       activeRoom: "",
//       messages: []);

//   ChatState get chatState => _chatState;

//   void setChatState (String chatState){
//     _chatState = ChatState.fromJson(chatState);
//     notifyListeners();
//   }
//   void setUserFromModel(ChatState chatState) {
//     _chatState = chatState;
//     notifyListeners();  
//   }   
//   }