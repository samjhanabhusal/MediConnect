// import 'package:chatapp/CustomUI/ButtonCard.dart';
import 'package:luveen/chat/CustomUi/ButtonCard.dart';
import 'package:luveen/chat/CustomUi/ContactCard.dart';
// import 'package:chatapp/CustomUI/ContactCard.dart';
import 'package:luveen/models/ChatModel.dart';
// import 'package:chatapp/Screens/CreateGroup.dart';
import 'package:luveen/chat/Screens/CreateGroup.dart';
import 'package:flutter/material.dart';

class SelectContact extends StatefulWidget {
  // SelectContact({Key key}) : super(key: key);
  SelectContact({Key? key}) : super(key: key);

  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts = [
       ChatModel(name: "Dev Stack", status: "A full stack developer", currentMessage: '', icon: '', id: null, isGroup: null, time: ''),
    ChatModel(name: "Balram", status: "Flutter Developer...........", currentMessage: '', icon: '', id: null, isGroup: null, time: ''),
    ChatModel(name: "Saket", status: "Web developer...", currentMessage: '', icon: '', id: null, isGroup: null, time: ''),
    ChatModel(name: "Bhanu Dev", status: "App developer....", currentMessage: '', icon: '', id: null, isGroup: null, time: ''),
    ChatModel(name: "Collins", status: "Raect developer..", currentMessage: '', icon: '', id: null, isGroup: null, time: ''),
    ChatModel(name: "Kishor", status: "Full Stack Web", currentMessage: '', icon: '', id: null, isGroup: null, time: ''),
    ChatModel(name: "Testing1", status: "Example work", currentMessage: '', icon: '', id: null, isGroup: null, time: ''),
    ChatModel(name: "Testing2", status: "Sharing is caring", currentMessage: '', icon: '', id: null, isGroup: null, time: ''),
    ChatModel(name: "Divyanshu", status: ".....", currentMessage: '', icon: '', id: null, isGroup: null, time: ''),
    ChatModel(name: "Helper", status: "Love you Mom Dad", currentMessage: '', icon: '', id: null, isGroup: null, time: ''),
    ChatModel(name: "Tester", status: "I find the bugs", currentMessage: '', icon: '', id: null, isGroup: null, time: ''),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Contact",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "256 contacts",
                style: TextStyle(
                  fontSize: 13,
                ),
              )
            ],
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.search,
                  size: 26,
                ),
                onPressed: () {}),
            PopupMenuButton<String>(
              padding: EdgeInsets.all(0),
              onSelected: (value) {
                print(value);
              },
              itemBuilder: (BuildContext contesxt) {
                return [
                  PopupMenuItem(
                    child: Text("Invite a friend"),
                    value: "Invite a friend",
                  ),
                  PopupMenuItem(
                    child: Text("Contacts"),
                    value: "Contacts",
                  ),
                  PopupMenuItem(
                    child: Text("Refresh"),
                    value: "Refresh",
                  ),
                  PopupMenuItem(
                    child: Text("Help"),
                    value: "Help",
                  ),
                ];
              },
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: contacts.length + 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => CreateGroup()));
                  },
                  child: ButtonCard(
                    icon: Icons.group,
                    name: "New group",
                  ),
                );
              } else if (index == 1) {
                return ButtonCard(
                  icon: Icons.person_add,
                  name: "New contact",
                );
              }
              return ContactCard(
                contact: contacts[index - 2],
              );
            }));
  }
}