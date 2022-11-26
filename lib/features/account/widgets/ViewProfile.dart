import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:luveen/features/account/services/account_services.dart';

import 'package:luveen/features/account/widgets/EditProfile.dart';
import 'package:luveen/models/profile.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/loader.dart';
import '../../../providers/user_provider.dart';
class ViewProfile extends StatefulWidget {
  const ViewProfile({Key? key}) : super(key: key);

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
   List<Profile> ? profilee;
  // Profile ? profilenfo;
  final AccountServices accountServices = AccountServices();
   @override
  void initState() {
    super.initState();
    // checkprofile();
    fetchProfile();
  }
//  void checkprofile() async{

//  }
  void fetchProfile() async {
    profilee = await accountServices.fetchMyProfile(context: context);
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
        final user = Provider.of<UserProvider>(context).user;

   final profileinfo = profilee![0];

    return  profilee == null
        ? const Loader()
        :Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0), // here the desired height
        child: AppBar(
          backgroundColor: Colors.green,
          title: new Padding(
            padding: const EdgeInsets.only(right: 150.0),
            child: new Text(
              "Profile",
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
        padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EditProfile()),
                        );
                      },
                      icon: Icon(
                        Icons.edit,
                        size: 16.0,
                      ),
                      label: Text(
                        'Edit profile',
                        style: TextStyle(fontSize: 16.0),
                      ))
                ],
              ),
              Center(
                child: Container(
                    alignment: Alignment.center,
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/KU logo.png'),
                          fit: BoxFit.fill,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(60.0))),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 215, 247, 217),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 15, 10, 10),
                    child: Row(
                      children: <Widget>[
                        // Row(
                        //   children: <Widget>[
                        Text(
                          // profilee[0].firstname,
                          // profilee![0].firstname,
                                  "Username:  ",

                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 18),
                        ),
                        Spacer(),
                        
                        Text(
                          // "Shalini Gupta",
                          // profilee[0].lastname,
                          // profileinfo.lastname,
                          user.name,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 18),
                        )
                        // ],
                        // ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 215, 247, 217),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 15, 10, 10),
                    child: Row(
                      children: <Widget>[
                        // Row(
                        //   children: <Widget>[
                        Text(
                          "Email:  ",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 18),
                        ),
                        Spacer(),
                        Text(
                          // "shalugpt@gmail.com",
                          // profileinfo.lastname,
                          user.email,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 18),
                        )
                        // ],
                        // ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 215, 247, 217),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 15, 10, 10),
                    child: Row(
                      children: <Widget>[
                        // Row(
                        //   children: <Widget>[
                        Text(
                          "Age  ",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 18),
                        ),
                        Spacer(),
                        Text(
                          // "21",
                          // profileinfo![0].age,
                          profileinfo.age.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 18),
                        )
                        // ],
                        // ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 215, 247, 217),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 15, 10, 10),
                    child: Row(
                      children: <Widget>[
                        // Row(
                        //   children: <Widget>[
                        Text(
                          "Address:  ",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 18),
                        ),
                        Spacer(),
                        Text(
                          // "Dhulikhel",
                         profileinfo.address,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 18),
                        )
                        // ],
                        // ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 215, 247, 217),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 15, 10, 10),
                    child: Row(
                      children: <Widget>[
                        // Row(
                        //   children: <Widget>[
                        Text(
                          "Contact No.:  ",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 18),
                        ),
                        Spacer(),
                        Text(
                          // "9801357010",
                          // profileinfo![0].phoneno,
                          profileinfo.phoneno.toString(),

                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 18),
                        )
                        // ],
                        // ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 215, 247, 217),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 15, 10, 10),
                    child: Row(
                      children: <Widget>[
                        // Row(
                        //   children: <Widget>[
                        Text(
                          "Gender:  ",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 18),
                        ),
                        Spacer(),
                        Text(
                          // "female",
                           profileinfo.gender,

                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 18),
                        )
                      ],
                    ),
                  )),
            ]),
      ),
    );
  }
}
