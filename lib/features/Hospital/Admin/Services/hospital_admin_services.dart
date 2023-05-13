import 'dart:convert';
import 'dart:io';
import 'package:luveen/constants/error_handling.dart';
import 'package:luveen/constants/global_variables.dart';
import 'package:luveen/constants/utils.dart';
import 'package:provider/provider.dart';
import 'package:luveen/models/bed.dart';
import 'package:luveen/models/Hospital.dart';

import 'package:luveen/models/product.dart';

import 'package:luveen/providers/hospital_provider.dart';
import 'package:luveen/providers/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

// import '../../../models/Pres.dart';

class HospitalAdminServices {
  void AddBed({
    required BuildContext context,
   
    required List< File>hospital_picture,
    required String beds_available,
    required String hospital_location,
    required String location,
    required String general_ward_total,
    required String general_ward_available,
    required String VIP_ward_total,
    required String VIP_ward_available,
    required String ICU_total,
    required String ICU_available,
    required String ventilators_total,
    required String ventilators_available,
   
  }) async {
    final user =UserProvider().user;
    final hospital_id = HospitalProvider().hospital.id;

    
 
    
    final userProvider = Provider.of<UserProvider>(context, listen: false);
        final hospitalProvider = Provider.of<HospitalProvider>(context, listen: false);


    try {
// final cloudinary = CloudinaryPublic('denfgaxvg', 'uszbstnu');      List<String> imageUrls = [];
      final cloudinary = CloudinaryPublic('dh78aetr0', 'ewgdpg4v');
      List<String> imageUrls = [];

      for (int i = 0; i < hospital_picture.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(hospital_picture[i].path, folder: 'Hospital'),
        );
        imageUrls.add(res.secureUrl);
      }

      Bed bed = Bed(
          hospitalId:'',
          id:'',
      
          hospital_picture: imageUrls,
          beds_available: beds_available,
          hospital_location: hospital_location,
          location: location,
          general_ward_total: general_ward_total,
          general_ward_available: general_ward_available,
          VIP_ward_total: VIP_ward_total,
          VIP_ward_available: VIP_ward_available,
          ICU_total: ICU_total,
          ICU_available: ICU_available,
          ventilators_total: ventilators_total,
          ventilators_available: ventilators_available, );

      http.Response res = await http.post(
        Uri.parse('$uri/hospital/add-beds'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: bed.toJson(),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Beds Added Successfully!');
          // UserProvider.user.
          Hospital hospital = hospitalProvider.hospital.copyWith(bed: []);
          // Navigator.pop(context);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

void editbeddetail({
    required BuildContext context,
    required VoidCallback onSuccess,
    required List< File>hospital_picture,
    required String beds_available,
    required String hospital_location,
    required String location,
    required String general_ward_total,
    required String general_ward_available,
    required String VIP_ward_total,
    required String VIP_ward_available,
    required String ICU_total,
    required String ICU_available,
    required String ventilators_total,
    required String ventilators_available,
  }) async {
    final user =UserProvider().user;
    final hospital_id = HospitalProvider().hospital.id;
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      final cloudinary = CloudinaryPublic('denfgaxvg', 'uszbstnu');      List<String> imageUrls = [];

      for (int i = 0; i < hospital_picture.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(hospital_picture[i].path, folder: 'Hospital'),
        );
        imageUrls.add(res.secureUrl);
      }
     Bed bed = Bed(
          hospitalId:'',
          id:'',
      
          hospital_picture: imageUrls,
          beds_available: beds_available,
          hospital_location: hospital_location,
          location: location,
          general_ward_total: general_ward_total,
          general_ward_available: general_ward_available,
          VIP_ward_total: VIP_ward_total,
          VIP_ward_available: VIP_ward_available,
          ICU_total: ICU_total,
          ICU_available: ICU_available,
          ventilators_total: ventilators_total,
          ventilators_available: ventilators_available, );

        // http.post(
       http.Response res = await http.put(

        Uri.parse('$uri/hospital/update/bed'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
         body: bed.toJson(),
        // body: jsonEncode
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
                    showSnackBar(context, 'Beds Edited Successfully!');

         
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }









  // get all the beds
  Future<List<Product>> fetchAllBeds(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> BedList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/hospital/get-beds'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            BedList.add(
              Product.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return BedList;
  }

  void deleteProduct({
    required BuildContext context,
    required Bed bed,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/bed/delete-bed'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': bed.id,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          onSuccess();
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }






  
}
