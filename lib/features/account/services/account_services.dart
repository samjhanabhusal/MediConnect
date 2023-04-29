// import 'dart:convert';
// import 'package:luveen/constants/error_handling.dart';
// import 'package:luveen/constants/global_variables.dart';
// import 'package:luveen/constants/utils.dart';
// import 'package:luveen/features/auth/screens/auth_screen.dart';
// import 'package:luveen/models/order.dart';
// import 'package:luveen/providers/user_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../../models/product.dart';

// class AccountServices {
//   Future<List<Product>> fetchAllProducts(BuildContext context) async {
//     final userProvider = Provider.of<UserProvider>(context, listen: false);
//     List<Product> productList = [];
//     try {
//       http.Response res = await http.get(
//         Uri.parse('$uri/auth/get-products'),
//         //     headers: {
//         //   'Content-Type': 'application/json; charset=UTF-8',
//         //   'x-auth-token': userProvider.user.token,
//         // }
//       );

//       httpErrorHandle(
//         response: res,
//         context: context,
//         onSuccess: () {
//           for (int i = 0; i < jsonDecode(res.body).length; i++) {
//             productList.add(
//               Product.fromJson(
//                 jsonEncode(
//                   jsonDecode(res.body)[i],
//                 ),
//               ),
//             );
//           }
//         },
//       );
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//     return productList;
//   }

//   Future<List<Order>> fetchMyOrders({
//     required BuildContext context,
//   }) async {
//     final userProvider = Provider.of<UserProvider>(context, listen: false);
//     List<Order> orderList = [];
//     try {
//       http.Response res =
//           await http.get(Uri.parse('$uri/api/orders/me'), headers: {
//         'Content-Type': 'application/json; charset=UTF-8',
//         'x-auth-token': userProvider.user.token,
//       });

//       httpErrorHandle(
//         response: res,
//         context: context,
//         onSuccess: () {
//           for (int i = 0; i < jsonDecode(res.body).length; i++) {
//             orderList.add(
//               Order.fromJson(
//                 jsonEncode(
//                   jsonDecode(res.body)[i],
//                 ),
//               ),
//             );
//           }
//         },
//       );
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//     return orderList;
//   }

//   void logOut(BuildContext context) async {
//     try {
//       SharedPreferences sharedPreferences =
//           await SharedPreferences.getInstance();
//       await sharedPreferences.setString('x-auth-token', '');
//       Navigator.pushNamedAndRemoveUntil(
//         context,
//         AuthScreen.routeName,
//         (route) => false,
//       );
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//   }
// }



























import 'dart:convert';
import 'package:luveen/constants/error_handling.dart';
import 'package:luveen/constants/global_variables.dart';
import 'package:luveen/constants/utils.dart';
import 'package:luveen/features/account/screens/EnterDetails.dart';
import 'package:luveen/features/account/widgets/ViewProfile.dart';

// import 'package:luveen/features/account/screens/EnterDetails.dart';
// import 'package:luveen/features/account/widgets/Profile.dart';
import 'package:luveen/features/auth/screens/auth_screen.dart';
import 'package:luveen/models/order.dart';
import 'package:luveen/models/profile.dart';
import 'package:luveen/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:luveen/models/user.dart';

import '../../../models/product.dart';
import '../../../models/profile.dart';
import '../widgets/Profile.dart';

class AccountServices {
  Future<List<Product>> fetchAllProducts(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res = await http.get(
        Uri.parse('$uri/auth/get-products'),
        //     headers: {
        //   'Content-Type': 'application/json; charset=UTF-8',
        //   'x-auth-token': userProvider.user.token,
        // }
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            productList.add(
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
    return productList;
  }
void enterdetail({
    required BuildContext context,
    required String firstname,
    required String lastname,
    required String gender,
    required String address,
    required double age,
    required String status,
    required double phoneno,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      Profile profile = Profile(
        id: '',
        firstname: firstname,
        lastname: lastname,
        age: age,
        address: address,
        phoneno: phoneno,
        gender: gender,
        // status: status,
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/add/profile'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: profile.toJson(),
        // body: jsonEncode
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          // Profile profile = 
          User user =
          userProvider.user.copyWith(profiles: jsonDecode(res.body)['profiles']);
          userProvider.setUserFromModel(user);
          // userProvider.setUserFromModel(user);
          // showSnackBar(
          //   context,
          //   'Now you can signin',
          // );
          // Navigator.pop(context);

           Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ViewProfile()),
                );

            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => profile()),
            // );
          // },
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

void editdetail({
    required BuildContext context,
    required VoidCallback onSuccess,
    required String firstname,
    required String lastname,
    required String gender,
    required String address,
    required double age,
    required String status,
    required double phoneno,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      Profile profile = Profile(
        // id: '',
        firstname: firstname,
        lastname: lastname,
        age: age,
        address: address,
        phoneno: phoneno,
        gender: gender,
        // status: status,
      );

        // http.post(
       http.Response res = await http.put(

        Uri.parse('$uri/api/update/profile'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: profile.toJson(),
        // body: jsonEncode
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
         
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }









  Future<List<Order>> fetchMyOrders({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Order> orderList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/orders/me'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            orderList.add(
              Order.fromJson(
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
    return orderList;
  }


  Future<List<Profile>> fetchMyProfile({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Profile> profileList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/profile/me'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            profileList.add(
              Profile.fromJson(
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
    return profileList;
  }
  String baseurl = 'http://192.168.1.90:3000';

// Future<List<Profile>> fetchMyProfile({
//     required BuildContext context,
//   }) async {
//     final userProvider = Provider.of<UserProvider>(context, listen: false);
//     List<Profile> profileList = [];
//     try {

// var status CheckMyProfile({


// })

// Future<bool>  CheckMyProfile({
// Future get({
  // Future<List<Profile>> fetchMyProfilee({
    //  return type.dart(var_return_type)
  Future<dynamic> get({
//  dynamic get({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
  // var status ;
  // bool status;
    try {

      http.Response res =
      // var res =
          await http.get(Uri.parse('$uri/checkProfile'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      // httpErrorHandle(
      //   response: res,
      //   context: context,
      //   onSuccess: () {

          var response = jsonDecode(res.body);
          // return jsonDecode(res.body);
          print(response);
          print(response['status']);
          // return(response);
          return response['status'];

          // if(response['status'] == true)
          // {
          //   SetState

          //   Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => const profile()),
          //       );
          // }
          // else{
          //    Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => const EnterDetails()),
          //       );
          // }

          //  return jsonDecode(res.body);


          // status = res.body();
        //   for (int i = 0; i < jsonDecode(res.body).length; i++) {
        //     profileList.add(
        //       Profile.fromJson(
        //         jsonEncode(
        //           jsonDecode(res.body)[i],
        //         ),
        //       ),
        //     );
        //   }
      //   },
      // );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    // return status;
  }




// save user contact no
void saveUserContactNo({
    required BuildContext context,
    required String contactno
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/save-user-contactno'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'contactno': contactno,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          User user = userProvider.user.copyWith(
            address: jsonDecode(res.body)['address'],
          );

          userProvider.setUserFromModel(user);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }


  void logOut(BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString('x-auth-token', '');
      Navigator.pushNamedAndRemoveUntil(
        context,
        AuthScreen.routeName,
        (route) => false,
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
