// import 'package:chatapp/CustomUI/ButtonCard.dart';
import 'package:luveen/chat/CustomUi/ButtonCard.dart';
import 'package:luveen/models/ChatModel.dart';
import 'package:luveen/chat/Screens/Homescreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ChatModel sourceChat;
  List<ChatModel> chatmodels = [
    ChatModel(
    
      name:"Doctor",
      isGroup: false,
      currentMessage: "Hi Everyone",
      time: "4:00",
      icon: "person.svg",
      id: 1, status: '',
    ),
    ChatModel(
      name: "Doctor ",
      isGroup: false,
      currentMessage: "Hi sam",
      time: "13:00",
      icon: "person.svg",
      id: 2, status: '',
    ),

   
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: chatmodels.length,
          itemBuilder: (contex, index) => InkWell(
                onTap: () {
                  sourceChat = chatmodels.removeAt(index);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => Homescreen(
                                chatmodels: chatmodels,
                                sourchat: sourceChat,
                              )));
                },
                child: ButtonCard(
                  name: chatmodels[index].name,
                  icon: Icons.person,
                ),
              )),
    );
  }
}