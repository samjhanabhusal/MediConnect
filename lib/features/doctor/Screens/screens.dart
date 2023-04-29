import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luveen/features/auth/screens/auth_screen.dart';
import 'package:luveen/features/doctor/Screens/doctorhome.dart';

class DoctorScreen extends StatefulWidget {
  static const String routeName = '/doctor-screen';
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.green,
        title: Text('Chat with patient'),
        actions: [
          new IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new AuthScreen()));
              }),
        ],
      ),
      body: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) => doctorhome(),
      ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       ListTile(
      //         leading: CircleAvatar(
      //           radius: 30,
      //           child: SvgPicture.asset(
      //             "assets/person.svg",
      //             color: Colors.white,
      //             height: 36,
      //             width: 36,
      //           ),
      //           backgroundColor: Colors.blueGrey,
      //         ),
      //         title: Text(
      //           'shalini',
      //           style: TextStyle(
      //             fontSize: 16,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //         subtitle: Row(
      //           children: [
      //             Icon(Icons.done_all),
      //             SizedBox(
      //               width: 3,
      //             ),
      //             Text(
      //               'hello',
      //               // doctors.currentMessage,
      //               style: TextStyle(
      //                 fontSize: 13,
      //               ),
      //             ),
      //           ],
      //         ),
      //         // trailing: Text(doctors.time),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.only(right: 20, left: 80),
      //         child: Divider(
      //           thickness: 1,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  Widget? itembuilder(contex, index) => const doctorhome();
}
