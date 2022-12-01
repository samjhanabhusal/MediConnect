import 'package:luveen/constants/global_variables.dart';
import 'package:luveen/features/account/widgets/below_app_bar.dart';
import 'package:luveen/features/account/widgets/orders.dart';
import 'package:luveen/features/account/widgets/top_buttons.dart';
import 'package:luveen/features/home/widgets/Products.dart';
// import 'package:luveen/features/home/widgets/productcheck.dart';
// import 'package:luveen/features/home/widgets/tempCodeRunnerFile.dart';
import 'package:flutter/material.dart';
import 'package:luveen/features/home/services/home_services.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Luveen',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                // Container(
                //   padding: const EdgeInsets.only(left: 15, right: 15),
                //   child: Row(
                //     children: const [
                //       Padding(
                //         padding: EdgeInsets.only(right: 15),
                //         child: Icon(Icons.notifications_outlined),
                //       ),
                //       Icon(
                //         Icons.search,
                //       ),
                //     ],
                //   ),
                // )
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              BelowAppBar(),
              SizedBox(height: 10),
              TopButtons(),
              SizedBox(height: 10),
              Orders(),
              //  Productie()
            ]),
          ),
        ],
      ),
    );
  }
}
