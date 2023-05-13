import 'dart:io';

import 'package:flutter/material.dart';
import 'package:luveen/constants/utils.dart';
import 'package:luveen/features/Hospital/Admin/Services/hospital_admin_services.dart';
// import 'package:luveen/features/Hospital/Admin/Screens/MainPage.dart';
import 'package:luveen/features/auth/screens/auth_screen.dart';
import 'package:luveen/providers/category_provider.dart';
import 'package:provider/provider.dart';



//from this simple start page you have access to other different pages
// class StartPage extends StatelessWidget{
//   const StartPage({Key?key}):super(key:key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("AppBar")),
//       body: Row(
//         children: [
//           ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                   builder: (context) => const SelectOptionsPage(),
//                 ));
//               },
//               child: Text("Options")
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                   builder: (context) => const ClientPreferencesPage(),
//                 ));
//               },
//               child: Text("Client Preferences"))
//         ],
//       ),
//     );
//   }

// }


// //on this page you gonna set the checkboxes
// class SelectOptionsPage extends StatelessWidget {
//   const SelectOptionsPage({Key?key}):super(key:key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Select Options')),
//       body: const CheckBoxes()
//     );
//   }
// }

//this pages uses the values which have been set in the screen with the checkboxes
// class ClientPreferencesPage extends StatelessWidget {
//   const ClientPreferencesPage();

//   @override
//   Widget build(BuildContext context) {
//     final myAppState = Provider.of<CategoryProvider>(context);
//     String prefers = myAppState.bhkOptions.join(", ");

//     return Scaffold(
//         appBar: AppBar(title: const Text("Client page")),
//         body: Center(
//             child: Text("Client prefers $prefers real estate in ${myAppState.city}")));
//   }
// }


//this widget is used in SelectOptionsPage
class CheckBoxes extends StatefulWidget {
  const CheckBoxes({Key? key}) : super(key: key);

  @override
  State<CheckBoxes> createState() => _CheckBoxesState();
}

class _CheckBoxesState extends State<CheckBoxes> {
  @override
  Widget build(BuildContext context) {
     final TextEditingController beds_availableController = TextEditingController();
    final TextEditingController hospital_locationController= TextEditingController();
    final TextEditingController locationController= TextEditingController();
    final TextEditingController general_ward_availableController= TextEditingController();
    final TextEditingController general_ward_totalController= TextEditingController();
    final TextEditingController VIP_ward_availableController =TextEditingController();
    final TextEditingController VIP_ward_totalController= TextEditingController();
    final TextEditingController ICU_availableController= TextEditingController();
    final TextEditingController ICU_totalController= TextEditingController();
    final TextEditingController ventilators_totalController= TextEditingController();
    final TextEditingController ventilators_availableController= TextEditingController();


    final HospitalAdminServices hospitaladminServices = HospitalAdminServices();


     List<File> hospital_picture = [];
  final _addBedFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    beds_availableController.dispose();
    hospital_locationController.dispose();
    locationController.dispose();
    general_ward_availableController.dispose();
    general_ward_totalController.dispose();
    VIP_ward_availableController.dispose();
    VIP_ward_totalController.dispose();
    ICU_availableController.dispose();
    ICU_totalController.dispose();
    ventilators_availableController.dispose();
    ventilators_totalController.dispose();
   
  }
void AddBed() {
    if (_addBedFormKey.currentState!.validate() && hospital_picture.isNotEmpty) {
      // hospitaladminServices.AddBed(context: context, hospital_picture: hospital_picture, beds_available: beds_available, hospital_location: hospital_location, location: location, general_ward_total: general_ward_total, general_ward_available: general_ward_available, VIP_ward_total: VIP_ward_total, VIP_ward_available: VIP_ward_available, ICU_total: ICU_total, ICU_available: ICU_available, ventilators_total: ventilators_total, ventilators_available: ventilators_available, name: name, description: description, price: price, quantity: quantity, category: category, images: images)
      hospitaladminServices.AddBed(
        context: context,
        hospital_picture: hospital_picture,
    beds_available:beds_availableController.text,
    hospital_location: hospital_locationController.text,
    location: locationController.text,
    general_ward_total:general_ward_totalController.text,
    general_ward_available:general_ward_availableController.text,
    VIP_ward_total:VIP_ward_totalController.text,
    VIP_ward_available:VIP_ward_availableController.text,
    ICU_total:ICU_totalController.text,
    ICU_available:ICU_availableController.text,
    ventilators_total:ventilators_totalController.text,
    ventilators_available:ventilators_availableController.text,

      );
    }
  }

    final appState = Provider.of<CategoryProvider>(context);


