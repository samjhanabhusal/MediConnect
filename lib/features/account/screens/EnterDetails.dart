import 'package:flutter/material.dart';
import 'package:luveen/features/account/widgets/Profile.dart';
import 'package:luveen/features/auth/screens/auth_screen.dart';
import 'package:luveen/features/account/services/account_services.dart';
import 'package:luveen/providers/user_provider.dart';
import 'package:provider/provider.dart';

class EnterDetails extends StatefulWidget {
  static const String routeName = '/enter-details';
  const EnterDetails({Key? key}) : super(key: key);

  @override
  State<EnterDetails> createState() => _EnterDetailsState();
}

class _EnterDetailsState extends State<EnterDetails> {
  final _enderDetailFormKey = GlobalKey<FormState>();
  final AccountServices accountServices = AccountServices();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phonenoController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

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
  
  void enterdetail() {
    // if (_enderDetailFormKey.currentState!.validate()) {
      accountServices.enterdetail(
          context: context,
          status: 'true',
          firstname: _firstnameController.text,
          lastname: _lastnameController.text,
          gender: _genderController.text,
          address: _addressController.text,
          age: double.parse(_ageController.text),
          phoneno: double.parse(_phonenoController.text));
    // }
  }
// void contact no (String contactnoFromProider)
  // Widget page = CircularProgressIndicator();

//  @override
//   void initState() {
//     super.initState();
//     checkprofile();
//     // checkStatus();
//   }
//   void checkprofile()async{
//    await ProfileService.checkprofile(context: context);
//    setState(() {
     
//    });
//   }
//  void checkStatus() async {
//   var  status = await accountServices.get(context: context);
//     if(status["status"] == true)
//     {
//     setState(() {
//         page = profile();

//     });
//     }
//     else{
//       setState(( ) {
//         // page = enterdetail();
        
//       });
//     }
//     // page = profile();
//     }
//   }

  // @override
  // Widget build(BuildContext context) {
  //   // var page;
  //   return Scaffold(
  //     body: page,
  //     );
  //    }

  @override
  Widget build(BuildContext context) {
    // final user=Provider.of(UserProvider<>())
        final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
    // @override
  //   Widget enterdetal(){
  //     return 
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
        padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 25.0),
        child: Form(
            key: _enderDetailFormKey,
            child: Column(
              children: [
                const Text(
                  "Enter your details:",
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 25,
                      color: Colors.black54),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: SizedBox(
                    width: 350,
                    height: 45,
                    child: TextField(
                      controller: _firstnameController,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'First name',
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
                      controller: _lastnameController,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Last name',
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
                        labelText: 'Phone number',
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
                const SizedBox(height: 15),
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
          // onTap: EnterDetail,
            // onPressed: () => AccountServices().logOut(context),
            // onPressed: () => { enterdetail(),
          onPressed: ()=> {
            if (_enderDetailFormKey.currentState!.validate()) {
              enterdetail(),
          //   }
          //   },
            // Navigator.push(
              // context,
              // MaterialPageRoute(builder: (context) => AuthScreen()),
            // );
          // },

           // onPressed: () {
          //   if (_enderDetailFormKey.currentState!.validate()) {
          //     EnterDetail();
          //   }
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => AuthScreen()),
          //   );
          // },


          // child: const Icon(Icons.check),

          // child: SimpleDialogOption(
          //       child: const Text('OK'),
          //       onPressed: () {
                  setState(() {
                    if (Provider.of<UserProvider>(context, listen: false)
                        .user
                        .contactno
                        .isEmpty ){
                      accountServices.saveUserContactNo(
                          // context: context, contactno: addressToBeUsed);
                          context: context, contactno: _phonenoController.text);

             } 
             if (Provider.of<UserProvider>(context, listen: false)
                        .user
                        .age
                        .isEmpty ){
                      accountServices.saveUserAge(
                          // context: context, contactno: addressToBeUsed);
                          context: context, age: _ageController.text);
                          
             } 
             }
             
            
             
             ),
                  
                //   // Navigator.pop(context);
                },}
              ),
         
          // ),
      //BUTTON LOCATION
    );
  }

}