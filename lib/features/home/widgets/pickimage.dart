import 'dart:io';

import 'package:luveen/features/home/screens/home_screen.dart';
import 'package:luveen/features/home/services/home_services.dart';
import 'package:flutter/material.dart';
import 'package:luveen/constants/utils.dart';
import 'package:luveen/common/widgets/custom_button.dart';
import 'package:luveen/common/widgets/custom_textfield.dart';
import 'package:luveen/constants/global_variables.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';

class PickImage extends StatefulWidget {
  static const String routeName = '/add-prescription';
  const PickImage({Key? key}) : super(key: key);

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final HomeServices homeServices = HomeServices();

  List<File> images = [];
  final _uploadPrescriptionFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  void uploadPrescription() {
    if (_uploadPrescriptionFormKey.currentState!.validate() &&
        images.isNotEmpty) {
      homeServices.uploadPrescription(
        context: context,
        name: productNameController.text,
        presdescription: descriptionController.text,
        age: double.parse(priceController.text),
        images: images,
      );
    }
  }

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
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
            'Add Prescription',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _uploadPrescriptionFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                images.isNotEmpty
                    ? CarouselSlider(
                        items: images.map(
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
                                  'Select Prescription Images',
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
                  controller: productNameController,
                  hintText: 'Patient name',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: descriptionController,
                  hintText: 'Description',
                  maxLines: 7,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: priceController,
                  hintText: 'Patients age',
                ),
               
               
                //  const SizedBox(height: 10),
                // CustomTextField(
                //   controller: Controller,
                //   hintText: 'Gender',
                // ),
                const SizedBox(height: 10),

                // SizedBox(
                //   width: double.infinity,
                //   child: DropdownButton(
                //     value: category,
                //     icon: const Icon(Icons.keyboard_arrow_down),
                //     items: productCategories.map((String item) {
                //       return DropdownMenuItem(
                //         value: item,
                //         child: Text(item),
                //       );
                //     }).toList(),
                //     onChanged: (String? newVal) {
                //       setState(() {
                //         category = newVal!;
                //       });
                //     },
                //   ),
                // ),
                const SizedBox(height: 10),
                CustomButton(
                  text: 'Upload',
                  onTap: uploadPrescription,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
