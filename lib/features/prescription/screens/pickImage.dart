import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:get/get.dart';


class PickImage extends StatefulWidget {
  const PickImage({Key? key}) : super(key: key);

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
 File? image;
Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
if(image == null) return;
final imageTemp = File(image.path);
setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  } 

 
Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
if(image == null) return;
final imageTemp = File(image.path);
setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }    
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prescription"),
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Column(
          children: [
            MaterialButton(
                color: Colors.green,
                child: const Text(
                    "Pick Image from Gallery",
                  style: TextStyle(
                    color: Colors.white70, fontWeight: FontWeight.bold
                  )
                ),
                onPressed: () { pickImage();
                }
            ),
            MaterialButton(
                color: Colors.green,
                child: const Text(
                    "Pick Image from Camera",
                    style: TextStyle(
                        color: Colors.white70, fontWeight: FontWeight.bold
                    )
                ),
                onPressed: () { pickImageC();
                }
            ),
            SizedBox(height: 20,),
            image !=null? Image.file(image!):Text('No Image Selected')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Get.back( result: "Data after returning to first page"),
        child: const Icon(Icons.check)
      ),
    );
  }}
        