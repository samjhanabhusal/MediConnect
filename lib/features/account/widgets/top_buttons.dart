// import 'package:luveen/features/account/services/account_services.dart';
// import 'package:luveen/features/account/widgets/Profile.dart';
// import 'package:luveen/features/account/widgets/account_button.dart';
// import 'package:flutter/material.dart';
// import 'package:luveen/features/account/widgets/orders.dart';
// import 'package:luveen/features/account/widgets/yourorders.dart';

// class TopButtons extends StatelessWidget {
//   const TopButtons({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             AccountButton(
//               text: 'My Profile',
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const profile()),
//                 );
//               },
//             ),
//             AccountButton(
//               text: 'Log Out',
//               onTap: () => AccountServices().logOut(context),
//             ),
//           ],
//         ),
//         const SizedBox(height: 10),
//       ],
//     );
//   }
// }



import 'package:luveen/features/account/screens/EnterDetails.dart';
// import 'package:luveen/features/account/screens/profileScreen.dart';
import 'package:luveen/features/account/services/account_services.dart';
import 'package:luveen/features/account/widgets/Profile.dart';
import 'package:luveen/features/account/widgets/ViewProfile.dart';
import 'package:luveen/features/account/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({Key? key}) : super(key: key);

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  var response;
    final AccountServices accountServices = AccountServices();

//  @override
//   void initState() {
//     super.initState();
//     // checkprofile();
//     fetchStatus();
// //   }
 @override
  void initState() {
    super.initState();
    // checkprofile();
    fetchStatus();
  }
//  void checkprofile() async{

//  }
  void fetchStatus() async {
   dynamic status = await accountServices.get(context: context);
    print(status);
    // log(status);
        setState(() {

          response = status;
          print(response);
          
        });
          // if(status['status'] == true)
          // if(status == true){
          //  setState(() {
          //   Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => const profile()),
          //       );
          // });
          // }
          // else{
          //   setState(() {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => const EnterDetails()),
          //       );
          //   });
             
          // }

  }
  
  
  @override
  Widget build(BuildContext context) {
    return Row(
          children: [
            // AccountButton(
            //   text: 'Your Orders',
            //   onTap: () {},
            // ),
            AccountButton(
              text: 'Your Profile',
              onTap: () {
                 if(response == true)
                 {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  const ViewProfile()),
                  );
                 }
                 else{ Navigator.push(
                  context,
                  // MaterialPageRoute(builder: (context) =>  ProfileScreen()),
                  MaterialPageRoute(builder: (context) =>  EnterDetails()),
                ); }
                
              },
            ),
            AccountButton(
              text: 'Log Out',
              onTap: () => AccountServices().logOut(context),
           ),
         const SizedBox(height: 10)
       ],
        // const SizedBox(height: 10),
        
            // AccountButton(
            //   text: 'Your Wish List',
            //   onTap: () {},
            // ),
          // ],
        );
      // ];
    // )
  }
}
