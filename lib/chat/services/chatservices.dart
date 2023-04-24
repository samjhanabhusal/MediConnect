


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:luveen/constants/error_handling.dart';
import 'package:luveen/constants/global_variables.dart';
import 'package:luveen/constants/utils.dart';
import 'package:luveen/models/doctor.dart';
import 'package:luveen/models/user.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../providers/user_provider.dart';

class ChatServices{
 Future<List<Doctor>> fetchAlldoctor(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Doctor> doctorList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/get-doctors'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            doctorList.add(
              Doctor.fromJson(
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
    return doctorList;
  }
void EntertoChat({
    required BuildContext context,
    required Doctor doctor,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/enter-to-chat'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': doctor.id!,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          User user =
              userProvider.user.copyWith(doctors: jsonDecode(res.body)['doctors']);
          userProvider.setUserFromModel(user);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
  void deleteDoctor({
    required BuildContext context,
    required Doctor doctor,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/delete-doctor'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': doctor.id,
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
  void EntertoChat({
    required BuildContext context,
    required Doctor doctors,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/enter-to-chat'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': doctors.id!,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          User user =
              userProvider.user.copyWith(doctors: jsonDecode(res.body)['doctors']);
          userProvider.setUserFromModel(user);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
// }