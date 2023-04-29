


import 'package:luveen/chat/CustomUi/CustomCard.dart';
import 'package:luveen/models/ChatModel.dart';
import 'package:luveen/chat/Screens/SelectContact.dart';
import 'package:flutter/material.dart';
import 'package:luveen/models/Doctor.dart';
import 'package:luveen/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:luveen/chat/services/chatservices.dart';

import '../../features/home/services/home_services.dart';
import '../../models/user.dart';

class ChatPage extends StatefulWidget {
  // ChatPage({Key? key, required this.chatmodels, required this.sourchat}) : super(key: key);
  const ChatPage({Key? key, required this.chatmodels,}) : super(key: key);
  final List<ChatModel> chatmodels;
  // final ChatModel sourchat;
  // final User user;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
    String? x;
  List<Doctor>? doctors;
  final ChatServices chatServices = ChatServices();

  @override
  void initState() {
    super.initState();
        // _controller = TabController(length: 2, vsync: this, initialIndex: 1);

    fetchAlldoctor();
  }

  fetchAlldoctor() async {
    doctors = await chatServices.fetchAlldoctor(context);
    setState(() {});
  }
 @override
  Widget build(BuildContext context) {
      final user = context.watch<UserProvider>().user;

    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(context,
      //         MaterialPageRoute(builder: (builder) => SelectContact()));
      //   },
        // child: Icon(
        //   Icon(
        //   Icons.chat,
        //   color: Colors.white,
        // ),
      // ),
      body: ListView.builder(
        // children:<Widget<[]
        // final productData = products![index];

        itemCount: widget.chatmodels.length,
        itemBuilder: (contex, index) => CustomCard(

          // chatModel: widget.chatmodels[index],
          doctors: doctors![index],

          // sourchat: widget.user.id,
          // user: user.id;
          // sourchat: Provider.of<UserProvider>(context, listen: false).user.id),
        ),
      ),
    );
  }
}