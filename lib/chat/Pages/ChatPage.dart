


import 'package:luveen/chat/CustomUi/CustomCard.dart';
import 'package:luveen/models/ChatModel.dart';
import 'package:luveen/chat/Screens/SelectContact.dart';
import 'package:flutter/material.dart';
import 'package:luveen/models/product.dart';
import 'package:luveen/providers/user_provider.dart';
import 'package:provider/provider.dart';

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
    List<User>? users;
    final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    // users = await homeServices.fetchAllUsers(context);
    users = await homeServices.fetchAllUsers(context);
    
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

          chatModel: widget.chatmodels[index],
          // sourchat: widget.user.id,
          // user: user.id;
          // sourchat: Provider.of<UserProvider>(context, listen: false).user.id),
        ),
      ),
    );
  }
}