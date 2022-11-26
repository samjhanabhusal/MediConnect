import 'package:flutter/material.dart';
import 'package:luveen/features/auth/screens/auth_screen.dart';
import 'package:luveen/features/auth/services/auth_service.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {



 final _enderDetailFormKey = GlobalKey<FormState>();
  final AuthService authServices = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _newpasswordController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();
 

  @override
  void dispose() {
    super.dispose();
   _emailController.dispose();
    _newpasswordController.dispose();
    _confirmpasswordController.dispose();
   
  }
  // @override
  // void dispose() {
  //   _firstnameController.dispose();
  //   _lastnameController.dispose();
  //   _addressController.dispose();
  //   _ageController.dispose();
  //   _phonenoController.dispose();
  //   _genderController.dispose();
  // } 
  
// late bool status;
 
//  void checkprofile() async{

//  }
  
  void changepassword() {
    // if (_enderDetailFormKey.currentState!.validate()) {
      authServices.updatepassword(
          context: context,
          // status: 'true',
          email: _emailController.text,
          newpassword: _newpasswordController.text,
          confirmpassword: _confirmpasswordController.text
      );
         
         
    // }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0), // here the desired height
        child: AppBar(
          title: new Padding(
            padding: const EdgeInsets.only(left: 200.0),
            child: new Text(
              "Luveen",
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 30.0,
                  color: Colors.white),
            ),
          ),
          automaticallyImplyLeading: true,
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 35.0, 25.0, 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter your email address:",
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                    color: Colors.black54),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: SizedBox(
                  child: TextField(
                    controller: _emailController,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              const Text(
                "Create a new password:",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                    color: Colors.black54),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: SizedBox(
                  child: TextField(
                    controller: _newpasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              const Text(
                "Re-type your password:",
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                    color: Colors.black54),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: SizedBox(
                  child: TextField(
                    controller: _confirmpasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 35),
            ],
          )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
          changepassword();
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => AuthScreen()),
            // );
          },
          child: const Icon(Icons.check)),
      //BUTTON LOCATION
    );
  }
}
