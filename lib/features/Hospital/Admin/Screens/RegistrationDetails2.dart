import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:luveen/constants/global_variables.dart';
import 'package:luveen/constants/utils.dart';
import 'package:luveen/features/Hospital/Admin/Screens/IndividualHospital2.dart';
import 'package:luveen/features/Hospital/Admin/Screens/MyCustomCheckbox.dart';
import 'package:luveen/features/Hospital/Admin/Services/hospital_admin_services.dart';
import 'package:luveen/features/Hospital/services/hospital_services.dart';
import 'package:luveen/models/bed.dart';
import 'package:luveen/providers/user_provider.dart';
import 'package:provider/provider.dart';

class HospitalRegistrationDetails extends StatefulWidget {
   static const String routeName = '/hospital-screen';

  HospitalRegistrationDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<HospitalRegistrationDetails> createState() =>
      _HospitalRegistrationDetailsState();
}

class _HospitalRegistrationDetailsState
    extends State<HospitalRegistrationDetails> {
  final TextEditingController hospital_locationController = TextEditingController();
  final TextEditingController general_ward_totalController = TextEditingController();
  final TextEditingController VIP_ward_totalController= TextEditingController();
  final TextEditingController ICU_totalController= TextEditingController();
  final TextEditingController ventilators_totalController =TextEditingController();
  
  

  final HospitalAdminServices hospitaladminServices = HospitalAdminServices();
 List<Bed> ? beds;
  //  late Bed bedd;
     final HospitalService hospitalService = HospitalService();
  List<File> hospital_picture = [];
  final _addBedFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    
    hospital_locationController.dispose();
    general_ward_totalController.dispose();
    VIP_ward_totalController.dispose(); 
    ICU_totalController.dispose();
    ventilators_totalController.dispose();
  }

  
  void selectImages() async {
    var res = await pickImages();
    setState(() {
      hospital_picture = res;
    });
  }
 @override
  void initState() {
    super.initState();
    // fetchHospitals();
    // fetchBeds();
    fetchbedybydId();
  }
  void fetchbedybydId () async{
  print(user.id);

 beds = await hospitalService.fetchAllBedsByHospitalId(context: context, hospitalId: user.id);
//  bedd = await hospitalService.fetchOnlyaBedsByHospitalId(context: context, hospitalId: widget.hospital.id) ;
 print(beds);
 
  setState((){});
}
  @override
  Widget build(BuildContext context) {
         final bedData = beds;

    final userProvider = Provider.of<UserProvider>(context);
    final name = userProvider.user.name;
  // beds![0].general_ward_total == null ? "0" : beds![0].general_ward_total;
  // beds![0].VIP_ward_total == null ? "0" : beds![0].VIP_ward_total;
  // beds![0].ICU_total == null ? "0" : beds![0].ICU_total;
  // beds![0].ventilators_total == null ? "0" : beds![0].ventilators_total;
    // return beds != null ?  IndividualHospital(general_ward_total: beds![0].general_ward_total, VIP_ward_total: beds![0].VIP_ward_total, ICU_total: beds![0].ICU_total, ventilators_total: beds![0].ventilators_total, hospital_location: beds![0].hospital_location, name: name, hospital_picture: hospital_picture) :
return
        Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                // gradient: GlobalVariables.appBarGradient,
                ),
          ),
          title: const Text(
            'Add Bed Information',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addBedFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                hospital_picture.isNotEmpty
                    ? CarouselSlider(
                        items: hospital_picture.map(
                          (i) {
                            return Builder(
                              builder: (BuildContext context) => Image.file(
                                i,
                                fit: BoxFit.cover,
                                height: 200,
                              ),
                            );
                          },
                        ).toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: 200,
                        ),
                      )
                    : GestureDetector(
                        onTap: selectImages,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          dashPattern: const [10, 4],
                          strokeCap: StrokeCap.round,
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.folder_open,
                                  size: 40,
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  'Select Hospital Picture',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                const SizedBox(height: 30),
                TextField(
                  // controller: _nameController,
                  obscureText: false,
                  decoration: InputDecoration(
                    // labelText: "Hospital Name",
                    labelText: name,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: hospital_locationController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: "Hospital Location",
                    // labelText: email,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
                        child: Column(children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Select Categories:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.green,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              CheckboxListTile(
                                title: const Text('General Ward'),
                                value: showGeneralWard,
                                onChanged: (value) {
                                  setState(() {
                                    showGeneralWard = value!;
                                    if (!showGeneralWard) {
                                      general_ward_totalController.text = '0';
                                    }
                                  });
                                },
                              ),
                              if (showGeneralWard)
                                TextFormField(
                                  controller: general_ward_totalController,
                                  decoration: const InputDecoration(
                                    labelText:
                                        'Total number of beds in General Ward',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              CheckboxListTile(
                                title: const Text('VIP Ward'),
                                value: showVipWard,
                                onChanged: (value) {
                                  setState(() {
                                    showVipWard = value!;
                                    if (!showVipWard) {
                                      VIP_ward_totalController.text = '0';
                                    }
                                  });
                                },
                              ),
                              if (showVipWard)
                                TextFormField(
                                  controller: VIP_ward_totalController,
                                  decoration: const InputDecoration(
                                    labelText:
                                        'Total number of beds in VIP Ward',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              CheckboxListTile(
                                title: const Text('ICU'),
                                value: showIcu,
                                onChanged: (value) {
                                  setState(() {
                                    showIcu = value!;
                                    if (!showIcu) {
                                      ICU_totalController.text = '0';
                                    }
                                  });
                                },
                              ),
                              if (showIcu)
                                TextFormField(
                                  controller: ICU_totalController,
                                  decoration: const InputDecoration(
                                    labelText: 'Total number of beds in ICU',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              CheckboxListTile(
                                title: const Text('Ventilator'),
                                value: showVentilator,
                                onChanged: (value) {
                                  setState(() {
                                    showVentilator = value!;
                                    if (!showVentilator) {
                                      ventilators_totalController.text = '0';
                                    }
                                  });
                                },
                              ),
                              if (showVentilator)
                                TextFormField(
                                  controller: ventilators_totalController,
                                  decoration: const InputDecoration(
                                    labelText:
                                        'Total number of beds with Ventilator',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                            ],
                          )

                          //   Container(
                          //       child: SingleChildScrollView(child: CheckBoxes()))
                        ]))),
                ElevatedButton(
                 onPressed: () {
    if (_addBedFormKey.currentState!.validate() &&
        hospital_picture.isNotEmpty) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => IndividualHospital(
          name: name,
          hospital_picture: hospital_picture,
          ICU_total: ICU_totalController.text,
          VIP_ward_total: VIP_ward_totalController.text,
          general_ward_total: general_ward_totalController.text,
          ventilators_total: ventilators_totalController.text,
          hospital_location: hospital_locationController.text,
        ),
      ));
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Missing Value!"),
          content: const Text("Fill in all values"),
        ),
      );
    }
  },
  child: const Text('Done'),
                ),
              ],
            )
            
          
 







































































            
          ),
        ),
      ),
    );
  }
}
