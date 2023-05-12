// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:luveen/common/widgets/custom_button.dart';
// import 'package:luveen/common/widgets/custom_textfield.dart';
// import 'package:luveen/features/auth/screens/auth_screen.dart';
// import 'package:luveen/features/auth/services/auth_service.dart';
// import 'package:luveen/features/Hospital/Admin/Screens/RegistrationDetails.dart';

// class HospitalRegister extends StatefulWidget {
//   const HospitalRegister({Key? key}) : super(key: key);

//   @override
//   State<HospitalRegister> createState() => _HospitalRegisterState();
// }

// class _HospitalRegisterState extends State<HospitalRegister> {
//    final AuthService authService = AuthService();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _nameController = TextEditingController();
//   final _registeHospitalFormKey = GlobalKey<FormState>();



//   @override
//   void dispose() {
//     super.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _nameController.dispose();
  
//   }
//   void signUpDoctor() {
//     authService.signUpHospital(
//         context: context,
//         email: _emailController.text,
//         password: _passwordController.text,
//         name: _nameController.text, confirmpassword: '', phone: '');
       
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(70.0), // here the desired height
//         child: AppBar(
//           title: new Padding(
//             padding: const EdgeInsets.only(left: 200.0),
//             child: new Text(
//               "Luveen",
//               style: TextStyle(
//                   fontStyle: FontStyle.normal,
//                   fontSize: 30.0,
//                   color: Colors.white),
//             ),
//           ),
//           automaticallyImplyLeading: true,
//         ),
//       ),
//       body: Container(
//         child: SingleChildScrollView(
//           // child: Padding(
//               padding: const EdgeInsets.fromLTRB(25.0, 35.0, 25.0, 25.0),
//              child: Form(
//                 key: _registeHospitalFormKey,

//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Text(
//                   //   "Enter your Name:",
//                   //   style: TextStyle(
//                   //       fontStyle: FontStyle.normal,
//                   //       fontSize: 20,
//                   //       color: Colors.black54),
//                   // ),
//                   // const SizedBox(height: 5),
//                   Padding(
//                     padding: const EdgeInsets.all(0.0),
//                     child: SizedBox(
//                       child: TextField(
//                         controller: _nameController,
//                         obscureText: false,
//                         decoration: InputDecoration(
//                           labelText: "Enter your Name",
//                           border: OutlineInputBorder(),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Padding(
//                     padding: const EdgeInsets.all(0.0),
//                     child: SizedBox(
//                       child: TextField(
//                         controller: _emailController,
//                         obscureText: false,
//                         decoration: InputDecoration(
//                           labelText: "Enter your Email",
//                           border: OutlineInputBorder(),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Padding(
//                     padding: const EdgeInsets.all(0.0),
//                     child: SizedBox(
//                       child: TextField(
//                         controller: _passwordController,
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           labelText: "Enter your Password",
//                           border: OutlineInputBorder(),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   CustomButton(
//                       text: 'Done',
//                       onTap: () {

//                        if (_registeHospitalFormKey.currentState!.validate()) {
//                               signUpDoctor();
//                             }

//                         // Navigator.push(
//                         //   context,
//                         //   MaterialPageRoute(builder: (context) => AuthScreen()),
//                         // );
//                       })
//                 ],
//               )),
//         ),
//       ),
//     );
//   }
// }