import 'package:flutter/material.dart';
import 'package:luveen/features/account/widgets/EditProfile.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              // Center(
              //   child: Container(
              //       alignment: Alignment.center,
              //       width: 150.0,
              //       height: 150.0,
              //       decoration: BoxDecoration(
              //           image: DecorationImage(
              //             image: AssetImage('assets/KU logo.png'),
              //             fit: BoxFit.fill,
              //           ),
              //           color: Colors.white,
              //           borderRadius: BorderRadius.circular(60.0))),
              // ),
              SizedBox(
                height: 30,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 15, 10, 10),
                    child: Row(
                      children: <Widget>[
                        // Row(
                        //   children: <Widget>[
                        Text(
                          "Username:",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 18),
                        ),
                        Spacer(),
                        Text(
                          "Shalini Gupta",
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
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 15, 10, 10),
                    child: Row(
                      children: <Widget>[
                        // Row(
                        //   children: <Widget>[
                        Text(
                          "Email:",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 18),
                        ),
                        Spacer(),
                        Text(
                          "shalugpt@gmail.com",
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
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 15, 10, 10),
                    child: Row(
                      children: <Widget>[
                        // Row(
                        //   children: <Widget>[
                        Text(
                          "Age:",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 18),
                        ),
                        Spacer(),
                        Text(
                          "21",
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
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 15, 10, 10),
                    child: Row(
                      children: <Widget>[
                        // Row(
                        //   children: <Widget>[
                        Text(
                          "Address:",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 18),
                        ),
                        Spacer(),
                        Text(
                          "Dhulikhel",
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
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 15, 10, 10),
                    child: Row(
                      children: <Widget>[
                        // Row(
                        //   children: <Widget>[
                        Text(
                          "Contact No:",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 18),
                        ),
                        Spacer(),
                        Text(
                          "9801357010",
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
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 15, 10, 10),
                    child: Row(
                      children: <Widget>[
                        // Row(
                        //   children: <Widget>[
                        Text(
                          "Gender:",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 18),
                        ),
                        Spacer(),
                        Text(
                          "female",
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
