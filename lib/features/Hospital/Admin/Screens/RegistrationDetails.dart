// import 'dart:io';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:luveen/constants/utils.dart';
// import 'package:luveen/features/Hospital/Admin/Screens/IndividualHospital.dart';
// import 'package:luveen/features/Hospital/Admin/Screens/MyCustomCheckbox.dart';
// import 'package:luveen/features/Hospital/Admin/Services/hospital_admin_services.dart';
// import 'package:luveen/providers/user_provider.dart';
// import 'package:provider/provider.dart';

// class HospitalRegistrationDetails extends StatefulWidget {
//   // final String email;
//   // final String name;
//   // final String phone;
//   // final String password;
//   // final String confirmpassword;
//    static const String routeName = '/bed-info';
//   HospitalRegistrationDetails(
//       {Key? key, 
//      })
//       : super(key: key);

//   @override
//   State<HospitalRegistrationDetails> createState() =>
//       _HospitalRegistrationDetailsState();
// }

// class _HospitalRegistrationDetailsState extends State<HospitalRegistrationDetails> {
//    final TextEditingController beds_availableController = TextEditingController();
//     final TextEditingController hospital_locationController= TextEditingController();
//     final TextEditingController locationController= TextEditingController();
//     final TextEditingController general_ward_availableController= TextEditingController();
//     final TextEditingController general_ward_totalController= TextEditingController();
//     final TextEditingController VIP_ward_availableController =TextEditingController();
//     final TextEditingController VIP_ward_totalController= TextEditingController();
//     final TextEditingController ICU_availableController= TextEditingController();
//     final TextEditingController ICU_totalController= TextEditingController();
//     final TextEditingController ventilators_totalController= TextEditingController();
//     final TextEditingController ventilators_availableController= TextEditingController();


// bool showGeneralWard = false;
//   bool showVipWard = false;
//   bool showIcu = false;
//   bool showVentilator = false;


//     final HospitalAdminServices hospitaladminServices = HospitalAdminServices();


//      List<File> hospital_picture = [];
//   final _addBedFormKey = GlobalKey<FormState>();

//   @override
//   void dispose() {
//     super.dispose();
//     beds_availableController.dispose();
//     hospital_locationController.dispose();
//     locationController.dispose();
//     general_ward_availableController.dispose();
//     general_ward_totalController.dispose();
//     VIP_ward_availableController.dispose();
//     VIP_ward_totalController.dispose();
//     ICU_availableController.dispose();
//     ICU_totalController.dispose();
//     ventilators_availableController.dispose();
//     ventilators_totalController.dispose();
   
//   }
// void AddBed() {
//     if (_addBedFormKey.currentState!.validate() && hospital_picture.isNotEmpty) {
//       // hospitaladminServices.AddBed(context: context, hospital_picture: hospital_picture, beds_available: beds_available, hospital_location: hospital_location, location: location, general_ward_total: general_ward_total, general_ward_available: general_ward_available, VIP_ward_total: VIP_ward_total, VIP_ward_available: VIP_ward_available, ICU_total: ICU_total, ICU_available: ICU_available, ventilators_total: ventilators_total, ventilators_available: ventilators_available, name: name, description: description, price: price, quantity: quantity, category: category, images: images)
//       hospitaladminServices.AddBed(
//         context: context,
//         hospital_picture: hospital_picture,
//     beds_available:beds_availableController.text,
//     hospital_location: hospital_locationController.text,
//     location: locationController.text,
//     general_ward_total:general_ward_totalController.text,
//     general_ward_available:general_ward_availableController.text,
//     VIP_ward_total:VIP_ward_totalController.text,
//     VIP_ward_available:VIP_ward_availableController.text,
//     ICU_total:ICU_totalController.text,
//     ICU_available:ICU_availableController.text,
//     ventilators_total:ventilators_totalController.text,
//     ventilators_available:ventilators_availableController.text,

//       );
//     }
//   }
//    void selectImages() async {
//     var res = await pickImages();
//     setState(() {
//       hospital_picture = res;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final userProvider = Provider.of<UserProvider>(context);
//  final name = userProvider.user.name;
//     final email = userProvider.user.email;
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(50),
//         child: AppBar(
//           flexibleSpace: Container(
//             decoration: const BoxDecoration(
//                 // gradient: GlobalVariables.appBarGradient,
//                 ),
//           ),
//           title: const Text(
//             'Add Bed Information',
//             style: TextStyle(
//               color: Colors.black,
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Form(
//           key: _addBedFormKey,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10.0),
//             child: Column(
//               children: [
//                 const SizedBox(height: 20),
//                 hospital_picture.isNotEmpty
//                     ? CarouselSlider(
//                         items: hospital_picture.map(
//                           (i) {
//                             return Builder(
//                               builder: (BuildContext context) => Image.file(
//                                 i,
//                                 fit: BoxFit.cover,
//                                 height: 200,
//                               ),
//                             );
//                           },
//                         ).toList(),
//                         options: CarouselOptions(
//                           viewportFraction: 1,
//                           height: 200,
//                         ),
//                       )
//                     : GestureDetector(
//                         onTap: selectImages,
//                         child: DottedBorder(
//                           borderType: BorderType.RRect,
//                           radius: const Radius.circular(10),
//                           dashPattern: const [10, 4],
//                           strokeCap: StrokeCap.round,
//                           child: Container(
//                             width: double.infinity,
//                             height: 150,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 const Icon(
//                                   Icons.folder_open,
//                                   size: 40,
//                                 ),
//                                 const SizedBox(height: 15),
//                                 Text(
//                                   'Select Hospital Picture',
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                     color: Colors.grey.shade400,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                 const SizedBox(height: 30),
//                 TextField(
//                   // controller: _nameController,
//                   obscureText: false,
//                   decoration: InputDecoration(
//                     // labelText: "Hospital Name",
//                     labelText: name,
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 TextField(
//                   // controller: _nameController,
//                   obscureText: false,
//                   decoration: InputDecoration(
//                     // labelText: "Hospital Location",
//                     labelText: email,
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Container(
//                     decoration: BoxDecoration(
//                         color: Colors.grey.shade100,
//                         borderRadius: BorderRadius.circular(15.0)),
//                     child: Padding(
//                         padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
//                         child: Column(children: [
//                           Row(
//                             children: <Widget>[
//                               // Row(
//                               //   children: <Widget>[
//                               Text(
//                                 "Select Categories:",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.green,
//                                     fontStyle: FontStyle.normal,
//                                     fontSize: 20),
//                               ),

//                               // ],
//                               // ),
//                             ],
//                           ),
//                           Container(
//                               child: SingleChildScrollView(child: CheckBoxes()))
//                         ]))),
//                 ElevatedButton(
//                   onPressed: () => Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => const IndividualHospital())),
//                   child: const Text('Done'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
