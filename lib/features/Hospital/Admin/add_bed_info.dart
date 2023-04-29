import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:io';

import 'package:luveen/common/widgets/custom_button.dart';
import 'package:luveen/common/widgets/custom_textfield.dart';
import 'package:luveen/constants/global_variables.dart';
import 'package:luveen/constants/utils.dart';
import 'package:luveen/features/Hospital/Admin/Services/hospital_admin_services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
class AddBedScreen extends StatefulWidget {
  static const String routeName = '/add-bed';
  const AddBedScreen({Key? key}) : super(key: key);

  @override
  State<AddBedScreen> createState() => _AddBedScreenState();
}

class _AddBedScreenState extends State<AddBedScreen> {
    final TextEditingController beds_availableController = TextEditingController();
    final TextEditingController hospital_locationController= TextEditingController();
    final TextEditingController locationController= TextEditingController();
    final TextEditingController general_ward_availableController= TextEditingController();
    final TextEditingController general_ward_totalController= TextEditingController();
    final TextEditingController VIP_ward_availableController =TextEditingController();
    final TextEditingController VIP_ward_totalController= TextEditingController();
    final TextEditingController ICU_availableController= TextEditingController();
    final TextEditingController ICU_totalController= TextEditingController();
    final TextEditingController ventilators_totalController= TextEditingController();
    final TextEditingController ventilators_availableController= TextEditingController();

    final HospitalAdminServices hospitaladminServices = HospitalAdminServices();


     List<File> hospital_picture = [];
  final _addBedFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    beds_availableController.dispose();
    hospital_locationController.dispose();
    locationController.dispose();
    general_ward_availableController.dispose();
    general_ward_totalController.dispose();
    VIP_ward_availableController.dispose();
    VIP_ward_totalController.dispose();
    ICU_availableController.dispose();
    ICU_totalController.dispose();
    ventilators_availableController.dispose();
    ventilators_totalController.dispose();
   
  }
void AddBed() {
    if (_addBedFormKey.currentState!.validate() && hospital_picture.isNotEmpty) {
      // hospitaladminServices.AddBed(context: context, hospital_picture: hospital_picture, beds_available: beds_available, hospital_location: hospital_location, location: location, general_ward_total: general_ward_total, general_ward_available: general_ward_available, VIP_ward_total: VIP_ward_total, VIP_ward_available: VIP_ward_available, ICU_total: ICU_total, ICU_available: ICU_available, ventilators_total: ventilators_total, ventilators_available: ventilators_available, name: name, description: description, price: price, quantity: quantity, category: category, images: images)
      hospitaladminServices.AddBed(
        context: context,
        hospital_picture: hospital_picture,
    beds_available:beds_availableController.text,
    hospital_location: hospital_locationController.text,
    location: locationController.text,
    general_ward_total:general_ward_totalController.text,
    general_ward_available:general_ward_availableController.text,
    VIP_ward_total:VIP_ward_totalController.text,
    VIP_ward_available:VIP_ward_availableController.text,
    ICU_total:ICU_totalController.text,
    ICU_available:ICU_availableController.text,
    ventilators_total:ventilators_totalController.text,
    ventilators_available:ventilators_availableController.text,

      );
    }
  }
   void selectImages() async {
    var res = await pickImages();
    setState(() {
      hospital_picture = res;
    });
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
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
                CustomTextField(
                  controller: beds_availableController,
                  hintText: 'No. of Available Beds',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: hospital_locationController,
                  hintText: 'Hospital location',
                  maxLines: 7,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: locationController,
                  hintText: 'Location',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: general_ward_totalController,
                  hintText: 'Total no of General Ward',
                ),
                
                
                const SizedBox(height: 10),
                CustomTextField(
                  controller: general_ward_availableController,
                  hintText: 'Available no of General Ward',
                ),
                
                
                const SizedBox(height: 10),
                CustomTextField(
                  controller: VIP_ward_totalController,
                  hintText: 'Total no of VIP Ward',
                ),
                
                
                const SizedBox(height: 10),
                CustomTextField(
                  controller: VIP_ward_availableController,
                  hintText: 'Available no of VIP Ward',
                ),
                
                
                const SizedBox(height: 10),
                CustomTextField(
                  controller: ventilators_totalController,
                  hintText: 'Total no of Ventilators',
                ),
                
                
                const SizedBox(height: 10),
                CustomTextField(
                  controller: ventilators_availableController,
                  hintText: 'Available no of Ventilators',
                ),
                
                
                const SizedBox(height: 10),
                CustomTextField(
                  controller: general_ward_totalController,
                  hintText: 'Total no of General Ward',
                ),
                
                
                const SizedBox(height: 10),
                CustomTextField(
                  controller: general_ward_totalController,
                  hintText: 'Total no of General Ward',
                ),
                
                
                const SizedBox(height: 10),
                CustomButton(
                  text: 'ADD',
                  onTap: AddBed,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}













// // import 'dart:convert';
// import 'dart:io';

// import 'package:cloudinary_public/cloudinary_public.dart';
// import 'package:flutter/material.dart';
// import 'package:luveen/constants/error_handling.dart';
// import 'package:luveen/constants/global_variables.dart';
// import 'package:luveen/constants/utils.dart';
// import 'package:luveen/models/hospital.dart';
// import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';

// class HospitalServices {
//   void enterInfo({
//     required BuildContext context,
//     // required String name,
//     // required String address,
//     // required double contact,
//     // required double freeBeds,
//     // required double totalBeds,
//     // required List<File> images,
//     required String hospital_name,
//     required String email,
//     required String password,
//     required List<File> hospital_picture,
//     required double beds_available,
//     required double hospital_location,
//     required double location,
//     required String general_ward_total,
//     required String general_ward_available,
//     required String VIP_ward_total,
//     required String VIP_ward_available,
//     required String ICU_total,
//     required String ICU_available,
//     required String ventilators_total,
//     required String ventilators_available,

//   }) async {
//     // final hospitalProvider = Provider.of<HospitalProvider>(context,listen:false);
//     try{ 
//       final cloudinary = CloudinaryPublic('dh78aetr0', 'ewgdpg4v');
//       List<String> imageUrls = [];

//       for (int i = 0; i < hospital_picture.length; i++) {
//         CloudinaryResponse res = await cloudinary.uploadFile(
//         CloudinaryFile.fromFile(hospital_picture[i].path, folder: hospital_name),
//         );
//         imageUrls.add(res.secureUrl);
//       }
      
//     Hospital hospital= Hospital(
//       hospital_name:'',
//       email: email, 
//       password: password, 
//       hospital_picture: imageUrls,
//       beds_available: beds_available ,
//       hospital_location: hospital_location,
//       location: location,
//       general_ward_total: general_ward_total,
//       general_ward_available: general_ward_available,
//       VIP_ward_total: VIP_ward_total,
//       VIP_ward_available: VIP_ward_available,
//       ICU_total: ICU_total,
//       ICU_available: ICU_available,
//       ventilators_total: ventilators_total,
//       ventilators_available: ventilators_available,
//       );
      
//         http.Response res= await http.post(
//         Uri.parse('$uri/hospital/add-info'),
//         headers: {
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: hospital.toJson(),
//       );
//        httpErrorHandle(response: res, context: context, onSuccess: (){
//          showSnackBar(context, "Info added successfully");
//          Navigator.pop(context);
//        });
//      }catch(e){
//       showSnackBar(context, e.toString());
//     }

//   }
  
// }