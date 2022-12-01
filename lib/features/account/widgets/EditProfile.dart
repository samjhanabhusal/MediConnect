import 'package:flutter/material.dart';
import 'package:luveen/features/account/services/account_services.dart';
import 'package:luveen/providers/user_provider.dart';
import 'package:provider/provider.dart';
class EditProfile extends StatefulWidget {
  static const String routeName = 'edit-profile';
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}
 
class _EditProfileState extends State<EditProfile> {

 final _editDetailFormKey = GlobalKey<FormState>();
  final AccountServices accountServices = AccountServices();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phonenoController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  
  // final TextEditingController _emailController = TextEditingController();
@override
  void dispose() {
    super.dispose();
   _firstnameController.dispose();
    _lastnameController.dispose();
    _addressController.dispose();
    _ageController.dispose();
    _phonenoController.dispose();
    _genderController.dispose();
   
  }
  

  void editdetail()
  {
     accountServices.editdetail(
          context: context,
          status: 'true',
          firstname: _firstnameController.text,
          lastname: _lastnameController.text,
          gender: _genderController.text,
          address: _addressController.text,
         
          // age: double.parse(_ageController.text),
          // phoneno: double.parse(_phonenoController.text),
          age: double.tryParse(_ageController.text)??0,
          phoneno: double.tryParse(_phonenoController.text)??0,
          onSuccess:(){
            setState(() {
              
            });
          },
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0), // here the desired height
        child: AppBar(
          backgroundColor: Colors.green,
          title: new Padding(
            padding: const EdgeInsets.all(2.0),
            child: new Text(
              "Edit Profile",
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0,
                  color: Colors.white),
            ),
          ),
          automaticallyImplyLeading: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
          child: Form(
            key:  _editDetailFormKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(height: 30),
          SizedBox(
            width: 350,
            height: 45,
            child: TextField(
              controller: _firstnameController,
              obscureText: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'FirstName'),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: SizedBox(
              width: 350,
              height: 45,
              child: TextField(
                controller: _lastnameController,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Last Name',
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: SizedBox(
              width: 350,
              height: 45,
              child: TextField(
                controller: _ageController,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Age',
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: SizedBox(
              width: 350,
              height: 45,
              child: TextField(
                controller: _addressController,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Address',
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: SizedBox(
              width: 350,
              height: 45,
              child: TextField(
                controller: _phonenoController,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Contact No',
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: SizedBox(
              width: 350,
              height: 45,
              child: TextField(
                controller: _genderController,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Gender',
                ),
              ),
            ),
          ),
        ])),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          editdetail();
        },
        child: Text('Done'),
        backgroundColor: Colors.green,
      ),
    );
  }
}
