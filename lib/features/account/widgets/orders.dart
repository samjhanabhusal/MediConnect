import 'package:luveen/common/widgets/loader.dart';
import 'package:luveen/constants/global_variables.dart';
import 'package:luveen/features/account/services/account_services.dart';
import 'package:luveen/features/account/widgets/single_product.dart';
import 'package:luveen/features/order_details/screens/order_details.dart';
import 'package:luveen/models/order.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List<Order>? orders;
  final AccountServices accountServices = AccountServices();

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    orders = await accountServices.fetchMyOrders(context: context);
    setState(() {});
  }

  //   void deletePrescription(Pres prescription, int index) {
  //   homeServices.deletePrescription(
  //     context: context,
  //     prescription: prescription,
  //     onSuccess: () {
  //       prescriptions!.removeAt(index);
  //       setState(() {});
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? const Loader()
        : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      left: 15,
                    ),
                    child: const Text(
                      'My Orders',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              // display orders
              Container(
                height: 1000,
                color: Colors.grey.shade100,
                padding: const EdgeInsets.only(
                  left: 5,
                  top: 5,
                  right: 5,
                ),
                child: ListView.builder(
                  itemCount: orders!.length,
                  itemBuilder: (context, index) {
                    final orderData = orders![index];
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 5.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, OrderDetailScreen.routeName,
                              arguments: orders![index],);
                              // arguments: orderData);
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            // borderRadius:
                            //     const BorderRadius.all(Radius.circular(10)),
                            // border: Border.all(
                            //     width: 1.0,
                            //     color: Colors.grey,
                            //     style: BorderStyle.solid),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: <Widget>[
                                        // Row(
                                        //   children: <Widget>[
                                        Text(
                                          "Order ID: ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black54,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 10),
                                        ),

                                        Text(
                                          orderData.id,
                                          // orders[0].id,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black54,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 10),
                                        )
                                        // ],
                                        // ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        // Row(
                                        //   children: <Widget>[
                                        Text(
                                          "Ordered Date: ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black54,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 10),
                                        ),

                                        Text(
                                          // ${orderData.date}
                                          DateFormat().format(
                                            DateTime.fromMillisecondsSinceEpoch(
                                                orderData.orderedAt),
                                            // widget.order.orderedAt),
                                          ),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black54,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 10),
                                        )
                                        // ],
                                        // ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        // Row(
                                        //   children: <Widget>[
                                        Text(
                                          "Total items: ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black54,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 10),
                                        ),

                                        Text(
                                          orderData.quantity
                                              .toString()
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black54,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 10),
                                        )
                                        // ],
                                        // ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        // Row(
                                        //   children: <Widget>[
                                        Text(
                                          "Total: ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.green,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 14),
                                        ),

                                        Text(
                                          orderData.totalPrice.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.green,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 14),
                                        )
                                        // ],
                                        // ),
                                      ],
                                    ),
                                  ],
                                ),
                                Spacer(),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.10,
                                  width:
                                      MediaQuery.of(context).size.height * 0.12,
                                  child: SingleProduct(
                                    image: orders![index].products[0].images[0],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }
}
