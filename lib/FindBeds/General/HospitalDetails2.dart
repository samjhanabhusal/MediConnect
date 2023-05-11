// import 'package:flutter/material.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';
// class HospitalDetails extends StatefulWidget {
//   final hospital_name;
//   final hospital_picture;
//   final beds_available;
//   final hospital_location;
//   final location1;
//   final general_ward_total;
//   final    general_ward_available;
//     final  VIP_ward_total;
//      final VIP_ward_available;
//     final  ICU_total;
//     final  ICU_available;
//      final ventilators_total;
//      final ventilators_available;

//   HospitalDetails({
//     this.hospital_name,
//     this.hospital_picture,
//     this.beds_available,
//     this.hospital_location,
//     this.location1,
//      this.general_ward_total,
//   this.general_ward_available,
//    this.VIP_ward_total,
//     this.VIP_ward_available,
//    this.ICU_total,
//     this.ICU_available,
//     this.ventilators_total,
//    this.ventilators_available,
//   });
//   // const HospitalDetails({super.key});

//   @override
//   State<HospitalDetails> createState() => _HospitalDetailsState();
// }

// class _HospitalDetailsState extends State<HospitalDetails> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: new AppBar(
//         backgroundColor: Colors.green,
//         title: Align(
//                 alignment: Alignment.bottomRight,
//                 child: Text(
//                   "Hospital Details",
//                   style: TextStyle(
//                   fontSize: 22.0,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold),
//                 ),
                
//               ),
//         actions: <Widget>[
//           // new IconButton(
//           //     icon: Icon(
//           //       Icons.search,
//           //       color: Colors.white,
//           //     ),
//           //     onPressed: () {}),
//           // new IconButton(
//           //     icon: Icon(
//           //       Icons.shopping_cart,
//           //       color: Colors.white,
//           //     ),
//           //     onPressed: () {}),
//         ],
//       ),
//       body: new ListView(
//         children: <Widget>[
          
//           new Container(
//             height: 300,
//             child: GridTile(
//               child: Container(
//                 color: Colors.white,
//                 child: Image.asset(widget.hospital_picture),
//               ),
              
             
//             ),
//           ),
//           Center(
//             child: Text( widget.hospital_name, style: TextStyle(
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.green,
//                                 fontSize: 24),),
//           ),
//                               SizedBox(height:10,),
//           Container(
//                   decoration: BoxDecoration(
//                       color: Colors.grey.shade100,
//                       borderRadius: BorderRadius.circular(15.0)),
//                   child: Padding(
//                     padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
//                     child: Column(children: [
//                       Row(
//                       children: <Widget>[
//                         // Row(
//                         //   children: <Widget>[
//                         Text(
//                           "Hospital Name:",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w400,
//                               color: Colors.black54,
//                               fontSize: 18),
//                         ),
//                         Spacer(),
//                         Text(
//                           // "9801357010",
//                           // profileinfo![0].phoneno,
//                           widget.hospital_name,

//                           style: TextStyle(
//                               fontWeight: FontWeight.w400,
//                               color: Colors.black54,
//                               fontSize: 18),
//                         )
//                         // ],
//                         // ),
//                       ],
//                     ),
//                     SizedBox(height: 4,),
//                     Row(
//                       children: <Widget>[
//                         // Row(
//                         //   children: <Widget>[
//                         Text(
//                           "Location:",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w400,
//                               color: Colors.black54,
//                               fontSize: 18),
//                         ),
//                         Spacer(),
//                         Text(
//                           // "9801357010",
//                           // profileinfo![0].phoneno,
//                          widget.location1,

//                           style: TextStyle(
//                               fontWeight: FontWeight.w400,
//                               color: Colors.black54,
//                               fontSize: 18),
//                         )
//                         // ],
//                         // ),
//                       ],
//                     ),
//                      SizedBox(height: 25,),
//                      Row(
//                       children: <Widget>[
//                         // Row(
//                         //   children: <Widget>[
//                         Text(
//                           "Available Beds:",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w500,
//                               color: Colors.green ,
//                               fontStyle: FontStyle.italic,
//                               fontSize: 18),
//                         ),
                       
