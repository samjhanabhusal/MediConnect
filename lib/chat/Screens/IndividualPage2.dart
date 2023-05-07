// ignore: file_names
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:luveen/constants/global_variables.dart';
import 'package:luveen/models/Doctor.dart';
import 'package:luveen/models/MessageModel.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
// import 'package:socket_io_client/socket_io_client.dart';
// import 'package:socket_io_client/socket_io_client.dart';
class IndividualPage extends StatefulWidget {
   static const String routeName = '/individualPage';
  const IndividualPage({    Key? key,    required this.doctors, }) : super(key: key);
  final Doctor doctors;
  @override
  _IndividualPageState createState() => _IndividualPageState();
}
class _IndividualPageState extends State<IndividualPage> {
 late IO.Socket socket;
  //  IO.Socket ? socket;
  // final IO.Socket _socket =  IO.io('$uri');

  // _connectSockety(){
  //   _socket.onConnect((data) => print("connection Established"));
  //   _socket.onConnectError((data) => print(data));

  // }
  @override
  void initState() {
    super.initState();
   lasttry();
    // _/connectSockety();
    // connect();
    // checkConnect();
   
  }


void lasttry(){
   socket = IO.io('http://localhost:3000', <String, dynamic>{
  'transports': ['websocket'],
  'autoConnect': false,
});
socket.connect();
socket.on('eventName', (data) {
  // Handle the data received from the server
  print(data);
});
}





  void checkConnect(){
    IO.Socket socket = IO.io('$uri', IO.OptionBuilder().setTransports(['websocket']).build());
  socket.onConnect((_) {
    print('connect');
    socket.emit('msg', 'test');
  });
  socket.on('event', (data) => print(data));
  socket.onDisconnect((_) => print('disconnect'));
  socket.on('fromServer', (_) => print(_));
  }
  //  void checkConnect() {
//   void checkConnect() {
//   WebSocket.connect('ws://$uri', protocols: ['websocket']).then((socket) {
//     // Use the socket
//     socket.add('Hello, server!');
//     socket.listen((message) {
//       print('Received message: $message');
//     });

//     // Add an onOpen callback
//    socket.done.then((_) {
//       print('WebSocket connection is open!');
//     }).catchError((error) {
//       print('Error: $error');
//     });
//   });
// }

// }

//   }
  void connect() {
//    Socket socket = io('$uri', 
//     OptionBuilder()
//       .setTransports(['websocket']) // for Flutter or Dart VM
//       .disableAutoConnect()  // disable auto-connection
//       .setExtraHeaders({'foo': 'bar'}) // optional
//       .build()
//   );
// socket.connect();
// print(socket.connected);
// socket.onConnectError((data) => print(data));
 IO.Socket socket = IO.io('$uri');
  socket.onConnect((_) {
    print('connect');
    socket.emit('msg', 'test');
  });
  socket.connect();
print(socket.connected);
socket.onConnectError((data) => print(data));
  socket.on('event', (data) => print(data));
  socket.onDisconnect((_) => print('disconnect'));
  socket.on('fromServer', (_) => print(_));

  }

  

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:Text("jflsjfls")
    );
  }
}
    