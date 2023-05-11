import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:luveen/common/widgets/bottom_bar.dart';
import 'package:luveen/constants/error_handling.dart';
import 'package:luveen/constants/global_variables.dart';
import 'package:luveen/constants/utils.dart';
import 'package:luveen/features/account/screens/EnterDetails.dart';
import 'package:luveen/features/auth/screens/Hospitalregister.dart';
import 'package:luveen/features/auth/screens/auth_screen.dart';
import 'package:luveen/models/bed.dart';
import 'package:luveen/models/Doctor.dart';
import 'package:luveen/models/user.dart';
import 'package:luveen/models/Hospital.dart';
import 'package:luveen/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // sign up user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        password: password,
        email: email,
        address: '',
        contactno: '',
        role: '',
        token: '',
        cart: [],
        prescription: [],
        profiles: [],
        doctors: [],
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Account created! Login with the same credentials!',
          );
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => EnterDetails()),
          // );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

// Register as a doctor

  void signUpDoctor({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
    required String qualification,
    required String contactno,
    required String address,
    required String specialization,
    required String experience,
    required String nmc_no,
  }) async {
    try {
      // User user = User(
      //   id: '',
      //   name: name,
      //   password: password,
      //   email: email,
      //   address: '',
      //   contactno: '',
      //   role: '',
      //   token: '',
      //   cart: [],
      //   prescription: [],
      //   profiles: [],
      //   doctors: [],
      // );
      Doctor doctor = Doctor(
        id:'',
          contactno: contactno,
          email: email,
          experience: experience,
          name: name,
          address: address,
          // nmc_no: int.parse(nmc_no),
          nmc_no : nmc_no,
          password: password,
          qualification: qualification,
          specialization: specialization);

      http.Response res = await http.post(
        Uri.parse('$uri/doctor/register'),
        body: doctor.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Account created! Login with the same credentials!',
          );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AuthScreen()),
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }


  void signUpHospital({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
    
  }) async {
    try {
      // User user = User(
      //   id: '',
      //   name: name,
      //   password: password,
      //   email: email,
      //   address: '',
      //   contactno: '',
      //   role: '',
      //   token: '',
      //   cart: [],
      //   prescription: [],
      //   profiles: [],
      //   doctors: [],
      // );
      Hospital hospital = Hospital(
        id:'',
        email: email,
        name: name,
        password: password,
        // bed:[],
        
      );

      http.Response res = await http.post(
        Uri.parse('$uri/hospital/register'),
        body: hospital.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Account created! Login with the same credentials!',
          );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AuthScreen()),
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }



void checkHospital({
    required BuildContext context,
    // required String email,
    // required String password,
    required bool check,
    required String name,
    required VoidCallback onSuccess,
    
  }) async {
    try {
      // User user = User(
      //   id: '',
      //   name: name,
      //   password: password,
      //   email: email,
      //   address: '',
      //   contactno: '',
      //   role: '',
      //   token: '',
      //   cart: [],
      //   prescription: [],
      //   profiles: [],
      //   doctors: [],
      // );
      Hospital hospital = Hospital(
        id:'',
        email: '',
        name: name,
        password: '',
        // bed:[],
        
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/verify-hospitals'),
        body: hospital.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

        httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {

      //      showDialog(
      //           context: context,
      //           builder: (ctx) => AlertDialog(
      //             title: const Text("Verified!"),
      //             content: const Text(" To move forward with the registration"),
      //             actions: <Widget>[
      //               TextButton(
      //    onPressed: () => Navigator.of(context)
      //       .push(MaterialPageRoute(builder: (context) => const HospitalRegister(), )),
      //   child: const Text('Click Here', style: TextStyle( decoration: TextDecoration. underline,),textAlign: TextAlign.center),
      // ),
      //             ],
      //           ),
              // );



          check = true;
          onSuccess();
          //  setState(() {
              
          //   });
          
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => AuthScreen()),
          // );
        },

      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }




  // sign in user
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);

          Navigator.pushNamedAndRemoveUntil(
            context,
            BottomBar.routeName,
            (route) => false,
          );
          // Navigator.
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

// ForgetPassword
  void updatepassword({
    required BuildContext context,
    // required VoidCallback onSuccess,
    required String email,
    required String newpassword,
    required String confirmpassword,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      // User user = User(
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
  void getUserData(
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
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
