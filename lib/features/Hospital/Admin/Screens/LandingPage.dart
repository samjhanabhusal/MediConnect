// yo page appears just after yo click register a hospital
import 'package:flutter/material.dart';
// import 'package:hospital_beds/HospitalAdmin/RegistrationPage.dart';
import 'package:luveen/features/auth/screens/Hospitalregister.dart';
import 'package:luveen/features/auth/services/auth_service.dart';
 class HospitalCheck extends StatefulWidget {
  const HospitalCheck({super.key});

  @override
  State<HospitalCheck> createState() => _HospitalCheckState();
}

class _HospitalCheckState extends State<HospitalCheck> {
  final TextEditingController _hospitalnameController = TextEditingController();
 final AuthService authService = AuthService();
   final _checkHospitalFormKey = GlobalKey<FormState>();


  @override
  void dispose(){
    super.dispose();
    _hospitalnameController.dispose();
  }

bool check = false;
 void checkHospital() {
    authService.checkHospital(
        context: context,
        check: false,
        name: _hospitalnameController.text,
        onSuccess:(){
          check = true;
           setState(() {
              
            });

        },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
  appBar:PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          // here the desired height
          child:AppBar(
  
  title: Text('Welcome!', style: TextStyle(fontStyle: FontStyle.normal,fontSize: 25,color: Colors.white
          ),),
  actions: [
    Icon(Icons.more_vert),
  ],
  backgroundColor: Colors.green,
),

  ),
  body: Padding(padding: const EdgeInsets.fromLTRB(20, 50, 15, 25),
  
    child: Column(children: [
          
          const Text("Enter the Hospital name/ID", style: TextStyle(fontStyle: FontStyle.normal,fontSize: 25,color: Colors.black45
          ),),
          SizedBox(height: 10,),
          TextFormField(
            controller: _hospitalnameController,
                    decoration: InputDecoration(
                        
                        // suffixIcon: Icon(Icons.camera_alt)
                        
                        ),
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(
            onPressed: () {
              if (_checkHospitalFormKey.currentState!.validate()) {
                              checkHospital();

              
              }
              if (check == true) {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Verified!"),
                  content: const Text(" To move forward with the registration"),
                  actions: <Widget>[
                    TextButton(
         onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const HospitalRegister(), )),
        child: const Text('Click Here', style: TextStyle( decoration: TextDecoration. underline,),textAlign: TextAlign.center),
      ),
                  ],
                ),
              );}
              else {
                showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Unverified!"),
                  content: const Text("No Hospital is registered under that name"),
                  
                ),
              );
              }

            },
            child: const Text("Check"),
          ),
          



           
    ],),
  ),
     
      //BUTTON LOCATION
      
);

}
}