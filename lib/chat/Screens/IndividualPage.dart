// // ignore_for_file: public_member_api_docs, sort_constructors_first
// // import 'package:camera/camera.dart';
// // import 'package:chatapp/CustomUI/CameraUI.dart';
// // import 'package:chatapp/CustomUI/OwnMessgaeCrad.dart';
// // import 'package:emoji_picker/emoji_picker.dart';
// import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:provider/provider.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

// import 'package:luveen/chat/CustomUi/OwnMessageCard.dart';
// import 'package:luveen/chat/CustomUi/ReplyCard.dart';
// import 'package:luveen/chat/services/chatservices.dart';
// import 'package:luveen/constants/global_variables.dart';
// import 'package:luveen/models/ChatModel.dart';
// import 'package:luveen/models/Doctor.dart';
// import 'package:luveen/models/MessageModel.dart';
// import 'package:luveen/providers/user_provider.dart';

// import '../../models/user.dart';

// class IndividualPage extends StatefulWidget {
//   // IndividualPage({Key key, this.chatModel, this.sourchat}) : super(key: key);
//   // IndividualPage({Key ? key, required this.chatModel, required this.sourchat}) : super(key: key);
//   // const IndividualPage({Key ? key, required this.chatModel,}) : super(key: key);
//   // final ChatModel chatModel;
//   static const String routeName = '/individualPage';
//   // final Doctor doctor;

//   //  IndividualPage({Key ? key, required this.doctor, required doctor_id,}) : super(key: key);

//   const IndividualPage({
//     Key? key,
//     required this.doctors,
//   }) : super(key: key);

//   final Doctor doctors;
//   // final ChatModel sourchat;
//   // final User user;

//   @override
//   _IndividualPageState createState() => _IndividualPageState();
// }

// class _IndividualPageState extends State<IndividualPage> {
//   final ChatServices chatServices = ChatServices();
//   bool show = false;
//   FocusNode focusNode = FocusNode();
//   bool sendButton = false;
//   List<MessageModel> messages = [];
//   TextEditingController _controller = TextEditingController();
//   ScrollController _scrollController = ScrollController();
//   // Socket socket = ... ;
//   IO.Socket? socket;
//   // IO.Socket socket = IO.io('http://localhost:3000');
//   @override
//   //when page is mounted initState will run......
//   // Initializing socket in init--connect()
//   void initState() {
//     super.initState();
//     // connect();

//     focusNode.addListener(() {
//       if (focusNode.hasFocus) {
//         setState(() {
//           show = false;
//         });
//       }
//     });
//     connect();
//   }

//   void connect() {
//     // MessageModel messageModel = MessageModel(sourceId: widget.sourceChat.id.toString(),targetId: );
//     // Configue Socket transports
//     // Uri.parse('$uri/auth/get-products'),
//     // IO.Socket socket = IO.io('$uri', <String, dynamic>{

//     // connecting backend
//     // IO.Socket socket = IO.io('$uri', <String, dynamic>{
//     //   "transports": ["websocket"],
//     //   "autoConnect": false,
//     // });
//     IO.Socket socket =
//         IO.io('$uri', IO.OptionBuilder().setTransports(['websocket']).build());

//     // Connect to websocket
//     socket.connect();

//     // tried to connect with backend manually
//     // once connected to backend then OnConnect method will be run and client ..like frontend ma connect

//     // Handle socket events---Thelle Codes
//     // socket.on('connect', (_) =>print("connect: ${socket.id}"));
//     socket.on('connect', (_) =>print("connect: ${socket.id}"));

//     // socket.emit("signin", widget.sourchat.id);
//     socket.emit("signin", sourceChat);
//     socket.onConnect((data) {
//       print("Connected into frontend");
//       socket.on("message", (msg) {
//         print(msg);
//         setMessage("destination", msg["message"]);
//         _scrollController.animateTo(_scrollController.position.maxScrollExtent,
//             duration: Duration(milliseconds: 300), curve: Curves.easeOut);
//       });
//     });
//     print("Enteringggg");
//     print(socket.connected);
//     socket.onConnectError((data) => print(data));
//   }

