// import 'package:flutter/material.dart';
// class LandingPage extends StatefulWidget {
//   const LandingPage({ Key? key }) : super(key: key);

//   @override
//   _LandingPageState createState() => _LandingPageState();
// }

// class _LandingPageState extends State<LandingPage> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
     
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: Padding(
//           padding: const EdgeInsets.fromLTRB(25.0, 70.0, 25.0, 25.0),
//           child: Column(
            
            
//             children: [
//                Container(
//                   height: 150,
//                   width: 150,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage( 'assets/Logo.png'),
//                       fit: BoxFit.fill,
//                     ),
//                     color: Colors.green.shade500,
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(80),
//                     ),
//                   ),
//                 ),
  
              
//                const SizedBox(
//                 height: 20
//             ,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(0.0),
//                 child: SizedBox(
//                   width: 350,
//                   height: 45,
//                   child: 
//                   TextField(  
//                       obscureText: false,  
//                       decoration: InputDecoration(  
//                         border: OutlineInputBorder(),  
//                         labelText: 'Email Address',  
//                         hintText: 'Enter your email address',  
//                       ),  
//                     ), ),),
//               const SizedBox(
//                 height: 15
//             ,
//               ),
//                    Padding(
//                 padding: const EdgeInsets.all(0.0),
//                 child: SizedBox(
//                   width: 350,
//                   height: 45,
//                   child: 
//                   TextField(  
//                       obscureText: true,  
//                       decoration: InputDecoration(  
//                         border: OutlineInputBorder(),  
//                         labelText: 'Password',  
//                         hintText: 'Enter your password',  
//                       ),  
//                     ), ),),
//               const SizedBox(
//                 height: 5
//             ,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(6.0),
//                 child: SizedBox(
//                   width: 350,
//                   height: 40,
//                   child: ElevatedButton.icon(
//                       icon: FaIcon(
//                         FontAwesomeIcons.user,
//                         color: Colors.white,
//                       ),
//                       style: ElevatedButton.styleFrom(
//                           primary: Colors.green.shade500,
//                           onPrimary: Colors.white,
//                           minimumSize: Size(double.infinity, 50)),
//                       onPressed: () {
//                        Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => NavBar()),
//   );
//                       },
//                       label: const Text("Login:")),
//                 ),
//               ),
              
//               TextButton(
//               style: TextButton.styleFrom(
//                 textStyle: const TextStyle(fontSize:14,color: Color.fromRGBO(100, 181, 246, 1),decoration: TextDecoration.underline,),
//               ),
//               onPressed: () {
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => ForgotPassword()),
//   );
// },
//               child: const Text('Forgot password?'),
//             ),
//               SizedBox(
//                 height: 30
//             ,
//               ),
              
//               Padding(
//                 padding: const EdgeInsets.all(0.0),
//                 child: const Text('Don\'t have an account yet?',
//                     style: TextStyle(color: Colors.black,fontSize: 14.0,decoration: TextDecoration.underline,)),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(0.0),
//                 child: TextButton(
//                 style: TextButton.styleFrom(
//                   textStyle: const TextStyle(fontSize:14,color: Color.fromRGBO(100, 181, 246, 1),decoration: TextDecoration.underline,),
//                 ),
//                 onPressed: () {
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => RegisterPage()),
//   );
// },
//                 child: const Text('Register here.'),
//             ),
//               ),
//               SizedBox(
//                 height: 30
//             ,
//               ),
              
//              Row(
//     children: <Widget>[
//         Expanded(
//             child: Divider(color: Colors.black,height: 36,)
//         ),       

//         Text(" OR "),        

//         Expanded(
//             child: Divider(color: Colors.black,height: 36,)
//         ),
//     ]
// ),
//  SizedBox(
//                 height: 15
//             ,
//               ),
             

//                Padding(
//                 padding: const EdgeInsets.all(6.0),
//                 child: SizedBox(
//                   width: 210,
//                   height: 40,
//                   child: ElevatedButton.icon(
//                       icon: FaIcon(
//                         FontAwesomeIcons.google,
//                         color: Colors.white,
//                       ),
//                       style: ElevatedButton.styleFrom(
//                           primary: Colors.green.shade500,
//                           onPrimary: Colors.white,
//                           minimumSize: Size(double.infinity, 50)),
//                       onPressed: () {
                       
//                       },
//                       label: const Text("Signup with Google")),
//                 ),
//               ), 
//               Padding(
//                 padding: const EdgeInsets.all(6.0),
//                 child: SizedBox(
//                   width: 210,
//                   height: 40,
//                   child: ElevatedButton.icon(
//                       icon: FaIcon(
//                         FontAwesomeIcons.user,
//                         color: Colors.white,
//                       ),
//                       style: ElevatedButton.styleFrom(
//                           primary: Colors.green.shade500,
//                           onPrimary: Colors.white,
//                           minimumSize: Size(double.infinity, 50)),
//                       onPressed: () {
                       
//                       },
//                       label: const Text("Continue with Google")),
//                 ),
//               ), 
            
              
              
              
              
//             ],
//           ),
//         ),
//       ),
//     );
    
//   }
// }
