import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:luveen/chat/CustomUi/CustomCard2.dart';
import 'package:luveen/chat/services/chatservices.dart';
import 'package:luveen/common/widgets/loader.dart';
import 'package:luveen/features/account/services/account_services.dart';
import 'package:luveen/models/user.dart';
import 'package:luveen/providers/user_provider.dart';

class DoctorScreen extends StatefulWidget {
  static const String routeName = '/doctor-screen';
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> 
with SingleTickerProviderStateMixin{
  // object of doctormodel
  // late Doctor targetchat;
  late User targetchat;
  late final String targetid;
  String? x;
  List<User>? users;
  final ChatServices chatServices = ChatServices();

  @override
  void initState() {
    super.initState();
        _controller = TabController(length: 2, vsync: this, initialIndex: 1);

    fetchAlluser();
  }

  fetchAlluser() async {
    users = await chatServices.fetchAllUsersByRole(context);
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
                    
     return users == null ? const Loader():Scaffold(
      appBar: new AppBar(
        //  decoration: const BoxDecoration(
                // gradient: GlobalVariables.appBarGradient,
        backgroundColor:
      Color.fromARGB(255, 19, 133, 4),
      // Color.fromARGB(255, 74, 241, 68),
      
        title: Text("Chat with User"),     // actions: [
      
        ),
      // ),
       body:ListView.builder(
        
          itemCount: users!.length,
          itemBuilder: (contex, index) => CustomCard(
              //  final doctordata = doctors![intex]
                // chatModel: chatmodels[index],
                // chatModel: chatmodels[index],
                // doctors: ,
                users: users![index],
                 
               
 
              ),
              
          ),
         floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.logout),
            onPressed: () => AccountServices().logOut(context),
            tooltip: 'logout')
        //  children: 
        //           [ButtonCard(
        //             name: doctorData[index].name,
        //             icon: Icons.person,
        //           ),
        //         ],     
      
    );
    
  }
}