    List<Widget> bedCategoryOptions = <Widget>[
      MyCustomCheckbox(
        text: const Text('General Ward'),
        // controller =
        // value: general_ward_totalController.text(),
value: appState.bhkOptions.contains('2 BHK'),        onChanged: (bool? value) {
            if (value!) {
              //myAppState.selectedBhkOptions
              appState.bhkOptionsAdd('1 BHK');
            } else {
              appState.bhkOptionsRemove('1 BHK');
            }
        },
      ),
      MyCustomCheckbox(
        text: const Text('VIP Ward'),
        value: appState.bhkOptions.contains('2 BHK'),
        onChanged: (bool? value) {
            if (value!) {
              appState.bhkOptionsAdd('2 BHK');
            } else {
              appState.bhkOptionsRemove('2 BHK');
            }
        },
      ),
      MyCustomCheckbox(
        text: const Text('ICU'),
        value: appState.bhkOptions.contains('3 BHK'),
        onChanged: (bool? value) {
            if (value!) {
              appState.bhkOptionsAdd('3 BHK');
            } else {
              appState.bhkOptionsRemove('3 BHK');
            }
        },
      ),
      MyCustomCheckbox(
        text: const Text('Ventilator'),
        // value: appState.bhkOptions.contains('4 BHK'),
        value: appState.bhkOptions.contains('4 BHK'),
        onChanged: (bool? value) {
            if (value!) {
              appState.bhkOptionsAdd('4 BHK');
            } else {
              appState.bhkOptionsRemove('4 BHK');
            }
        },
      ),

    ];
     List<Widget> bedTotalNumber = <Widget>[
     TextFormField(
                  controller: general_ward_totalController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.arrow_right),
                      labelText: 'Total number of beds of this category',
                    )
                  ),
                  TextFormField(
                  controller: general_ward_totalController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.arrow_right),
                      labelText: 'Total number of beds of this category',
                    )
                  ),
                  TextFormField(
                  controller: general_ward_totalController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.arrow_right),
                      labelText: 'Total number of beds of this category',
                    )
                  ),
                  TextFormField(
                  controller: general_ward_totalController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.arrow_right),
                      labelText: 'Total number of beds of this category',
                    )
                  ),
                  
      
     
      
    ];

    return Column(
      children: bedCategoryOptions,
    );
  }
}


//this widget is used in CheckBoxes
class MyCustomCheckbox extends StatefulWidget {
  const MyCustomCheckbox({
   Key?key ,
    required this.text,
    required this.value,
    required this.onChanged,
    this.padding = const EdgeInsets.symmetric(vertical: 8, horizontal: 16)
  }):super(key:key);

  final Text text;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  State<MyCustomCheckbox> createState() => _MyCustomCheckboxState();
}

class _MyCustomCheckboxState extends State<MyCustomCheckbox> {
  @override
  Widget build(BuildContext context) {

     final TextEditingController beds_availableController = TextEditingController();
    final TextEditingController hospital_locationController= TextEditingController();
    final TextEditingController locationController= TextEditingController();
    final TextEditingController general_ward_availableController= TextEditingController();
    final TextEditingController general_ward_totalController= TextEditingController();
    final TextEditingController VIP_ward_availableController =TextEditingController();
    final TextEditingController VIP_ward_totalController= TextEditingController();
    final TextEditingController ICU_availableController= TextEditingController();
    final TextEditingController ICU_totalController= TextEditingController();
    final TextEditingController ventilators_totalController= TextEditingController();
    final TextEditingController ventilators_availableController= TextEditingController();


    final HospitalAdminServices hospitaladminServices = HospitalAdminServices();


     List<File> hospital_picture = [];
  final _addBedFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    beds_availableController.dispose();
    hospital_locationController.dispose();
    locationController.dispose();
    general_ward_availableController.dispose();
    general_ward_totalController.dispose();
    VIP_ward_availableController.dispose();
    VIP_ward_totalController.dispose();
    ICU_availableController.dispose();
    ICU_totalController.dispose();
    ventilators_availableController.dispose();
    ventilators_totalController.dispose();
   
  }
void AddBed() {
    if (_addBedFormKey.currentState!.validate() && hospital_picture.isNotEmpty) {
      // hospitaladminServices.AddBed(context: context, hospital_picture: hospital_picture, beds_available: beds_available, hospital_location: hospital_location, location: location, general_ward_total: general_ward_total, general_ward_available: general_ward_available, VIP_ward_total: VIP_ward_total, VIP_ward_available: VIP_ward_available, ICU_total: ICU_total, ICU_available: ICU_available, ventilators_total: ventilators_total, ventilators_available: ventilators_available, name: name, description: description, price: price, quantity: quantity, category: category, images: images)
      hospitaladminServices.AddBed(
        context: context,
        hospital_picture: hospital_picture,
    beds_available:beds_availableController.text,
    hospital_location: hospital_locationController.text,
    location: locationController.text,
    general_ward_total:general_ward_totalController.text,
    general_ward_available:general_ward_availableController.text,
    VIP_ward_total:VIP_ward_totalController.text,
    VIP_ward_available:VIP_ward_availableController.text,
    ICU_total:ICU_totalController.text,
    ICU_available:ICU_availableController.text,
    ventilators_total:ventilators_totalController.text,
    ventilators_available:ventilators_availableController.text,

      );
    }
  }
   void selectImages() async {
    var res = await pickImages();
    setState(() {
      hospital_picture = res;
    });
  }
    return InkWell(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: Padding(
        padding: widget.padding,
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Expanded(child: widget.text),
                Checkbox(
                  value: widget.value,
                  onChanged: (bool? newValue) {
                    widget.onChanged(newValue!);
                  },
                ),
              ],
            ),
            widget.value
                //.........................................
                //HERE IS THE TextFormField WIDGET
                //.........................................
                ? TextFormField(
                  controller: general_ward_totalController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.arrow_right),
                      labelText: 'Total number of beds of this category',
                    )
                  )
                //SizedBox is just an empty placeholder
                : const SizedBox() 
          ],
        ),
      ),
    );
  }
}