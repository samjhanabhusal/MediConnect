import 'package:luveen/constants/global_variables.dart';
import 'package:luveen/models/ChatModel.dart';
import 'package:luveen/chat/Pages/CameraPage.dart';
import 'package:luveen/chat/Pages/ChatPage.dart';
// import 'package:chatapp/Pages/ChatPage.dart';
import 'package:flutter/material.dart';

import '../../models/user.dart';

class Homescreen extends StatefulWidget {
  // Homescreen({Key? key, required this.chatmodels, required this.sourchat}) : super(key: key);
  const Homescreen({Key? key, required this.chatmodels}) : super(key: key);
  final List<ChatModel> chatmodels;
  // final ChatModel sourchat;
  // final String sourceChat;

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        //  decoration: const BoxDecoration(
                // gradient: GlobalVariables.appBarGradient,
        backgroundColor:
      Color.fromARGB(255, 19, 133, 4),
      // Color.fromARGB(255, 74, 241, 68),
      
        title: Text("Chat with doctor"),     // actions: [
        //   IconButton(icon: Icon(Icons.search), onPressed: () {}),
        //   PopupMenuButton<String>(
        //     onSelected: (value) {
        //       print(value);
        //     },
        //     itemBuilder: (BuildContext contesxt) {
        //       return [
        //         PopupMenuItem(
        //           child: Text("New group"),
        //           value: "New group",
        //         ),
        //         PopupMenuItem(
        //           child: Text("New broadcast"),
        //           value: "New broadcast",
        //         ),
        //         PopupMenuItem(
        //           child: Text("Chat Web"),
        //           value: "Chat Web",
        //         ),
        //         PopupMenuItem(
        //           child: Text("Starred messages"),
        //           value: "Starred messages",
        //         ),
        //         PopupMenuItem(
        //           child: Text("Settings"),
        //           value: "Settings",
        //         ),
        //       ];
        //     },
        //   )
        // ],
        // bottom: TabBar(
        //   controller: _controller,
        //   indicatorColor: Colors.white,
        //   tabs: [
        //     Tab(
        //       icon: Icon(Icons.camera_alt),
        //     ),
        //     Tab(
        //       text: "CHATS",
        //     ),
        //     Tab(
        //       text: "STATUS",
        //     ),
        //     Tab(
        //       text: "CALLS",
        //     )
        //   ],
        ),
      // ),
      body: TabBarView(
        controller: _controller,
        children: [
          CameraPage(),
          ChatPage(
            chatmodels: widget.chatmodels,
            // sourchat: widget.sourchat,
            // arguments: user.id,
          ),
          // Text("STATUS"),
          // Text("Calls"),
        ],
      ),
    );
  }
}