import 'package:luveen/features/admin/screens/Prescription_reply.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:luveen/features/home/screens/prescriptionView.dart';

import '../../../common/widgets/loader.dart';
import '../../../models/Pres.dart';
//import '../../account/widgets/single_prescription.dart';
import '../../home/widgets/single_prescription.dart';
import '../services/admin_services.dart';

class AdminPrescription extends StatefulWidget {
  const AdminPrescription({Key? key}) : super(key: key);

  @override
  State<AdminPrescription> createState() => _AdminPrescriptionState();
}

class _AdminPrescriptionState extends State<AdminPrescription> {
  String? x;
  List<Pres>? prescriptions;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchAllPrescription();
  }

  fetchAllPrescription() async {
    prescriptions = await adminServices.fetchAllPrescription(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return prescriptions == null
        ? const Loader()
        : Scaffold(
            body: ListView.builder(
              itemCount: prescriptions!.length,
              itemBuilder: (context, index) {
                final prescriptionData = prescriptions![index];
                return Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 0),
                    child: GestureDetector(
                      onTap: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const PrescriptionView()),
                      //   );
                      // },
                        Navigator.pushNamed(
                              context, PrescriptionView.routeName,
                              // arguments: orders![index],);
                              arguments: prescriptionData);
                        },
                      child: new Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.12,
                              width: MediaQuery.of(context).size.height * 0.12,
                              child: SinglePrescription(
                                image: prescriptionData.presimages[0],
                              ),
                            ),
                            Container(
                              // width: MediaQuery.of(context).size.height * 0.65,
                              // child: Padding(
                              //   padding: const EdgeInsets.all(20.0),
                              child: Expanded(
                                child: Text(
                                  prescriptionData.name,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),

                              // IconButton(
                              //   onPressed: () => deletePrescription(
                              //       prescriptionData, index),
                              //   icon: const Icon(
                              //     Icons.delete_outline,
                              //   ),
                              // ),
                            ),
                            IconButton(
                              icon: Icon(Icons.chat),
                              onPressed: () {
                                print("Welcome to the Chat Box");
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(right: 20.0),
                            //   child: Container(
                            //     color: Colors.grey.shade300,
                            //     child: IconButton(
                            //       onPressed: () => deletePrescription(
                            //           prescriptionData, index),
                            //       icon: const Icon(
                            //         Icons.delete_outline,
                            //       ),
                            //     ),
                            //   ),
                            // ),

                            // TextButton(
                            //     child: Text(
                            //       " View Reply",
                            //       style: TextStyle(
                            //           fontSize: 15, color: Colors.green),
                            //     ),
                            //     onPressed: () {}
                            //     // async {
                            //     //   const String _url = "https://www.geeksforgeeks.org";
                            //     //   if (await canLaunch(_url)) {
                            //     //     launch(_url);
                            //     //   } else {
                            //     //     throw "Could not launch $_url";
                            //     //   }
                            //     // },
                            //     )
                          ],
                        ),
                      ),
                    ));
              },
            ),
          );
  }
}
