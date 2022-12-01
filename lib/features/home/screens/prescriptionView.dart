// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:image_viewer/image_viewer.dart';

import 'package:luveen/models/Pres.dart';
import 'package:provider/provider.dart';

import '../../../providers/user_provider.dart';

class PrescriptionView extends StatefulWidget {
    static const String routeName = '/prescription-details';
    final Pres prescription;

  const PrescriptionView({
    Key? key,
    required this.prescription,
  }) : super(key: key);

  @override
  State<PrescriptionView> createState() => _PrescriptionViewState();
}

class _PrescriptionViewState extends State<PrescriptionView> {
  // Widget fullScreenImage() => FullScreenWidget(
  //       child: ClipRRect(
  //         borderRadius: BorderRadius.circular(16),
  //         child: Image.asset(
  //           "assets/images/beb.png",
  //           fit: BoxFit.cover,
  //         ),
  //       ),
  //     );
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    // var contactno = context.watch<UserProvider>().user.phoneno;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0), // here the desired height
          child: AppBar(
            backgroundColor: Colors.green,
            title: new Text(
              "Prescription Details",
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            automaticallyImplyLeading: true,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      showImageViewer(
                          context, Image.network(widget.prescription.presimages[0]).image,
                          swipeDismissible: false);
                    },
                    
                    child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 0.40,
                        width: MediaQuery.of(context).size.height * 0.40,
                        
                        // decoration: BoxDecoration(
                        //     image: DecorationImage(
                        //       image: AssetImage('assets/images/beb.png'),
                        //       fit: BoxFit.fill,
                        //     ),
                        //     color: Colors.green,
                        //     borderRadius: BorderRadius.circular(10.0))
                        child: Image.network(widget.prescription.presimages[0]),
                            ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    // Row(
                    //   children: <Widget>[
                    Text(
                      "Name:",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                    Spacer(),
                    Text(
                      // "Shalini Gupta",
                      widget.prescription.name,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 18),
                    )
                    // ],
                    // ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    // Row(
                    //   children: <Widget>[
                    Text(
                      "Age:",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                    Spacer(),
                    Text(
                      // "22",
                      widget.prescription.age.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 18),
                    )
                    // ],
                    // ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    // Row(
                    //   children: <Widget>[
                    Text(
                      "Gender:",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                    // Spacer(),
                    Spacer(flex: 4),
                    Text(
                      // "Female",
                      widget.prescription.name,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 18),
                    )
                    // ],
                    // ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    // Row(
                    //   children: <Widget>[
                    Text(
                      "Contact:",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                    // Spacer.width(),
                    Spacer(flex: 4),
                    Text(
                       user.contactno,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 18),
                    )
                    // ],
                    // ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),

                Text(
                  "Description:",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 18),
                ),

                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.height * 0.99,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      // "Very much birami",
                     widget.prescription.presdescription,

                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 15),
                    ),
                  ),
                ),
                // ],

                SizedBox(
                  height: 5,
                ),
              ]),
        ));
  }
}
