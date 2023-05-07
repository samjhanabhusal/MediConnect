// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:luveen/FindBeds/General/HospitalDetails.dart';
import 'package:luveen/features/Hospital/services/hospital_services.dart';
import 'package:luveen/models/bed.dart';
import 'package:luveen/models/Hospital.dart';

class SingleH extends StatefulWidget {
  final Hospital hospital;
  // final Bed? bed;
  // final Bed? bed;
  // final List bed ;
  const SingleH({
    Key? key,
    required this.hospital,
    // required this.bed,
  }) : super(key: key);

  @override
  State<SingleH> createState() => _SingleHState();
}

class _SingleHState extends State<SingleH> {
   List<Hospital> ? hospitals;
     Bed? beds = null;

  // late List<Bed> beds;
  // late Bed  beds;
  // late Bed beds;
  // List<Bed> bedList = [];  // late Bed beds;
  final HospitalService hospitalService = HospitalService();

  @override
  void initState() {
    super.initState();
    // fetchHospitals();
    // fetchBeds();
    fetchbedybydId();
  }

  // void fetchHospitals() async {
  //   hospitals = await hospitalService.fetchAllHospitals(context);
  //   setState(() {});
  // }
  //  fetchBeds() async {
  //   beds = await hospitalService.fetchAllBedsByHospitalId(
  //     context: context,
  //     category: widget.hospital.id,
  //   );
  //   setState(() {});
  // }
  // void fetchBeds() async {
  //   beds = (await hospitalService.fetchAllBedsByHospitalId(context)).cast<Bed>();
  //   setState(() {});
  // }
  
fetchbedybydId () async{
  print(widget.hospital.id);

 beds = (await hospitalService.fetchAllBedsByHospitalId(context: context, hospitalId: widget.hospital.id)) as Bed?;
 
  setState((){});
}
  @override
  Widget build(BuildContext context) {
     return Scaffold(
    body:Text("jflsjfls")
    );}}
//     return  Padding(
//                       padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
//                       child: GestureDetector(
//                         onTap: () => Navigator.of(context).push(
//               new MaterialPageRoute(
//                 //here we are passing the values of the products to the product details page
//                 builder: (context) => new HospitalDetails(
//                  hospital_name: widget.hospital.name,
//                   // hospital_picture: beds.hospital_picture,
//                   hospital_picture: beds?.hospital_picture,
//                   beds_available: beds?.beds_available,
//                  hospital_location: beds?.hospital_location,
//                  location1: beds?.location,
//                    general_ward_total:beds?.general_ward_total,
//  general_ward_available: beds?.general_ward_available,
//   VIP_ward_total:widget.hospital.name,
//    VIP_ward_available: widget.hospital.name,
//    ICU_total:widget.hospital.name,
//     ICU_available: widget.hospital.name,
//     ventilators_total: widget.hospital.name,
//   ventilators_available: widget.hospital.name,
//                 ),
//               ),
//             ),
//                         child: Container(
//                           height: MediaQuery.of(context).size.height * 0.12,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
                           
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(12.0),
//                             child:

                                
//                                 Row(
//                                   children: [
//                                     Container(
//                                       height: 80,
//                                       width: 80,
                                      
//                                       decoration: new BoxDecoration(
//                                         border: Border.all( width: 3 ,color: Colors.green,),
                                        
//           image: new DecorationImage(
//               image: new AssetImage(""),
//               fit: BoxFit.fill,
//           )
//         )

//                                     ),
//                                     SizedBox(width: 5,),
//                                     Stack(
                                      
                                      
//                                           children: <Widget>[
                                           
//                                               Align(
//                                          alignment: Alignment.topLeft,
//                                            child:
//                                             Text(
//                                               // hospital_name,
//                                               widget.hospital.name,
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.w400,
//                                                   color: Colors.black54,
//                                                   fontStyle: FontStyle.normal,
//                                                   fontSize: 18),
//                                             ),),

                                            
                                          
//                                         SizedBox(height: 5,),
//                                        Align(
//         alignment: Alignment.centerLeft,
//         child: Row(

//                                           children: <Widget>[
                                                          
//                                             Text(
//                                               // "\ $beds_available Bed(s) available",
//                                               beds!.beds_available,
//                                               // "\  Bed(s) available",

//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.w500,
//                                                   color: Colors.green,
//                                                   fontStyle: FontStyle.italic,
//                                                   fontSize: 15),
//                                             ),
//                                              Spacer(),
//                                               Text(
                         
//                                   "Bed(s) available ",

//                           style: TextStyle(
//                               fontWeight: FontWeight.w500,
//                               color: Colors.green,
//                               fontSize: 15),
//                         ),
                            

                                           
//                                           ],
//                                         ),),
                                      
//                                         SizedBox(height: 5,),
//                                         Align(
//         alignment: Alignment.bottomRight,
        
                                          
                                          
                                         

//                                            child: Text(
//                                               // hospital_location,
//                                               // widget.bed!.hospital_location,
//                                               beds!.hospital_location,
//                                               // orderData.totalPrice.toString(),
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.w500,
//                                                   color: Colors.green,
//                                                   fontStyle: FontStyle.italic,
//                                                   fontSize: 14),
//                                             )
//                                             // ],
//                                             // ),
                                          
//                                         )
//                                       ],
//                                     ),
//                                   ],
//                                 ),
                               
                              
                            
                          
//                         ),
//                       ),
//                     ));
//   }}