// // void connectToServer() {
// //     try {
// //       socket = IO.io('http://192.168.43.92:8090', <String, dynamic>{
// //         'transports': ['websocket'],
// //         'autoConnect': false,
// //       });
// //       socket.connect();
// //       socket.emit('/test', 'test');
// //       socket.onConnect((_) {
// //         print('connected');
// //         // socket.emit('msg', 'test');
// //       });
// //       socket.onConnectError((data) => print(data));
// //       // socket.on('event', (data) => print(data));
// //       // socket.onDisconnect((_) => print('disconnect'));
// //       // socket.on('fromServer', (_) => print(_));
// //     } catch (e) {
// //       print(e.toString());
// //     }
// //   }

// // void EntertoChat() {
// //     chatServices.EntertoChat(
// //       context: context,
// //       doctor:doctor,
// //     );
// //   }
//   // void sendMessage(String message, int? sourceId, int? targetId) {
//   void sendMessage(String message, String? sourceId, String? targetId) {
//     setMessage("source", message);
//     // socket.emit("message",
//     socket?.emit("message",
//         {"message": message, "sourceId": sourceId, "targetId": targetId});
//   }

//   void setMessage(String type, String message) {
//     MessageModel messageModel = MessageModel(
//         type: type,
//         message: message,
//         time: DateTime.now().toString().substring(10, 16));
//     print(messages);

//     setState(() {
//       messages.add(messageModel);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final user = context.watch<UserProvider>().user;
//     user.doctors.toList();