//                         // ],
//                         // ),
//                       ],
//                     ),
//                      SizedBox(height: 6,),
//                     Row(
//                       children: <Widget>[
//                         // Row(
//                         //   children: <Widget>[
//                         Text(
//                           "General Ward Beds:",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w400,
//                               color: Colors.black54,
//                               fontSize: 18,
//                               ),
//                         ),
//                         Spacer(),
//                         Text(
//                           // "9801357010",
//                           // profileinfo![0].phoneno,
//                           "${widget.general_ward_available}/${widget.general_ward_total}",

//                           style: TextStyle(
//                               fontWeight: FontWeight.w400,
//                               color: Colors.black54,
//                               fontSize: 18),
//                         )
//                         // ],
//                         // ),
//                       ],
//                     ),
//                     SizedBox(height: 6,),
//                     Row(
//                       children: <Widget>[
//                         // Row(
//                         //   children: <Widget>[
//                         Text(
//                           "VIP Ward beds:",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w400,
//                               color: Colors.black54,
//                               fontSize: 18),
//                         ),
//                         Spacer(),
//                         Text(
//                           // "9801357010",
//                           // profileinfo![0].phoneno,
//                           "${widget.beds_available}/${widget.VIP_ward_total}",

//                           style: TextStyle(
//                               fontWeight: FontWeight.w400,
//                               color: Colors.black54,
//                               fontSize: 18),
//                         )
//                         // ],
//                         // ),
//                       ],
//                     ),
//                     SizedBox(height: 6,),
//                     Row(
//                       children: <Widget>[
//                         // Row(
//                         //   children: <Widget>[
//                         Text(
//                           "ICU:",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w400,
//                               color: Colors.black54,
//                               fontSize: 18),
//                         ),
//                         Spacer(),
//                         Text(
//                           // "9801357010",
//                           // profileinfo![0].phoneno,
//                           "${widget.ICU_available}/${widget.ICU_total}",

//                           style: TextStyle(
//                               fontWeight: FontWeight.w400,
//                               color: Colors.black54,
//                               fontSize: 18),
//                         )
//                         // ],
//                         // ),
//                       ],
//                     ),
//                     SizedBox(height: 6,),
//                     Row(
//                       children: <Widget>[
//                         // Row(
//                         //   children: <Widget>[
//                         Text(
//                           "Ventilators:",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w400,
//                               color: Colors.black54,
//                               fontSize: 18),
//                         ),
//                         Spacer(),
//                         Text(
//                           // "9801357010",
//                           // profileinfo![0].phoneno,
//                         "${widget.ventilators_available}/${widget.ventilators_total}",

//                           style: TextStyle(
//                               fontWeight: FontWeight.w400,
//                               color: Colors.black54,
//                               fontSize: 18),
//                         )
//                         // ],
//                         // ),
//                       ],
//                     ),
                   
                   
//                      SizedBox(height: 25,),
//                     Row(
//                       children: <Widget>[
//                         // Row(
//                         //   children: <Widget>[
//                         Text(
//                           "Contact:",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w400,
//                               color: Colors.black54,
//                               fontSize: 18),
//                         ),
//                         Spacer(),
//                         Text(
//                           // "9801357010",
//                           // profileinfo![0].phoneno,
//                           "065-45675, 9845129266",

//                           style: TextStyle(
//                               fontWeight: FontWeight.w400,
//                               color: Colors.black54,
//                               fontSize: 18),
//                         )
//                         // ],
//                         // ),
//                       ],
//                     ),
//                      SizedBox(height: 4,),
//                     Row(
//                       children: <Widget>[
//                         // Row(
//                         //   children: <Widget>[
//                         Text(
//                           "",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w400,
//                               color: Colors.black54,
//                               fontSize: 18),
//                         ),
//                         Spacer(),
//                         AnimatedTextKit(
//                     totalRepeatCount: 4000000,
//                     animatedTexts: [
//                       TyperAnimatedText(
//                         'Book Here!',
//                         // duration: Duration(milliseconds: 3000),
//                         textStyle: const TextStyle(
//                             fontStyle: FontStyle.italic,fontSize: 18,color: Colors.green),
//                       ),
                    
//                     ],
//                   ),
//                         // ],
//                         // ),
//                       ],
//                     ),
//                     ])
//                   )),
//          ])
//     );
//   }
// }
       
