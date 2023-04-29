import 'package:luveen/features/admin/screens/admin_prescription.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrescriptionReply extends StatefulWidget {
  const PrescriptionReply({Key? key}) : super(key: key);

  @override
  State<PrescriptionReply> createState() => _PrescriptionReplyState();
}

class _PrescriptionReplyState extends State<PrescriptionReply> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text('Description'),
        TextFormField(),
        ElevatedButton(
            child: const Text("Reply"),
            onPressed: () => Get.back(result: 'Replied'))
      ],
    ));
  }
}
