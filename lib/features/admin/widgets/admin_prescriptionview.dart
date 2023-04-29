// import 'dart:convert';
// import 'package:luveen/features/home/screens/prescriptionView.dart';
// import 'package:luveen/features/home/widgets/single_prescription.dart';
// import 'package:luveen/features/home/widgets/pickImage.dart';
// import 'package:luveen/models/Pres.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';
// import 'package:luveen/features/home/services/home_services.dart';
// import 'package:luveen/common/widgets/loader.dart';

// import '../../../providers/user_provider.dart';

// // class PrescriptionScreen extends StatefulWidget {
// //   static const String routeName = '/prescription';
// //   const PrescriptionScreen({Key? key}) : super(key: key);

// //   @override
// //   State<PrescriptionScreen> createState() => _PrescriptionScreenState();
// // }

// // class _PrescriptionScreenState extends State<PrescriptionScreen> {
// //   List<Pres>? prescriptions;
// //   final HomeServices homeServices = HomeServices();

// //   @override
// //   void initState() {
// //     super.initState();
// //     fetchAllPrescription();
// //   }

// //   fetchAllPrescription() async {
// //     prescriptions = await homeServices.fetchAllPrescription(context);
// //     setState(() {});
// //   }

// //   void deletePrescription(Pres prescription, int index) {
// //     homeServices.deletePrescription(
// //       context: context,
// //       prescription: prescription,
// //       onSuccess: () {
// //         prescriptions!.removeAt(index);
// //         setState(() {});
// //       },
// //     );
// //   }

// //   void navigateToAddPrescription() {
// //     Navigator.pushNamed(context, PickImage.routeName);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //         // final user = context.watch<UserProvider>().user;
// //         //  user.prescription
// //         // // .map((e) => sum += e['quantity'] * e['product']['price'] as int)
// //         // .toList();

// //     return prescriptions == null
// //         ? const Loader()
// //         : Scaffold(
// //             body: GridView.builder(
// //               itemCount: prescriptions!.length,
// //                             // itemCount: user.prescription.length,

// //               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// //                   crossAxisCount: 1),
// //               itemBuilder: (context, index) {
// //                 final prescriptionData = prescriptions![index];
// //                 return Column(
// //                   children: [
// //                     SizedBox(
// //                       height: 140,
// //                       child: SinglePrescription(
// //                         image: prescriptionData.presimages[0],
// //                       ),
// //                     ),
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                       children: [
// //                         Expanded(
// //                           child: Text(
// //                             prescriptionData.name,
// //                             overflow: TextOverflow.ellipsis,
// //                             maxLines: 2,
// //                           ),
// //                         ),
// //                         IconButton(
// //                           onPressed: () =>
// //                               deletePrescription(prescriptionData, index),
// //                           icon: const Icon(
// //                             Icons.delete_outline,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ],
// //                 );
// //               },
// //             ),
// //             floatingActionButton: FloatingActionButton(
// //               child: const Icon(Icons.add),
// //               onPressed: navigateToAddPrescription,
// //               tooltip: 'Add a Prescription',
// //             ),
// //             floatingActionButtonLocation:
// //                 FloatingActionButtonLocation.centerFloat,
// //           );
// //   }
// // }

// // iloader.dart';

// class PrescriptionScreen extends StatefulWidget {
//   static const String routeName = '/prescription';
//   const PrescriptionScreen({Key? key}) : super(key: key);

//   @override
//   State<PrescriptionScreen> createState() => _PrescriptionScreenState();
// }

// class _PrescriptionScreenState extends State<PrescriptionScreen> {
//   List<Pres>? prescriptions;
//   final HomeServices homeServices = HomeServices();

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   fetchAllPrescription();
//   // }

//   // fetchAllPrescription() async {
//   //   prescriptions = await homeServices.fetchAllPrescription(context);
//   //   setState(() {});
//   // }

//   @override
//   void initState() {
//     super.initState();
//     fetchMyPrescriptions();
//   }

//   void fetchMyPrescriptions() async {
//     prescriptions = await homeServices.fetchMyPrescription(context: context);
//     setState(() {});
//   }

//   void deletePrescription(Pres prescription, int index) {
//     homeServices.deletePrescription(
//       context: context,
//       prescription: prescription,
//       onSuccess: () {
//         prescriptions!.removeAt(index);
//         setState(() {});
//       },
//     );
//   }

//   void navigateToAddPrescription() {
//     Navigator.pushNamed(context, PickImage.routeName);
//   }

//   @override
//   Widget build(BuildContext context) {
//     //  final user = context.watch<UserProvider>().user;
// //  int sum = 0;
//     // var prescriptions =  user.prescription
//     // .map((e) => sum += e['quantity'] * e['product']['price'] as int)
//     // .toList();
//     return prescriptions == null
//         ? const Loader()
//         : Scaffold(
//             backgroundColor: Colors.grey.shade100,
//             body: ListView.builder(
//               itemCount: prescriptions!.length,
//               itemBuilder: (context, index) {
//                 final prescriptionData = prescriptions![index];
//                 return Padding(
//                     padding: const EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 0),
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const PrescriptionView()),
//                         );
//                       },
//                       //  Navigator.pushNamed(
//                       //         context, PrescriptionView.routeName,
//                       //         // arguments: orders![index],);
//                       //         arguments: prescriptionData);
//                       //   },
//                       child: new Container(
//                         height: MediaQuery.of(context).size.height * 0.15,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                         ),
//                         child: Row(
//                           children: [
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height * 0.12,
//                               width: MediaQuery.of(context).size.height * 0.12,
//                               child: SinglePrescription(
//                                 image: prescriptionData.presimages[0],
//                                 // image: prescription![index].prescription[0].image[0]

//                               ),
//                             ),
//                             Container(
//                               // width: MediaQuery.of(context).size.height * 0.65,
//                               // child: Padding(
//                               //   padding: const EdgeInsets.all(20.0),
//                               child: Expanded(
//                                 child: Text(
//                                   prescriptionData.name,
//                                   overflow: TextOverflow.ellipsis,
//                                   maxLines: 2,
//                                 ),
//                               ),

//                               // IconButton(
//                               //   onPressed: () => deletePrescription(
//                               //       prescriptionData, index),
//                               //   icon: const Icon(
//                               //     Icons.delete_outline,
//                               //   ),
//                               // ),
//                             ),
//                             IconButton(
//                               icon: Icon(Icons.chat),
//                               onPressed: () {
//                                 print("Welcome to the Chat Box");
//                               },
//                             ),
//                             SizedBox(
//                               width: 15,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(right: 20.0),
//                               child: Container(
//                                 color: Colors.grey.shade300,
//                                 child: IconButton(
//                                   onPressed: () => deletePrescription(
//                                       prescriptionData, index),
//                                   icon: const Icon(
//                                     Icons.delete_outline,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ));
//               },
//             ),
//             floatingActionButton: FloatingActionButton(
//               child: const Icon(Icons.add),
//               onPressed: navigateToAddPrescription,
//               tooltip: 'Add a Prescription',
//             ),
//             floatingActionButtonLocation:
//                 FloatingActionButtonLocation.centerFloat,
//           );
//   }
// }
