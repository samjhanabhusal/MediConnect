import 'dart:convert';

import 'package:luveen/common/widgets/bottom_bar.dart';
import 'package:luveen/constants/error_handling.dart';
import 'package:luveen/constants/global_variables.dart';
import 'package:luveen/constants/utils.dart';
import 'package:luveen/features/account/screens/EnterDetails.dart';
import 'package:luveen/features/auth/screens/auth_screen.dart';
import 'package:luveen/models/Doctor.dart';

import 'package:luveen/models/user.dart';
import 'package:luveen/models/Hospital.dart';
import 'package:luveen/providers/bed_provider.dart';
import 'package:luveen/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/bed.dart';

class HospitalService {
  // fetch all hospital
  Future<List<Hospital>> fetchAllHospitals(BuildContext context) async {
    // final hospitalProvider = Provider.of<HospitalProvider>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Hospital> hospitalList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/get-hospitals'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            hospitalList.add(
              Hospital.fromJson(
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
    print(hospitalList);
    return hospitalList;
  }

// fetch all beds
  // fetch all hospital
  Future<List<Bed>> fetchAllBeds(BuildContext context) async {
    // final hospitalProvider = Provider.of<HospitalProvider>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Bed> bedList = [];
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
            bedList.add(
              Bed.fromJson(
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
    return bedList;
  }

  // Future<List<Bed>> fetchAllBedsByHospitalId({
Future <Bed> fetchOnlyaBedsByHospitalId({
    required BuildContext context,
     required  String hospitalId
     }) async {
    // final hospitalProvider = Provider.of<HospitalProvider>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    // List<Bed> bedList = [];
    late Bed bed;
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/beds?hospitalId=$hospitalId'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          // for (int i = 0; i < jsonDecode(res.body).length; i++) {
            // bedList.add(
            bed =  
              Bed.fromJson(
                jsonEncode(
                  // jsonDecode(res.body)[i],
                  jsonDecode(res.body),
                // ),
              )
            );
          // }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    // return bedList;
    // return bedList;
    return bed;
  }


// fetch list of beds
  Future<List<Bed>> fetchAllBedsByHospitalId({
// Future <Bed> fetchAllBedsByHospitalId({
    required BuildContext context,
     required  String hospitalId
     }) async {
    // final hospitalProvider = Provider.of<HospitalProvider>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Bed> bedList = [];
    late Bed bed;
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/beds/?hospitalId=$hospitalId'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            bedList.add(
            // bed =  
              Bed.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                  // jsonDecode(res.body),
                ),
              )
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    // return bedList;
    return bedList;
    // return bed;
  }

 

  Future<List<Hospital>> fetchMyHospital({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Hospital> hospitalList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/hospital/me'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            hospitalList.add(
              Hospital.fromJson(
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
    return hospitalList;
  }

// To remove Prescription which should be in view page
  void removeFromPrescription({
    required BuildContext context,
    required Hospital hospital,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final hospitalProvider =
        Provider.of<HospitalProvider>(context, listen: false);

    try {
      http.Response res = await http.delete(
        Uri.parse('$uri/api/remove-from-hospital/${hospital.id}'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          // User user = userProvider.user
          // Hospital hospital = hospitalProvider.hospital
          //      .copyWith(hospital: jsonDecode(res.body)['cart']);
          // hospitalProvider.setHospitalFromModel(hospital);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

// ForgetPassword
// Update bed rakhnu parxa
  void updatepassword({
    required BuildContext context,
    // required VoidCallback onSuccess,
    required String email,
    required String newpassword,
    required String confirmpassword,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      // Hospital user = Hospital(
      //   // id: '',
      //   email: email,

      //   // status: status,
      // );

      // http.post(
      http.Response res = await http.put(Uri.parse('$uri/api/UpdatePassword'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': userProvider.user.token,
          },
          body: jsonEncode({
            'email': email,
            'newpassword': newpassword,
            'confirmpassword': confirmpassword
            // ''
          })
          // body: jsonEncode
          );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Password Updated Successfully!');
          Navigator.pop(context);
          Navigator.pushNamed(context, AuthScreen.routeName);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // get user data
  void getHospitalData(
    BuildContext context,
  ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('$uri/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('$uri/hospital'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );

        var hospitalProvider =
            Provider.of<HospitalProvider>(context, listen: false);
        hospitalProvider.setHospital(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
