import 'package:flutter/material.dart';
import 'package:luveen/features/account/widgets/orders.dart';

class YourOrders extends StatefulWidget {
  const YourOrders({
    Key? key,
  }) : super(key: key);

  @override
  State<YourOrders> createState() => _YourOrdersState();
}

class _YourOrdersState extends State<YourOrders> {
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
                "My Order",
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
          padding: EdgeInsets.all(8.0),
          child: Orders(),
        ));
  }
}
