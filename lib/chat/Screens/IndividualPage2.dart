// ignore: file_names
import 'package:flutter/material.dart';
import 'package:luveen/constants/global_variables.dart';
import 'package:luveen/models/Doctor.dart';
import 'package:luveen/models/MessageModel.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';
class IndividualPage extends StatefulWidget {
   static const String routeName = '/individualPage';
  const IndividualPage({    Key? key,    required this.doctors, }) : super(key: key);
  final Doctor doctors;
  @override
  _IndividualPageState createState() => _IndividualPageState();
}
class _IndividualPageState extends State<IndividualPage> {
 
   IO.Socket ? socket;
  @override
  void initState() {
    super.initState();
    connect();
   
  }
  void connect() {
    IO.Socket socket = IO.io('$uri',
  OptionBuilder()
      .setTransports(['websocket']) // for Flutter or Dart VM
      .setExtraHeaders({'foo': 'bar'}) // optional
      .build());
    // connect();
   
  }

  

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:Text("jflsjfls")
    );
  }
}
    