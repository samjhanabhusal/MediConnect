import 'package:luveen/features/prescription/screens/pickImage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrescriptionScreen extends StatefulWidget {
  const PrescriptionScreen({Key? key}) : super(key: key);

  @override
  State<PrescriptionScreen> createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
  String? x;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              elevation: 5,
              floating: true,
              pinned: true,
              snap: false,
              centerTitle: false,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.green,
              title: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Prescription",
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              foregroundColor: Colors.black,
              expandedHeight: 50.0,
              flexibleSpace: const FlexibleSpaceBar(),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 70),
        child: Container(
          height: 100.0,
          width: 100.0,
          child: FittedBox(
            child: FloatingActionButton(
                backgroundColor: Colors.white.withOpacity(0.6),
                elevation: 10.0,
                child: const Icon(
                  Icons.add_a_photo,
                  color: Colors.green,
                  size: 35.0,
                ),
                onPressed: () async {
                  x = await Get.to(PickImage());
                  setState(() {});
                }),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
