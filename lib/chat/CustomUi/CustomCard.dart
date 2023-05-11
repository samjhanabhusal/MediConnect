import 'package:luveen/chat/services/chatservices.dart';
import 'package:luveen/common/widgets/loader.dart';
import 'package:luveen/constants/global_variables.dart';
import 'package:luveen/models/Doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luveen/constants/global_variables.dart';
import 'package:luveen/models/user.dart';
import '../../providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:luveen/chat/Screens/IndividualPage.dart';
// import 'package:luveen/chat/Screens/IndividualPage.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.doctors, }) : super(key: key);

  final Doctor doctors;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IndividualPage(
              doctors: doctors,
            ),
          ),
        );
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: SvgPicture.asset(
                "assets/images/person.svg",
                color: Colors.white,
                height: 36,
                width: 36,
              ),
              backgroundColor: Colors.blueGrey,
            ),
            title: Text(
              doctors.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(
                  width: 3,
                ),
                Text(
                  doctors.currentMessage,
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            trailing: Text(doctors.time),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 80),
            child: Divider(
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
