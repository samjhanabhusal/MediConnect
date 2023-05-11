import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:luveen/chat/CustomUi/ButtonCard.dart';
import 'package:luveen/chat/CustomUi/CustomCard.dart';
import 'package:luveen/chat/Pages/CameraPage.dart';
import 'package:luveen/chat/Screens/IndividualPage.dart';
// import 'package:luveen/chat/Screens/IndividualPage.dart';
import 'package:luveen/chat/services/chatservices.dart';
import 'package:luveen/common/widgets/loader.dart';
import 'package:luveen/models/ChatModel.dart';
import 'package:luveen/models/Doctor.dart';
import 'package:luveen/providers/user_provider.dart';
import 'package:provider/provider.dart';
class ChatList2 extends StatefulWidget {
  const ChatList2({Key? key}) : super(key: key);

  @override
  State<ChatList2> createState() => _ChatList2State();
}

class _ChatList2State extends State<ChatList2> 
 with SingleTickerProviderStateMixin{
  // object of doctormodel
  late Doctor targetchat;
  late final String targetid;
  String? x;
  List<Doctor>? doctors;
  final ChatServices chatServices = ChatServices();

  @override
  void initState() {
    super.initState();
        _controller = TabController(length: 2, vsync: this, initialIndex: 1);

    fetchAlldoctor();
  }

  fetchAlldoctor() async {
    doctors = await chatServices.fetchAlldoctor(context);
    setState(() {});
  }

        final user = UserProvider().user;

 late String sourceChat;
  late TabController _controller;
// late List<ChatModel> chatmodels; // Declare the list without initializing it

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = TabController(length: 2, vsync: this, initialIndex: 1);

  //   // Initialize the list inside the initState method
  //   chatmodels = [
  //     ChatModel(
  //       name: "Doctor1",
  //       isGroup: false,
  //       currentMessage: "Hi ${UserProvider().user.name}", // Access the name property of the user object
  //       time: "4:00",
  //       icon: "person.svg",
  //       id: 1,
  //       status: '',
  //     ),
  //     ChatModel(
  //       name: "Doctor2",
  //       isGroup: false,
  //       currentMessage: "Hi ${UserProvider().user.name}", // Access the name property of the user object
  //       time: "13:00",
  //       icon: "person.svg",
  //       id: 2,
  //       status: '',
  //     ),
  //   ];
  // }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
                    final doctorData = doctors;
                              final doctor = context.watch<UserProvider>().doctor;


     return doctors == null ? const Loader():Scaffold(
      appBar: new AppBar(
        //  decoration: const BoxDecoration(
                // gradient: GlobalVariables.appBarGradient,
        backgroundColor:
      Color.fromARGB(255, 19, 133, 4),
      // Color.fromARGB(255, 74, 241, 68),
      
        title: Text("Chat with doctor"),     // actions: [
      
        ),
      // ),
       body:ListView.builder(
        
          itemCount: doctors!.length,
          itemBuilder: (contex, index)  
  => InkWell(
      onTap: () {
        // Navigator.pushReplacement(
        Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => IndividualPage(
                                // chatmodels: chatmodels,
                                doctors: doctors![index],
                                // sourchat: sourceChat,
                                // sourchat:user.id,
                              )));
                },
                child: ButtonCard(
                  name: doctor.name,
                  icon: Icons.person,
                ),
              )),
    );
  }
}