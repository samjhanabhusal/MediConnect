import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luveen/common/widgets/custom_button.dart';
import 'package:luveen/common/widgets/custom_textfield.dart';
import 'package:luveen/features/auth/screens/auth_screen.dart';
import 'package:luveen/features/auth/services/auth_service.dart';
// import 'package:luveen/Doctorchat/screens/doctorhome.dart';

class Doctorregister extends StatefulWidget {
  const Doctorregister({Key? key}) : super(key: key);

  @override
  State<Doctorregister> createState() => _DoctorregisterState();
}

class _DoctorregisterState extends State<Doctorregister> {
  final AuthService authService = AuthService();
  final TextEditingController _contactnoController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _qualificationController =
      TextEditingController();
  final TextEditingController _specilizationController =
      TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _nmc_noController = TextEditingController();
  
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final _registeDoctorFormKey = GlobalKey<FormState>();



  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _addressController.dispose();
    _qualificationController.dispose();
    _specilizationController.dispose();
    _experienceController.dispose();
    _nmc_noController.dispose();
  }
  void signUpDoctor() {
    authService.signUpDoctor(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text,
        qualification: _qualificationController.text,
        contactno: _contactnoController.text,
        address: _addressController.text,
        specialization: _specilizationController.text,
        experience: _experienceController.text,
        nmc_no: _nmc_noController.text);
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
      body: Container(
        child: SingleChildScrollView(
          // child: Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 35.0, 25.0, 25.0),
             child: Form(
                key: _registeDoctorFormKey,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   "Enter your Name:",
                  //   style: TextStyle(
                  //       fontStyle: FontStyle.normal,
                  //       fontSize: 20,
                  //       color: Colors.black54),
                  // ),
                  // const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: SizedBox(
                      child: TextField(
                        controller: _nameController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: "Enter your Name",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: SizedBox(
                      child: TextField(
                        controller: _emailController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: "Enter your Email",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: SizedBox(
                      child: TextField(
                        controller: _passwordController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: "Enter your Password",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: SizedBox(
                      child: TextField(
                        controller: _contactnoController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: "Enter your Contact No.",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: SizedBox(
                      child: TextField(
                        controller: _addressController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: "Enter your Address",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: SizedBox(
                      child: TextField(
                        controller: _qualificationController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: "Enter your Qualification",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: SizedBox(
                      child: TextField(
                        controller: _specilizationController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: "Enter your Specialized field",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: SizedBox(
                      child: TextField(
                        controller: _experienceController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Enter your Experience",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: SizedBox(
                      child: TextField(
                        controller: _nmc_noController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: "Enter your NMC No.",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(height: 10),
                  // Padding(
                  //   padding: const EdgeInsets.all(0.0),
                  //   child: SizedBox(
                  //     child: TextField(
                  //       // controller: _newpasswordController,
                  //       obscureText: true,
                  //       decoration: InputDecoration(
                  //         labelText: "Enter your Available days",
                  //         border: OutlineInputBorder(),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(height: 10),
                  // Padding(
                  //   padding: const EdgeInsets.all(0.0),
                  //   child: SizedBox(
                  //     child: TextField(
                  //       // controller: _newpasswordController,
                  //       obscureText: true,
                  //       decoration: InputDecoration(
                  //         labelText: "Enter your Available time slot",
                  //         border: OutlineInputBorder(),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 10),
                  CustomButton(
                      text: 'Done',
                      onTap: () {

                       if (_registeDoctorFormKey.currentState!.validate()) {
                              signUpDoctor();
                            }

                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => docotrhome()),
                        // );
                      })
                ],
              )),
        ),
      ),
    );
  }
}