//     return Stack(
//       children: [
//         Image.asset(
//           "assets/images/whatsapp_Back.png",
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           fit: BoxFit.cover,
//         ),
//         Scaffold(
//           backgroundColor: Colors.transparent,
//           appBar: PreferredSize(
//             preferredSize: Size.fromHeight(60),
//             child: AppBar(
//               leadingWidth: 70,
//               titleSpacing: 0,
//               leading: InkWell(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.arrow_back,
//                       size: 24,
//                     ),
//                     CircleAvatar(
//                       child: SvgPicture.asset(
//                         // widget.chatModel.isGroup == true
//                         //     ? "assets/groups.svg"
//                         // :
//                         "assets/images/person.svg",
//                         color: Colors.white,
//                         height: 36,
//                         width: 36,
//                       ),
//                       radius: 20,
//                       backgroundColor: Colors.blueGrey,
//                     ),
//                   ],
//                 ),
//               ),
//               title: InkWell(
//                 onTap: () {},
//                 child: Container(
//                   margin: EdgeInsets.all(6),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         // widget.doctor.name,
//                         widget.doctors.name,
//                         style: TextStyle(
//                           fontSize: 18.5,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         "last seen today at 12:05",
//                         style: TextStyle(
//                           fontSize: 13,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               actions: [
//                 IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
//                 IconButton(icon: Icon(Icons.call), onPressed: () {}),
//                 // PopupMenuButton<String>(
//                 //   padding: EdgeInsets.all(0),
//                 //   onSelected: (value) {
//                 //     print(value);
//                 //   },
//                 //         itemBuilder: (BuildContext contesxt) {
//                 //           return [
//                 //             PopupMenuItem(
//                 //               child: Text("View Contact"),
//                 //               value: "View Contact",
//                 //             ),
//                 //             PopupMenuItem(
//                 //               child: Text("Media, links, and docs"),
//                 //               value: "Media, links, and docs",
//                 //             ),
//                 //             PopupMenuItem(
//                 //               child: Text("Whatsapp Web"),
//                 //               value: "Whatsapp Web",
//                 //             ),
//                 //             PopupMenuItem(
//                 //               child: Text("Search"),
//                 //               value: "Search",
//                 //             ),
//                 //             PopupMenuItem(
//                 //               child: Text("Mute Notification"),
//                 //               value: "Mute Notification",
//                 //             ),
//                 //             PopupMenuItem(
//                 //               child: Text("Wallpaper"),
//                 //               value: "Wallpaper",
//                 //             ),
//                 //           ];
//                 //         },
//                 //       ),
//               ],
//             ),
//           ),
//           body: Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             child: WillPopScope(
//               child: Column(
//                 children: [
//                   Expanded(
//                     // height: MediaQuery.of(context).size.height - 150,
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       controller: _scrollController,
//                       itemCount: messages.length + 1,
//                       itemBuilder: (context, index) {
//                         if (index == messages.length) {
//                           return Container(
//                             height: 70,
//                           );
//                         }
//                         if (messages[index].type == "source") {
//                           return OwnMessageCard(
//                             message: messages[index].message,
//                             time: messages[index].time,
//                           );
//                         } else {
//                           return ReplyCard(
//                             message: messages[index].message,
//                             time: messages[index].time,
//                           );
//                         }
//                       },
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.bottomCenter,
//                     child: Container(
//                       height: 70,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Row(
//                             children: [
//                               Container(
//                                 width: MediaQuery.of(context).size.width - 60,
//                                 child: Card(
//                                   margin: EdgeInsets.only(
//                                       left: 2, right: 2, bottom: 8),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(25),
//                                   ),
//                                   child: TextFormField(
//                                     controller: _controller,
//                                     focusNode: focusNode,
//                                     textAlignVertical: TextAlignVertical.center,
//                                     keyboardType: TextInputType.multiline,
//                                     maxLines: 5,
//                                     minLines: 1,
//                                     onChanged: (value) {
//                                       if (value.length > 0) {
//                                         setState(() {
//                                           sendButton = true;
//                                         });
//                                       } else {
//                                         setState(() {
//                                           sendButton = false;
//                                         });
//                                       }
//                                     },
//                                     decoration: InputDecoration(
//                                       border: InputBorder.none,
//                                       hintText: "Type a message",
//                                       hintStyle: TextStyle(color: Colors.grey),
//                                       prefixIcon: IconButton(
//                                         icon: Icon(
//                                           show
//                                               ? Icons.keyboard
//                                               : Icons.emoji_emotions_outlined,
//                                         ),
//                                         onPressed: () {
//                                           if (!show) {
//                                             focusNode.unfocus();
//                                             focusNode.canRequestFocus = false;
//                                           }
//                                           setState(() {
//                                             show = !show;
//                                           });
//                                         },
//                                       ),
//                                       suffixIcon: Row(
//                                         mainAxisSize: MainAxisSize.min,
//                                         children: [
//                                           IconButton(
//                                             icon: Icon(Icons.attach_file),
//                                             onPressed: () {
//                                               showModalBottomSheet(
//                                                   backgroundColor:
//                                                       Colors.transparent,
//                                                   context: context,
//                                                   builder: (builder) =>
//                                                       bottomSheet());
//                                             },
//                                           ),
//                                           IconButton(
//                                             icon: Icon(Icons.camera_alt),
//                                             onPressed: () {
//                                               // Navigator.push(
//                                               //     context,
//                                               //     MaterialPageRoute(
//                                               //         builder: (builder) =>
//                                               //             CameraApp()));
//                                             },
//                                           ),
//                                         ],
//                                       ),
//                                       contentPadding: EdgeInsets.all(5),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                   bottom: 8,
//                                   right: 2,
//                                   left: 2,
//                                 ),
//                                 child: CircleAvatar(
//                                   radius: 25,
//                                   backgroundColor: Color(0xFF128C7E),
//                                   child: IconButton(
//                                     icon: Icon(
//                                       sendButton ? Icons.send : Icons.mic,
//                                       color: Colors.white,
//                                     ),
//                                     onPressed: () {
//                                       if (sendButton) {
//                                         _scrollController.animateTo(
//                                             _scrollController
//                                                 .position.maxScrollExtent,
//                                             duration:
//                                                 Duration(milliseconds: 300),
//                                             curve: Curves.easeOut);
//                                         sendMessage(
//                                             _controller.text,
//                                             // widget.sourchat.id,
//                                             // widget.user.id,
//                                             sourceChat,
//                                             // user.id,
//                                             // user.doctors.id,
//                                             // user.doctors[index].id;
//                                             // doctor.id!

