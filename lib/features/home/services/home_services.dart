// import 'dart:convert';


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;

// class HomeServices {

// Future<List<Product>> fetchAllProducts(BuildContext context) async {
//     final userProvider = Provider.of<UserProvider>(context, listen: false);
//     List<Product> productList = [];
//     try {
//       http.Response res =
//           await http.get(Uri.parse('$uri/auth/get-products'),
//       //     headers: {
//       //   'Content-Type': 'application/json; charset=UTF-8',
//       //   'x-auth-token': userProvider.user.token,
//       // }
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

//   Future<List<Product>> fetchCategoryProducts({
//     required BuildContext context,
//     required String category,
//   }) async {
//     final userProvider = Provider.of<UserProvider>(context, listen: false);
//     List<Product> productList = [];
//     try {
//       http.Response res = await http
//           .get(Uri.parse('$uri/api/products?category=$category'), headers: {
//         'Content-Type': 'application/json; charset=UTF-8',
//         'x-auth-token': userProvider.user.token,
//       });

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

//   Future<Product> fetchDealOfDay({
//     required BuildContext context,
//   }) async {
//     final userProvider = Provider.of<UserProvider>(context, listen: false);
//     Product product = Product(
//       name: '',
//       description: '',
//       quantity: 0,
//       images: [],
//       category: '',
//       price: 0,
//     );

//     try {
//       http.Response res =
//           await http.get(Uri.parse('$uri/api/deal-of-day'), headers: {
//         'Content-Type': 'application/json; charset=UTF-8',
//         'x-auth-token': userProvider.user.token,
//       });

//       httpErrorHandle(
//         response: res,
//         context: context,
//         onSuccess: () {
//           product = Product.fromJson(res.body);
//         },
//       );
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//     return product;
//   }

// }

import 'dart:convert';
import 'dart:io';

import 'package:luveen/constants/error_handling.dart';
import 'package:luveen/constants/global_variables.dart';
import 'package:luveen/constants/utils.dart';
import 'package:luveen/models/Pres.dart';
import 'package:luveen/models/product.dart';

import 'package:luveen/providers/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '';
import '../../../models/user.dart';

class HomeServices {
  void uploadPrescription({
    required BuildContext context,
    required String name,
    required String presdescription,
    required double age,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      // final cloudinary = CloudinaryPublic('denfgaxvg', 'uszbstnu');
      final cloudinary = CloudinaryPublic('dh78aetr0', 'ewgdpg4v');
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name),
        );
        imageUrls.add(res.secureUrl);
      }

      // Pres prescription = Pres(
      //   name: name,
      //   presdescription: presdescription,
      //   age: age,
      //   images: imageUrls,

      // );
      Pres prescription = Pres(
          name: name,
          presdescription: presdescription,
          age: age,
          presimages: imageUrls);

      http.Response res = await http.post(
        Uri.parse('$uri/api/add-prescription'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: prescription.toJson(),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Prescription Added Successfully!');
          // UserProvider.user.
          User user = userProvider.user.copyWith(prescription: []);
          Navigator.pop(context);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void uploadPrescription2({
    required BuildContext context,
    required String name,
    required String presdescription,
    required double age,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      final cloudinary = CloudinaryPublic('denfgaxvg', 'uszbstnu');
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name),
        );
        imageUrls.add(res.secureUrl);
      }

      // Pres prescription = Pres(
      //   name: name,
      //   presdescription: presdescription,
      //   age: age,
      //   images: imageUrls,

      // );
      Pres prescription = Pres(
          name: name,
          presdescription: presdescription,
          age: age,
          presimages: imageUrls);

      http.Response res = await http.post(
        Uri.parse('$uri/api/add-prescription'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: prescription.toJson(),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Prescription Added Successfully!');
          Navigator.pop(context);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

// Add a particular Prescription

  // get all the products
  Future<List<Pres>> fetchAllPrescription(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Pres> prescriptionList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/get-prescription'), headers: {
        // await http.get(Uri.parse('$uri/api/prescription/me'), headers: {
        // await http.get(Uri.parse('$uri/api/prescription/me'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            prescriptionList.add(
              Pres.fromJson(
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
    return prescriptionList;
  }
// fetch all user
 
  Future<List<User>> fetchAllUsers(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<User> userList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/admin/get-users'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            userList.add(
              User.fromJson(
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
    return userList;
  }

  Future<List<Pres>> fetchMyPrescription({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Pres> prescriptionList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/prescription/me'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            prescriptionList.add(
              Pres.fromJson(
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
    return prescriptionList;
  }

// To remove Prescription which should be in view page
  void removeFromPrescription({
    required BuildContext context,
    required Pres prescription,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.delete(
        Uri.parse('$uri/api/remove-from-prescription/${prescription.id}'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          User user = userProvider.user
              .copyWith(prescription: jsonDecode(res.body)['cart']);
          userProvider.setUserFromModel(user);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<List<Product>> fetchAndFilterProducts(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/auth/get-products'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

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
 Future<List<Product>> fetchAllProducts(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/auth/get-products'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

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

  Future<List<Product>> fetchCategoryProducts({
    required BuildContext context,
    required String category,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res = await http
          .get(Uri.parse('$uri/api/products?category=$category'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

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

  void deletePrescription({
    required BuildContext context,
    required Pres prescription,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/delete-prescription'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': prescription.id,
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
