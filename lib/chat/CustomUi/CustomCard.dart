import 'package:luveen/constants/global_variables.dart';
import 'package:luveen/models/ChatModel.dart';
// import 'package:luveen/chat/ Screens/CameraScreen.dart';
// import 'package:luveen/chat/ Screens/CameraScreen.dart';
import 'package:luveen/chat/Screens/IndividualPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luveen/constants/global_variables.dart';
import '../../models/user.dart';
import '../../providers/user_provider.dart';
import 'package:provider/provider.dart';

class CustomCard extends StatefulWidget {
  // const CustomCard({Key key, this.chatModel, this.sourchat}) : super(key: key);
  // const CustomCard({Key ?key, required this.chatModel, required this.sourchat}) : super(key: key);
  const CustomCard({Key ?key, required this.chatModel}) : super(key: key);
  final ChatModel chatModel;
  // final ChatModel sourchat;
  // final User user;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
          final user = context.watch<UserProvider>().user;

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (contex) => IndividualPage(
                      chatModel: widget.chatModel,
                      // sourchat: widget.user.id,
                      // user:sourceChat,
                    )));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: SvgPicture.asset(
                widget.chatModel.isGroup == true ? "assets/groups.svg" : "assets/person.svg",
                color: Colors.white,
                height: 36,
                width: 36,
              ),
              backgroundColor: Colors.blueGrey,
            ),
            title: Text(
              widget.chatModel.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(
                  width: 3,
                ),
                Text(
                  widget.chatModel.currentMessage,
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            trailing: Text(widget.chatModel.time),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 80),
            child: Divider(
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}