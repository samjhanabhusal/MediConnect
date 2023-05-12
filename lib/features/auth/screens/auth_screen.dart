import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localstorage/localstorage.dart';
import 'package:luveen/common/widgets/custom_button.dart';
import 'package:luveen/common/widgets/custom_textfield.dart';
import 'package:luveen/constants/global_variables.dart';
import 'package:luveen/features/auth/screens/Doctorregister.dart';
import 'package:luveen/features/auth/screens/Hospitalregister.dart';
import 'package:luveen/features/auth/screens/forgetpassword.dart';
import 'package:luveen/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:luveen/features/Hospital/Admin/Screens/LandingPage.dart';
// import 'package:luveen/store/actions/authActions.dart';
import 'package:redux/redux.dart';
// import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

// import '../../../store/reducer.dart';

enum Auth {
  signin,
  signup,
}

enum Register { doctor, hospital }

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  // final LocalStorage storage = new LocalStorage('localstorage_app');

  // get store => null;
  // @override
  // void initState() {
  //   super.initState();
  //   new Future.delayed(Duration(seconds: 1), () {
  //     store.dispatch(loadUser(store: store, context: context));
  //   });
  // }

  Register _register = Register.doctor;
  final _registeDoctorFormKey = GlobalKey<FormState>();
  final _registerHospitalFormKey = GlobalKey<FormState>();
  // final AuthService authService = AuthService();
  final TextEditingController _contactnoController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _qualificationController =
      TextEditingController();
  final TextEditingController _specilizationController =
      TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _nmc_noController = TextEditingController();

  // final LocalStorage storage = new LocalStorage('localstorage_app');

  // get store => null;
  // @override
  // void initState() {
  //   super.initState();
  //   new Future.delayed(Duration(seconds: 1), () {
  //     store.dispatch(loadUser(store: store, context: context));
  //   });
  // }

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

  

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
    );
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Logo.png'),
                      fit: BoxFit.fill,
                    ),
                    color: Colors.green.shade500,
                    borderRadius: BorderRadius.all(
                      Radius.circular(80),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
//               StoreConnector<ChatState, String>(
//                   converter: (store) => store.state.errMsg,
//                   onWillChange: (prev, next) {},
//                   builder: (_, errMsg) {
//                     return Container(
//                       padding: const EdgeInsets.only(top: 10),
//                       child: Text("$errMsg",
//                           style: TextStyle(color: Color(0xffff45ee))),
//                     );
//                   }),
// // TextStyle, Text

              ListTile(
                tileColor: _auth == Auth.signup
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  'Create Account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              
              if (_auth == Auth.signup)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _nameController,
                          hintText: 'Name',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Email',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Password',
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                          text: 'Sign Up',
                          onTap: () {
                            if (_signUpFormKey.currentState!.validate()) {
                              signUpUser();
                            }
                          },
                        ),Column(
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.green,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Doctorregister()),
                                );
                              },
                              child: const Text('Register as a Doctor'),
                            ),
                            TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 14,
                              color: Colors.green,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  // builder: (context) => HospitalRegister()),
                                  builder: (context) => HospitalCheck()),
                            );
                          },
                          child: const Text('Register as a Hospital'),
                        ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              //   Container(
              //   child: Center(
              //     child: TextButton(
              //        style: TextButton.styleFrom(
              //         textStyle: const TextStyle(
              //           fontSize: 14,
              //           color: Colors.green,
              //           decoration: TextDecoration.underline,
              //         ),
              //       ),
              //       onPressed: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => Doctorregister()),
              //         );
              //       },
              //       child: const Text('Register as Doctor?'),
              //     ),
              //   ),
              // ),
              ListTile(
                tileColor: _auth == Auth.signin
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  'Sign-In',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              
              if (_auth == Auth.signin)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signInFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Email',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Password',
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                          text: 'Sign In',
                          onTap: () {
                            if (_signInFormKey.currentState!.validate()) {
                              signInUser();
                            }
                          },
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 14,
                              color: Colors.green,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgetPassword()),
                            );
                          },
                          child: const Text('Forgot password?'),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
