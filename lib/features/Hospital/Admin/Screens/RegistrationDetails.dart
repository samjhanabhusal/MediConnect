import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:luveen/features/Hospital/Admin/Screens/IndividualHospital.dart';
import 'package:luveen/features/Hospital/Admin/Screens/MyCustomCheckbox.dart';

class HospitalRegistrationDetails extends StatefulWidget {
  const HospitalRegistrationDetails({super.key});

  @override
  State<HospitalRegistrationDetails> createState() => _HospitalRegistrationDetailsState();
}

class _HospitalRegistrationDetailsState extends State<HospitalRegistrationDetails> {
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              // gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: const Text(
            'Add Bed Information',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          // key: _addBedFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                 const SizedBox(height: 10),
                GestureDetector(
                        // onTap: selectImages,
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
                                  'Select Hospital Picture',
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
                TextField(
                        // controller: _nameController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: "Hospital Name",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        // controller: _nameController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: "Hospital Location",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
                    child: Column(children: [
                     
                    
                   
                       
                     Row(
                      children: <Widget>[
                        // Row(
                        //   children: <Widget>[
                        Text(
                          "Select Categories:",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.green ,
                              fontStyle: FontStyle.normal,
                              fontSize: 20),
                        ),
                       
                        // ],
                        // ),
                      ],
                    ),
                    
                  Container(child: SingleChildScrollView(child: CheckBoxes()))
                    ])
                  )),
                 ElevatedButton(
  onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const IndividualHospital())),
  child: const Text('Done'),
),      
              ],
            ),
          ),
          
        ),
        
      ),
      
    );
  }
}