//                                             // widget.chatModel.id
//                                             // widget.doctor.id
//                                             widget.doctors.id);
//                                         _controller.clear();
//                                         setState(() {
//                                           sendButton = false;
//                                         });
//                                       }
//                                     },
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           show ? emojiSelect() : Container(),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               onWillPop: () {
//                 if (show) {
//                   setState(() {
//                     show = false;
//                   });
//                 } else {
//                   Navigator.pop(context);
//                 }
//                 return Future.value(false);
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget bottomSheet() {
//     return Container(
//       height: 278,
//       width: MediaQuery.of(context).size.width,
//       child: Card(
//         margin: const EdgeInsets.all(18.0),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // iconCreation(
//                   //     Icons.insert_drive_file, Colors.indigo, "Document"),
//                   // SizedBox(
//                   //   width: 40,
//                   // ),
//                   iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
//                   SizedBox(
//                     width: 40,
//                   ),
//                   iconCreation(Icons.insert_photo, Colors.purple, "Gallery"),
//                 ],
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   iconCreation(Icons.headset, Colors.orange, "Audio"),
//                   SizedBox(
//                     width: 40,
//                   ),
//                   iconCreation(Icons.location_pin, Colors.teal, "Location"),
//                   SizedBox(
//                     width: 40,
//                   ),
//                   // iconCreation(Icons.person, Colors.blue, "Contact"),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget iconCreation(IconData icons, Color color, String text) {
//     return InkWell(
//       onTap: () {},
//       child: Column(
//         children: [
//           CircleAvatar(
//             radius: 30,
//             backgroundColor: color,
//             child: Icon(
//               icons,
//               // semanticLabel: "Help",
//               size: 29,
//               color: Colors.white,
//             ),
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Text(
//             text,
//             style: TextStyle(
//               fontSize: 12,
//               // fontWeight: FontWeight.w100,
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget emojiSelect() {
//     return EmojiPicker(
//         // rows: 4,
//         // columns: 7,
//         onEmojiSelected: (emoji, category) {
//       print(emoji);
//       setState(() {
//         // _controller.text = _controller.text + emoji.emoji;
//         _controller.text = _controller.text;
//       });
//     });
//   }
// }

// //  Widget emojiSelect() {
// //     return EmojiPicker(
// //     onEmojiSelected: ( category,  emoji) {
// //         // Do something when emoji is tapped (optional)
// //     },
// //     onBackspacePressed: () {
// //         // Do something when the user taps the backspace button (optional)
// //         // Set it to null to hide the Backspace-Button
// //     },
// //     textEditingController: textEditionController, // pass here the same [TextEditingController] that is connected to your input field, usually a [TextFormField]
// //     config: Config(
// //         columns: 7,
// //         emojiSizeMax: 32 * (foundation.defaultTargetPlatform == TargetPlatform.iOS ? 1.30 : 1.0), // Issue: https://github.com/flutter/flutter/issues/28894
// //         verticalSpacing: 0,
// //         horizontalSpacing: 0,
// //         gridPadding: EdgeInsets.zero,
// //         initCategory: Category.RECENT,
// //         bgColor: Color(0xFFF2F2F2),
// //         indicatorColor: Colors.blue,
// //         iconColor: Colors.grey,
// //         iconColorSelected: Colors.blue,
// //         backspaceColor: Colors.blue,
// //         skinToneDialogBgColor: Colors.white,
// //         skinToneIndicatorColor: Colors.grey,
// //         enableSkinTones: true,
// //         showRecentsTab: true,
// //         recentsLimit: 28,
// //         noRecents: const Text(
// //           'No Recents',
// //           style: TextStyle(fontSize: 20, color: Colors.black26),
// //           textAlign: TextAlign.center,
// //         ), // Needs to be const Widget
// //         loadingIndicator: const SizedBox.shrink(), // Needs to be const Widget
// //         tabIndicatorAnimDuration: kTabScrollDuration,
// //         categoryIcons: const CategoryIcons(),
// //         buttonMode: ButtonMode.MATERIAL,
// //     ),
// // );
// // }
// // }












// import 'package:camera/camera.dart';
// import 'package:chatapp/CustomUI/CameraUI.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'package:luveen/chat/CustomUi/OwnMessageCard.dart';
import 'package:luveen/chat/CustomUi/ReplyCard.dart';
import 'package:luveen/chat/services/chatservices.dart';
import 'package:luveen/constants/global_variables.dart';
import 'package:luveen/models/ChatModel.dart';
import 'package:luveen/models/Doctor.dart';
import 'package:luveen/models/MessageModel.dart';
import 'package:luveen/providers/user_provider.dart';

import '../../models/user.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class IndividualPage extends StatefulWidget {

   static const String routeName = '/individualPage';
  const IndividualPage({
    Key? key,
    required this.doctors,
  }) : super(key: key);

  final Doctor doctors;

  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  final ChatServices chatServices = ChatServices();
  bool show = false;
  FocusNode focusNode = FocusNode();
  bool sendButton = false;
  List<MessageModel> messages = [];
  TextEditingController _controller = TextEditingController();
  ScrollController _scrollController = ScrollController();
  IO.Socket ? socket;
  @override
  void initState() {
    super.initState();
    // connect();

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
    connect();
  }

  void connect() {
    // MessageModel messageModel = MessageModel(sourceId: widget.sourceChat.id.toString(),targetId: );
    socket = IO.io('http://192.168.32.74:5000', <String, dynamic>{
      "setTransports": ["websocket"],
      "autoConnect": false,
    });
    socket!.connect();
    socket!.emit("signin", sourceChat);
    socket!.onConnect((data) {
      print("Connected");
      socket!.on("message", (msg) {
        print(msg);
        setMessage("destination", msg["message"]);
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300), curve: Curves.easeOut);
      });
    });
    print("Enteringggg");
    print(socket!.connected);
    socket!.onConnectError((data) => print(data));
  }

  void sendMessage(String message, String sourceId, String targetId) {
    setMessage("source", message);
    socket!.emit("message",
        {"message": message, "sourceId": sourceId, "targetId": targetId});
  }

  void setMessage(String type, String message) {
    MessageModel messageModel = MessageModel(
        type: type,
        message: message,
        time: DateTime.now().toString().substring(10, 16));
    print(messages);

    setState(() {
      messages.add(messageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    user.doctors.toList();
    return Stack(
      children: [
        Image.asset(
          "assets/images/whatsapp_Back.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBar(
              leadingWidth: 70,
              titleSpacing: 0,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      size: 24,
                    ),
                    CircleAvatar(
                      child: SvgPicture.asset(
                      
                            "assets/images/person.svg",
                        color: Colors.white,
                        height: 36,
                        width: 36,
                      ),
                      radius: 20,
                      backgroundColor: Colors.blueGrey,
                    ),
                  ],
                ),
              ),
              title: InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.all(6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.doctors.name,
                        style: TextStyle(
                          fontSize: 18.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "last seen today at 12:05",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              actions: [
                IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
                IconButton(icon: Icon(Icons.call), onPressed: () {}),
                PopupMenuButton<String>(
                  padding: EdgeInsets.all(0),
                  onSelected: (value) {
                    print(value);
                  },
                  itemBuilder: (BuildContext contesxt) {
                    return [
                      PopupMenuItem(
                        child: Text("View Contact"),
                        value: "View Contact",
                      ),
                      PopupMenuItem(
                        child: Text("Media, links, and docs"),
                        value: "Media, links, and docs",
                      ),
                      PopupMenuItem(
                        child: Text("Whatsapp Web"),
                        value: "Whatsapp Web",
                      ),
                      PopupMenuItem(
                        child: Text("Search"),
                        value: "Search",
                      ),
                      PopupMenuItem(
                        child: Text("Mute Notification"),
                        value: "Mute Notification",
                      ),
                      PopupMenuItem(
                        child: Text("Wallpaper"),
                        value: "Wallpaper",
                      ),
                    ];
                  },
                ),
              ],
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WillPopScope(
              child: Column(
                children: [
                  Expanded(
                    // height: MediaQuery.of(context).size.height - 150,
                    child: ListView.builder(
                      shrinkWrap: true,
                      controller: _scrollController,
                      itemCount: messages.length + 1,
                      itemBuilder: (context, index) {
                        if (index == messages.length) {
                          return Container(
                            height: 70,
                          );
                        }
                        if (messages[index].type == "source") {
                          return OwnMessageCard(
                            message: messages[index].message,
                            time: messages[index].time,
                          );
                        } else {
                          return ReplyCard(
                            message: messages[index].message,
                            time: messages[index].time,
                          );
                        }
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width - 60,
                                child: Card(
                                  margin: EdgeInsets.only(
                                      left: 2, right: 2, bottom: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: TextFormField(
                                    controller: _controller,
                                    focusNode: focusNode,
                                    textAlignVertical: TextAlignVertical.center,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 5,
                                    minLines: 1,
                                    onChanged: (value) {
                                      if (value.length > 0) {
                                        setState(() {
                                          sendButton = true;
                                        });
                                      } else {
                                        setState(() {
                                          sendButton = false;
                                        });
                                      }
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Type a message",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      prefixIcon: IconButton(
                                        icon: Icon(
                                          show
                                              ? Icons.keyboard
                                              : Icons.emoji_emotions_outlined,
                                        ),
                                        onPressed: () {
                                          if (!show) {
                                            focusNode.unfocus();
                                            focusNode.canRequestFocus = false;
                                          }
                                          setState(() {
                                            show = !show;
                                          });
                                        },
                                      ),
                                      suffixIcon: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.attach_file),
                                            onPressed: () {
                                              showModalBottomSheet(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (builder) =>
                                                      bottomSheet());
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.camera_alt),
                                            onPressed: () {
                                              // Navigator.push(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder: (builder) =>
                                              //             CameraApp()));
                                            },
                                          ),
                                        ],
                                      ),
                                      contentPadding: EdgeInsets.all(5),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 8,
                                  right: 2,
                                  left: 2,
                                ),
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Color(0xFF128C7E),
                                  child: IconButton(
                                    icon: Icon(
                                      sendButton ? Icons.send : Icons.mic,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      if (sendButton) {
                                        _scrollController.animateTo(
                                            _scrollController
                                                .position.maxScrollExtent,
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.easeOut);
                                        sendMessage(
                                            _controller.text,
                                            sourceChat,
                                            widget.doctors.id);
                                        _controller.clear();
                                        setState(() {
                                          sendButton = false;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // show ? emojiSelect() : Container(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              onWillPop: () {
                if (show) {
                  setState(() {
                    show = false;
                  });
                } else {
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(
                      Icons.insert_drive_file, Colors.indigo, "Document"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.insert_photo, Colors.purple, "Gallery"),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.headset, Colors.orange, "Audio"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.location_pin, Colors.teal, "Location"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.person, Colors.blue, "Contact"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icons, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icons,
              // semanticLabel: "Help",
              size: 29,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              // fontWeight: FontWeight.w100,
            ),
          )
        ],
      ),
    );
  }

  // Widget emojiSelect() {
  //   return EmojiPicker(
  //       rows: 4,
  //       columns: 7,
  //       onEmojiSelected: (emoji, category) {
  //         print(emoji);
  //         setState(() {
  //           _controller.text = _controller.text + emoji.emoji;
  //         });
  //       });
  // }
}