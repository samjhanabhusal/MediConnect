import 'package:flutter/material.dart';
import 'package:luveen/FindBeds/General/HospitalDetails.dart';
import 'package:luveen/FindBeds/VIP/single_hospital.dart';
import 'package:luveen/FindBeds/single_hospital2.dart';
import 'package:luveen/features/Hospital/services/hospital_services.dart';
import 'package:luveen/models/Hospital.dart';
import 'package:luveen/models/bed.dart';
 class VIPBeds extends StatefulWidget {
  const VIPBeds({Key?key}):super(key:key);

  @override
  State<VIPBeds> createState() => _VIPBedsState();
}

class _VIPBedsState extends State<VIPBeds> {
  List<Hospital> ? hospitals;
  // List<Bed>? beds;
  final HospitalService hospitalService = HospitalService();

  @override
  void initState() {
    super.initState();
    fetchHospitals();
    // fetchBeds();
  }

  void fetchHospitals() async {
    hospitals = await hospitalService.fetchAllHospitals(context);
    setState(() {});
  }
  // void fetchBeds() async {
  //   beds = await hospitalService.fetchAllBeds(context);
  //   setState(() {});
  // }

    
  @override
  Widget build(BuildContext context) {
    return
  
        Column(
            children: [
              Container(
                height: 720,
                color: Colors.grey.shade100,
                padding: const EdgeInsets.only(
                  left: 5,
                  top: 5,
                  right: 5,
                  
                ),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  // itemCount: hospital_list.length,
                  itemCount: hospitals?.length??0,
                  itemBuilder: (BuildContext context, int index) {
                   final hospitalData = hospitals![index];
                  //  final bedData = hospitals![index].bedd;
                  

                  
                    return 
                    Single_hospital(
                      hospital: hospitalData
                      // bed : bedData
           
      
          );
                    
                  },
                  
                ),
              ),
            ],
          );
          
  }
}



// class Single_hospital extends StatelessWidget {
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

//   Single_hospital({
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

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//     body:Text("jflsjfls")
//     );}}
//     // return  Padding(
//     //                   padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0)
    
// //                       child: GestureDetector(
// //                         onTap: () => Navigator.of(context).push(
// //               new MaterialPageRoute(
// //                 //here we are passing the values of the products to the product details page
// //                 builder: (context) => new HospitalDetails(
// //                  hospital_name: hospital_name,
// //                   hospital_picture: hospital_picture,
// //                   beds_available:beds_available,
// //                  hospital_location: hospital_location,
// //                  location1: location1,
// //                    general_ward_total:general_ward_total,
// //  general_ward_available: general_ward_available,
// //   VIP_ward_total:VIP_ward_total,
// //    VIP_ward_available: VIP_ward_available,
// //    ICU_total:ICU_total,
// //     ICU_available: ICU_available,
// //     ventilators_total: ventilators_total,
// //   ventilators_available:  ventilators_available,
// //                 ),
// //               ),
// //             ),
// //                         child: Container(
// //                           height: MediaQuery.of(context).size.height * 0.12,
// //                           decoration: BoxDecoration(
// //                             color: Colors.white,
                           
// //                           ),
// //                           child: Padding(
// //                             padding: const EdgeInsets.all(12.0),
// //                             child:

                                
// //                                 Row(
// //                                   children: [
// //                                     Container(
// //                                       height: 80,
// //                                       width: 80,
                                      
// //                                       decoration: new BoxDecoration(
// //                                         border: Border.all( width: 3 ,color: Colors.green,),
                                        
// //           image: new DecorationImage(
// //               image: new AssetImage(hospital_picture),
// //               fit: BoxFit.fill,
// //           )
// //         )

// //                                     ),
// //                                     SizedBox(width: 5,),
// //                                     Stack(
                                      
                                      
// //                                           children: <Widget>[
                                           
// //                                               Align(
// //                                          alignment: Alignment.topLeft,
// //                                            child:
// //                                             Text(
// //                                               hospital_name,
// //                                               style: TextStyle(
// //                                                   fontWeight: FontWeight.w400,
// //                                                   color: Colors.black54,
// //                                                   fontStyle: FontStyle.normal,
// //                                                   fontSize: 18),
// //                                             ),),

                                            
                                          
// //                                         SizedBox(height: 5,),
// //                                        Align(
// //         alignment: Alignment.centerLeft,
// //         child: Row(

// //                                           children: <Widget>[
                                            
// //                                             Text(
// //                                               "\ $beds_available Bed(s) available",
// //                                               style: TextStyle(
// //                                                   fontWeight: FontWeight.w500,
// //                                                   color: Colors.green,
// //                                                   fontStyle: FontStyle.italic,
// //                                                   fontSize: 15),
// //                                             ),

                                           
// //                                           ],
// //                                         ),),
                                      
// //                                         SizedBox(height: 5,),
// //                                         Align(
// //         alignment: Alignment.bottomRight,
        
                                          
                                          
                                         

// //                                            child: Text(
// //                                               hospital_location,
// //                                               // orderData.totalPrice.toString(),
// //                                               style: TextStyle(
// //                                                   fontWeight: FontWeight.w500,
// //                                                   color: Colors.green,
// //                                                   fontStyle: FontStyle.italic,
// //                                                   fontSize: 14),
// //                                             )
// //                                             // ],
// //                                             // ),
                                          
// //                                         )
// //                                       ],
// //                                     ),
// //                                   ],
// //                                 ),
                               
                              
                            
                          
// //                         ),
// //                       ),
// //                     ));
//   // }}