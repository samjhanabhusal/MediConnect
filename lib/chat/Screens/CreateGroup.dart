import 'package:luveen/chat/CustomUi/AvtarCard.dart';
import 'package:luveen/chat/CustomUi/ButtonCard.dart';
import 'package:luveen/chat/CustomUi/ContactCard.dart';
import 'package:luveen/models/ChatModel.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  // CreateGroup({Key key}) : super(key: key);
  CreateGroup({Key ? key}) : super(key: key);

  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
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
  List<ChatModel> groupmember = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "New Group",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Add participants",
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
          ],
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xFF128C7E),
            onPressed: () {},
            child: Icon(Icons.arrow_forward)),
        body: Stack(
          children: [
            ListView.builder(
                itemCount: contacts.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      height: groupmember.length > 0 ? 90 : 10,
                    );
                  }
                  return InkWell(
                    onTap: () {
                      setState(() {
                        if (contacts[index - 1].select == true) {
                          groupmember.remove(contacts[index - 1]);
                          contacts[index - 1].select = false;
                        } else {
                          groupmember.add(contacts[index - 1]);
                          contacts[index - 1].select = true;
                        }
                      });
                    },
                    child: ContactCard(
                      contact: contacts[index - 1],
                    ),
                  );
                }),
            groupmember.length > 0
                ? Align(
                    child: Column(
                      children: [
                        Container(
                          height: 75,
                          color: Colors.white,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: contacts.length,
                              itemBuilder: (context, index) {
                                if (contacts[index].select == true)
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        groupmember.remove(contacts[index]);
                                        contacts[index].select = false;
                                      });
                                    },
                                    child: AvatarCard(
                                      chatModel: contacts[index],
                                    ),
                                  );
                                return Container();
                              }),
                        ),
                        Divider(
                          thickness: 1,
                        ),
                      ],
                    ),
                    alignment: Alignment.topCenter,
                  )
                : Container(),
          ],
        ));
  }
}